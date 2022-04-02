class Moviecomment < ApplicationRecord
  belongs_to :user
  belongs_to :moviepresent
end
