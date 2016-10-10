class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :hiring_date
      t.integer :user_id

      t.timestamps
    end
  end
end
