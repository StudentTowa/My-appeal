class Sweetslike < ApplicationRecord
  belongs_to :user
  belongs_to :sweetspresent

  validates_uniqueness_of :sweetspresent_id, scope: :user_id
end
