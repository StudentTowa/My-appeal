class MoviepresentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

    def index
        if params[:search] == nil
            @movies= Moviepresent.all.order(created_at: :desc)
            @rank_movies = Moviepresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        elsif params[:search] == ''
            @movies= Moviepresent.all.order(created_at: :desc)
            @rank_movies = Moviepresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        else
            
            @movies =Moviepresent.where("body LIKE ? ",'%' + params[:search] + '%').order(created_at: :desc)
            @rank_movies = Moviepresent.where("body LIKE ? ",'%' + params[:search] + '%').sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        end

    end



    def new
    @movie=Moviepresent.new
    end

    def create
        moviepresent =Moviepresent.new(moviepresent_params)
        moviepresent.user_id = current_user.id
        if moviepresent.save
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end

    def show
        @movie = Moviepresent.find(params[:id])
        @moviecomments = @movie.moviecomments
        @moviecomment = Moviecomment.new

    end
    
    def edit
        @movie = Moviepresent.find(params[:id])
    end

    def update
        moviepresent = Moviepresent.find(params[:id])
        if moviepresent.update(moviepresent_params)
            redirect_to :action => "show", :id =>  moviepresent.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        moviepresent = Moviepresent.find(params[:id])
        moviepresent.destroy
        redirect_to action: :index
        end
    
    private
    def moviepresent_params
        params.require(:moviepresent).permit(:body, :title, :image)
    end
end
