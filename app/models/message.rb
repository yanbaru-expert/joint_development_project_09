class Message < ApplicationRecord
  validates :title, presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 140 }

end
