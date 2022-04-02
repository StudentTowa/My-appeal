class Movielike < ApplicationRecord
  belongs_to :moviepresent
  belongs_to :user

  validates_uniqueness_of :moviepresent_id, scope: :user_id
end
