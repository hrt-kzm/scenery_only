class Picture < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :picture_comments, dependent: :destroy

  has_one_attached :scene_image

  validates :title, presence: true
  validates :location, presence: true
  validates :produce, length: { maximum: 200 }

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def get_scene_image
    (scene_image.attached?) ? scene_image : 'no_image.jpeg'
  end

end