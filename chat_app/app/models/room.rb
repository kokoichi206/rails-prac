class Room < ApplicationRecord
  validates_uniquness_of :name
  scope: public_rooms, ->{ where(is_private: false) }
end
