class Skilllike < ApplicationRecord
  belongs_to :skillpresent
  belongs_to :user

  validates_uniqueness_of :skillpresent_id, scope: :user_id
end
