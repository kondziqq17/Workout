class Workout < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :reviews

  has_attached_file :workout_img, styles: { :workout_index => "250x350>", :workout_show => "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :workout_img, content_type: /\Aimage\/.*\Z/
end

