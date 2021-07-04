class CreateTrainingContents < ActiveRecord::Migration[5.2]
  def change
    create_table :training_contents do |t|
      t.integer :training_id
      t.integer :menu_id
      t.integer :set
      t.integer :weight
      t.integer :rep

      t.timestamps
    end
  end
end
