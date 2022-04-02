class Relaxpresent < ApplicationRecord
    belongs_to :user
    has_many :relaxlikes, dependent: :destroy
    has_many :liked_users, through: :relaxlikes, source: :user
    mount_uploader :image, ImageUploader

    has_many :relaxcomments, dependent: :destroy
end
