class Task < ApplicationRecord
    def to_pleasant_string
        is_completed = completed ? "✅" : "❌"
        "#{is_completed} - #{text} (#{due_date.strftime("%B %d %Y")})"
    end
end
