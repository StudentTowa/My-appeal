class RelaxlikesController < ApplicationController
    def create
        relaxlike = current_user.relaxlikes.create(relaxpresent_id: params[:relaxpresent_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        relaxlike = Relaxlike.find_by(relaxpresent_id: params[:relaxpresent_id], user_id: current_user.id)
        relaxlike.destroy
        redirect_back(fallback_location: root_path)
    end
end
