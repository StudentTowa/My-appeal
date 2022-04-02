class SportscommentsController < ApplicationController
    before_action :authenticate_user!

    def create
    sportspresent = Sportspresent.find(params[:sportspresent_id])
    sportscomment = sportspresent.sportscomments.build(sportscomment_params) #buildを使い、contentとtweet_idの二つを同時に代入
    sportscomment.user_id = current_user.id
    if sportscomment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
    else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
    end
    end

    def destroy
        Sportscomment.find(params[:sportspresent_id]).destroy
        redirect_back(fallback_location: root_path)
    end

    private

    def sportscomment_params
        params.require(:sportscomment).permit(:content)
    end
end
