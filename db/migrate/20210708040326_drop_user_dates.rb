class DropUserDates < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_dates
  end
end
