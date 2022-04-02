class Relaxlike < ApplicationRecord
  belongs_to :relaxpresent
  belongs_to :user


  validates_uniqueness_of :relaxpresent_id, scope: :user_id
end
