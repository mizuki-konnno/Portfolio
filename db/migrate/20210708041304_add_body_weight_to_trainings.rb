class AddBodyWeightToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :body_weight, :integer, :default => 0
    add_column :trainings, :body_fat, :integer, :default => 0
  end
end
