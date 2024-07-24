class Post < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }
  validates :title, :body, presence: true

  after_create_commit -> { broadcast_prepend_to "posts" }
  after_update_commit -> { broadcast_replace_to "posts" }
  after_destroy_commit -> { broadcast_remove_to "posts" }

end
