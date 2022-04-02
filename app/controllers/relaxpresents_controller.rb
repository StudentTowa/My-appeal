class RelaxpresentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

    def index
        if params[:search] == nil
            @relaxes= Relaxpresent.all.order(created_at: :desc)
            @rank_relaxes = Relaxpresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        elsif params[:search] == ''
            @relaxes= Relaxpresent.all.order(created_at: :desc)
            @rank_relaxes = Relaxpresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        else
        
            @relaxes =Relaxpresent.where("body LIKE ? ",'%' + params[:search] + '%').order(created_at: :desc)
            @rank_relaxes = Relaxpresent.where("body LIKE ? ",'%' + params[:search] + '%').sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        end

    end



    def new
    @relax=Relaxpresent.new
    end

    def create
        relaxpresent =Relaxpresent.new(relaxpresent_params)
        relaxpresent.user_id = current_user.id
        if relaxpresent.save
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end

    def show
        @relax = Relaxpresent.find(params[:id])
        @relaxcomments = @relax.relaxcomments
        @relaxcomment = Relaxcomment.new

    end
    
    def edit
        @relax = Relaxpresent.find(params[:id])
    end

    def update
        relaxpresent = Relaxpresent.find(params[:id])
        if relaxpresent.update(relaxpresent_params)
            redirect_to :action => "show", :id =>  relaxpresent.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        relaxpresent = Relaxpresent.find(params[:id])
        relaxpresent.destroy
        redirect_to action: :index
        end
    
    private
    def relaxpresent_params
        params.require(:relaxpresent).permit(:body, :title, :image)
    end
end
