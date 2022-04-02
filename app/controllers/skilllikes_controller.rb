class SkilllikesController < ApplicationController
    def create
        skilllike = current_user.skilllikes.create(skillpresent_id: params[:skillpresent_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        skilllike = Skilllike.find_by(skillpresent_id: params[:skillpresent_id], user_id: current_user.id)
        skilllike.destroy
        redirect_back(fallback_location: root_path)
    end
end
