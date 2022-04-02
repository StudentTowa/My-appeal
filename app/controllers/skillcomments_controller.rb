class SkillcommentsController < ApplicationController
    def create
    skillpresent = Skillpresent.find(params[:skillpresent_id])
    skillcomment = skillpresent.skillcomments.build(skillcomment_params) 
    skillcomment.user_id = current_user.id
        if skillcomment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
        else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        Skillcomment.find(params[:skillpresent_id]).destroy
        redirect_back(fallback_location: root_path)
    end


    private

    def skillcomment_params
        params.require(:skillcomment).permit(:content)
    end
end
