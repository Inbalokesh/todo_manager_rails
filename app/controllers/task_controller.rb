class TaskController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render plain: "Welcome to rails! #{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}"
    end

    def addtask
        task = Task.new
        task.text = params[:text]
        task.due_date = params[:due_date]
        task.completed = false

        if task.save
            @response={
                :message =>"Task Created",
                :task =>task
            }
            render json: @response
        else
            render json: { errors: task.errors.full_message }, status: 400
        end
    end
end
