class AddToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :integer, default: 0, null: false
    add_column :users, :height, :integer, default: 0
    add_column :users, :body_weight, :integer, default: 0
    add_column :users, :introduction, :text
    add_column :users, :profile_image, :string
  end
end
