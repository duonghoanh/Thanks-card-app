class Feed < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  scope :newest, -> { order(created_at: :asc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500}
end

