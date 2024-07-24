class Post < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }
  validates :title, :body, presence: true

  after_create_commit -> { broadcast_prepend_to "posts" }

end
