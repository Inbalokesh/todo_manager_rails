class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :text
      t.date :due_date
      t.boolean :completed

      t.timestamps
    end
  end
end
