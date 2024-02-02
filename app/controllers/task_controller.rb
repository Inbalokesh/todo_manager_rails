class TaskController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        # render plain: Task.all.map { |task| task.to_pleasant_string }.join("\n\n")
        render "index"
    end

    def show
        id = params[:id]
        task = Task.find(id)
        render plain: task.to_pleasant_string
    end

    def create
        subject = params[:subject]
        due_date = DateTime.parse(params[:date])
        new_task = Task.create!(
            text: subject,
            due_date: due_date,
            completed: false,
        )
        redirect_to task_path
    end
end
