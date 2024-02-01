class TaskController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render plain: Task.all.map { |task| task.to_pleasant_string }.join("\n\n")
    end

    def show
        id = params[:id]
        task = Task.find(id)
        render plain: task.to_pleasant_string
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
