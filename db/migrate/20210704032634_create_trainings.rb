class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.integer :user_id
      t.datetime :start_time

      t.timestamps
    end
  end
end
