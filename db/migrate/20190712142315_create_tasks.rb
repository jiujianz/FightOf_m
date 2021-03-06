class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string     :content,                null: false
      t.string     :description,            null: false
      t.references :user,                   foreign_key: true
      t.datetime   :completed_at

      t.timestamps
    end
  end
end
