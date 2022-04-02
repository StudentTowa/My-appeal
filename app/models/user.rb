class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        
        validates :name, presence: true 
        validates :profile, length: { maximum: 200 }
        
        has_many :musicpresents, dependent: :destroy
        has_many :sportspresents, dependent: :destroy
        has_many :moviepresents, dependent: :destroy
        has_many :sweetspresents, dependent: :destroy
        has_many :skillpresents, dependent: :destroy
        has_many :relaxpresents, dependent: :destroy
        
        
        has_many :likes, dependent: :destroy
        has_many :liked_musicpresents, through: :likes, source: :musicpresent
        has_many :comments, dependent: :destroy

        has_many :sportslikes, dependent: :destroy
        has_many :liked_sportspresents, through: :sportslikes, source: :sportspresent
        has_many :sportscomments, dependent: :destroy

        has_many :movielikes, dependent: :destroy
        has_many :liked_moviepresents, through: :movielikes, source: :moviepresent
        has_many :moviecomments, dependent: :destroy

        has_many :sweetslikes, dependent: :destroy
        has_many :liked_sweetspresents, through: :sweetslikes, source: :sweetspresent
        has_many :sweetscomments, dependent: :destroy

        has_many :skilllikes, dependent: :destroy
        has_many :liked_skillpresents, through: :skilllikes, source: :skillpresent
        has_many :skillcomments, dependent: :destroy


        has_many :relaxlikes, dependent: :destroy
        has_many :liked_relaxpresents, through: :relaxlikes, source: :relaxpresent
        has_many :relaxcomments, dependent: :destroy
        
        

        

        def already_liked?(musicpresent)
          self.likes.exists?(musicpresent_id: musicpresent.id)
        end

        def already_sportsliked?(sportspresent)
          self.sportslikes.exists?(sportspresent_id: sportspresent.id)
        end

        def already_movieliked?(moviepresent)
          self.movielikes.exists?(moviepresent_id: moviepresent.id)
        end

        def already_sweetsliked?(sweetspresent)
          self.sweetslikes.exists?(sweetspresent_id: sweetspresent.id)
        end

        def already_skillliked?(skillpresent)
          self.skilllikes.exists?(skillpresent_id: skillpresent.id)
        end
        
        def already_relaxliked?(relaxpresent)
          self.relaxlikes.exists?(relaxpresent_id: relaxpresent.id)
        end


        

end
