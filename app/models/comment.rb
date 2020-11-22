class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :artwork

  validates :text, presence: true

end
