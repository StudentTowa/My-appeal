class MusicpresentsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

    def index
        
        if params[:search] == nil
            @musics= Musicpresent.all.order(created_at: :desc)
            @rank_musics = Musicpresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        elsif params[:search] == ''
            @musics= Musicpresent.all.order(created_at: :desc)
            @rank_musics = Musicpresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        else
        
            @musics = Musicpresent.where("body LIKE ? ",'%' + params[:search] + '%').order(created_at: :desc)
            @rank_musics = Musicpresent.where("body LIKE ? ",'%' + params[:search] + '%').sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        end

    end



    def new
    @music=Musicpresent.new
    end

    def create
        musicpresent =Musicpresent.new(musicpresent_params)
        musicpresent.user_id = current_user.id
        if musicpresent.save
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end

    def show
        @Music = Musicpresent.find(params[:id])
        @comments = @Music.comments
        @comment = Comment.new

    end
    
    def edit
        @Music = Musicpresent.find(params[:id])
    end

    def update
        musicpresent = Musicpresent.find(params[:id])
        if musicpresent.update(musicpresent_params)
            redirect_to :action => "show", :id =>  musicpresent.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        musicpresent = Musicpresent.find(params[:id])
        musicpresent.destroy
        redirect_to action: :index
        end
    
    private
    def musicpresent_params
        params.require(:musicpresent).permit(:body, :title, :image)
    end



end
