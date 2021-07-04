class CreateUserDates < ActiveRecord::Migration[5.2]
  def change
    create_table :user_dates do |t|
      
      t.integer :user_id
      t.integer :body_weight
      t.integer :body_fat
      t.string :body_image
      t.datetime :start_time
      
      t.timestamps
    end
  end
end
