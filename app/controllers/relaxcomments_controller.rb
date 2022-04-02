class RelaxcommentsController < ApplicationController
    before_action :authenticate_user!

    def create
    relaxpresent = Relaxpresent.find(params[:relaxpresent_id])
    relaxcomment = relaxpresent.relaxcomments.build(relaxcomment_params) #buildを使い、contentとtweet_idの二つを同時に代入
    relaxcomment.user_id = current_user.id
    if relaxcomment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
    else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
    end
    end


    def destroy
        Relaxcomment.find(params[:relaxpresent_id]).destroy
        redirect_back(fallback_location: root_path)
    end

    private

    def relaxcomment_params
        params.require(:relaxcomment).permit(:content)
    end
end
