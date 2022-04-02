class SweetspresentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

    def index
        if params[:search] == nil
            @sweets= Sweetspresent.all.order(created_at: :desc)
            @rank_sweets = Sweetspresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        elsif params[:search] == ''
            @sweets= Sweetspresent.all.order(created_at: :desc)
            @rank_sweets = Sweetspresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        else
            
            @sweets =Sweetspresent.where("body LIKE ? ",'%' + params[:search] + '%').order(created_at: :desc)
            @rank_sweets = Sweetspresent.where("body LIKE ? ",'%' + params[:search] + '%').sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        end

    end



    def new
    @sweet=Sweetspresent.new
    end

    def create
        sweetspresent =Sweetspresent.new(sweetspresent_params)
        sweetspresent.user_id = current_user.id
        if sweetspresent.save
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end

    def show
        @sweet = Sweetspresent.find(params[:id])
        @sweetscomments = @sweet.sweetscomments
        @sweetscomment = Sweetscomment.new

    end
    
    def edit
        @sweet = Sweetspresent.find(params[:id])
    end

    def update
        sweetspresent = Sweetspresent.find(params[:id])
        if sweetspresent.update(sweetspresent_params)
            redirect_to :action => "show", :id =>  sweetspresent.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        sweetspresent = Sweetspresent.find(params[:id])
        sweetspresent.destroy
        redirect_to action: :index
        end
    
    private
    def sweetspresent_params
        params.require(:sweetspresent).permit(:body, :title, :image)
    end
end
