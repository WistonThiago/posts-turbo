class Post < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }
  validates :title, :body, presence: true
end
