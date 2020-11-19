class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates :content, length: { in: 4..500 }
end
