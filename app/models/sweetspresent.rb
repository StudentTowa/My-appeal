class Sweetspresent < ApplicationRecord
    belongs_to :user
    has_many :sweetslikes, dependent: :destroy
    has_many :liked_users, through: :sweetslikes, source: :user
    mount_uploader :image, ImageUploader

    has_many :sweetscomments, dependent: :destroy
end
