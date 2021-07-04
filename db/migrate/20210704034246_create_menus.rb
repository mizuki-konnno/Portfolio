class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|

      t.string :training_menu

      t.timestamps
    end
  end
end
