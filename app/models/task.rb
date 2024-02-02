require 'date'
class Task < ApplicationRecord
    def to_pleasant_string
        is_completed = completed ? "✅" : "❌"
        "#{is_completed} - #{text} (#{due_date.strftime("%B %d %Y")})"
    end

    def self.overdue
        all.where("due_date < ?", Date.today)
    end
    
    def self.due_today
        all.where("due_date = ?", Date.today)
    end
    
    def self.due_later
        all.where("due_date > ?", Date.today)
    end

    def self.completed
        all.where(completed: true)
    end

    def released_on=date
        super Date.strptime(date, '%m/%d/%Y')
    end
end
