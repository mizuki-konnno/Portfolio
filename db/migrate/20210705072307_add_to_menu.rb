class AddToMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :user_id, :integer
  end
end
