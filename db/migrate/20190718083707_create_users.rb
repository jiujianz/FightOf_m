class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string    :name,                        null: false, unique: true, index: true
      t.string    :email,                       null: false, unique: true
      t.string    :password_digest
      t.string    :remember_digest
      t.datetime  :created_at
      t.datetime  :updated_at
      t.boolean   :admin,                        defalt: false

      t.timestamps null: false
    end
  end
end
