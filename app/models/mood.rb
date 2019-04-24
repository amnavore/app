class Mood < ApplicationRecord
  has_and_belongs_to_many :resturants
end
