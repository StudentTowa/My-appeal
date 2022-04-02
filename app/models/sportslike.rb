class Sportslike < ApplicationRecord
  belongs_to :user
  belongs_to :sportspresent

  validates_uniqueness_of :sportspresent_id, scope: :user_id
end
