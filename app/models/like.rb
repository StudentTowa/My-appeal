class Like < ApplicationRecord
  belongs_to :musicpresent
  belongs_to :user

  validates_uniqueness_of :musicpresent_id, scope: :user_id
end
