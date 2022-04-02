class MoviecommentsController < ApplicationController
    def create
        moviepresent = Moviepresent.find(params[:moviepresent_id])
        moviecomment = moviepresent.moviecomments.build(moviecomment_params) 
        moviecomment.user_id = current_user.id
        if moviecomment.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path)
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path)
        end
        end
    

        def destroy
            Moviecomment.find(params[:moviepresent_id]).destroy
            redirect_back(fallback_location: root_path)
        end

        private
    
        def moviecomment_params
            params.require(:moviecomment).permit(:content)
        end
end
