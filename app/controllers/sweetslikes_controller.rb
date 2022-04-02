class SweetslikesController < ApplicationController
    def create
        sweetslike = current_user.sweetslikes.create(sweetspresent_id: params[:sweetspresent_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        sweetslike = Sweetslike.find_by(sweetspresent_id: params[:sweetspresent_id], user_id: current_user.id)
        sweetslike.destroy
        redirect_back(fallback_location: root_path)
    end
end
