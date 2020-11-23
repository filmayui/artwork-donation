class RoomMessage < ApplicationRecord

  belongs_to :artist
  belongs_to :donation_project_room

  validates :text, presence: true
  
end