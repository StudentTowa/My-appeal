class SportspresentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

    def index
        if params[:search] == nil
            @sports= Sportspresent.all.order(created_at: :desc)
            @rank_sports = Sportspresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        elsif params[:search] == ''
            @sports= Sportspresent.all.order(created_at: :desc)
            @rank_sports = Sportspresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        else
            @sports =Sportspresent.where("body LIKE ? ",'%' + params[:search] + '%').order(created_at: :desc)
            @rank_sports = Sportspresent.where("body LIKE ? ",'%' + params[:search] + '%').sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        end

    end



    def new
    @sport=Sportspresent.new
    end

    def create
        sportspresent =Sportspresent.new(sportspresent_params)
        sportspresent.user_id = current_user.id
        if sportspresent.save
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end

    def show
        @sport = Sportspresent.find(params[:id])
        @sportscomments = @sport.sportscomments
        @sportscomment = Sportscomment.new

    end
    
    def edit
        @sport = Sportspresent.find(params[:id])
    end

    def update
        sportspresent = Sportspresent.find(params[:id])
        if sportspresent.update(sportspresent_params)
            redirect_to :action => "show", :id =>  sportspresent.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        sportspresent = Sportspresent.find(params[:id])
        sportspresent.destroy
        redirect_to action: :index
        end
    
    private
    def sportspresent_params
        params.require(:sportspresent).permit(:body, :title, :image)
    end
end
