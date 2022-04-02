class Moviepresent < ApplicationRecord
    belongs_to :user
    has_many :movielikes, dependent: :destroy
    has_many :liked_users, through: :movielikes, source: :user
    mount_uploader :image, ImageUploader

    has_many :moviecomments, dependent: :destroy
end
