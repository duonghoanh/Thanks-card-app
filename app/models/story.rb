class Story < ApplicationRecord
  belongs_to :use
  validates :title, presence: true
  validates :body, presence: true
end
