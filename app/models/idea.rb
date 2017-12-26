class Idea < ApplicationRecord
  validates :title, :body, presence: true
  validates :body, length: { maximum: 140 }
end
