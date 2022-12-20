class PictureComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :picture
  
  validates :comment, presence: true
  
end
