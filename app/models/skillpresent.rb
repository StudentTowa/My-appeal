class Skillpresent < ApplicationRecord
    belongs_to :user
    has_many :skilllikes, dependent: :destroy
    has_many :liked_users, through: :skilllikes, source: :user
    mount_uploader :image, ImageUploader

    has_many :skillcomments, dependent: :destroy
end
