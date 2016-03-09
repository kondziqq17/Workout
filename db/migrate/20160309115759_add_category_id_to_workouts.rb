class AddCategoryIdToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :category_id, :integer
  end
end
