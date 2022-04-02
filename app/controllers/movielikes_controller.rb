class MovielikesController < ApplicationController
    def create
        movielike = current_user.movielikes.create(moviepresent_id: params[:moviepresent_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        movielike = Movielike.find_by(moviepresent_id: params[:moviepresent_id], user_id: current_user.id)
        movielike.destroy
        redirect_back(fallback_location: root_path)
    end
end
