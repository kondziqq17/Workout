class AddAttachmentWorkoutImgToWorkouts < ActiveRecord::Migration
  def self.up
    change_table :workouts do |t|
      t.attachment :workout_img
    end
  end

  def self.down
    remove_attachment :workouts, :workout_img
  end
end
