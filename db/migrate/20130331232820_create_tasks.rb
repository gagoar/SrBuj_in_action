class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.string  :content
      t.date    :done_at

      t.timestamps
    end
  end
end
