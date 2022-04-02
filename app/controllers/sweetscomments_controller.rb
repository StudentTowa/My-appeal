class SweetscommentsController < ApplicationController
    def create
        sweetspresent = Sweetspresent.find(params[:sweetspresent_id])
        sweetscomment = sweetspresent.sweetscomments.build(sweetscomment_params) 
        sweetscomment.user_id = current_user.id
        if sweetscomment.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path)
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path)
        end
        end

        def destroy
            Sweetscomment.find(params[:sweetspresent_id]).destroy
            redirect_back(fallback_location: root_path)
        end
    
        private
    
        def sweetscomment_params
            params.require(:sweetscomment).permit(:content)
        end
end
