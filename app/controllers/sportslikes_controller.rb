class SportslikesController < ApplicationController
    def create
        sportslike = current_user.sportslikes.create(sportspresent_id: params[:sportspresent_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        sportslike = Sportslike.find_by(sportspresent_id: params[:sportspresent_id], user_id: current_user.id)
        sportslike.destroy
        redirect_back(fallback_location: root_path)
    end
    
end
