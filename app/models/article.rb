class Article < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :title,  presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 2000 }
end
