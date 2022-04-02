class SkillpresentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

    def index
        if params[:search] == nil
            @skills= Skillpresent.all.order(created_at: :desc)
            @rank_skills = Skillpresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
            
        elsif params[:search] == ''
            @skills= Skillpresent.all.order(created_at: :desc)
            @rank_skills = Skillpresent.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}

        else
            
            @skills =Skillpresent.where("body LIKE ? ",'%' + params[:search] + '%')
            @rank_skills = Skillpresent.where("body LIKE ? ",'%' + params[:search] + '%').sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        end

    end



    def new
    @skill=Skillpresent.new
    end

    def create
        skillpresent =Skillpresent.new(skillpresent_params)
        skillpresent.user_id = current_user.id
        if skillpresent.save
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end

    def show
        @skill = Skillpresent.find(params[:id])
        @skillcomments = @skill.skillcomments
        @skillcomment = Skillcomment.new

    end
    
    def edit
        @skill =Skillpresent.find(params[:id])
    end

    def update
        skillpresent = Skillpresent.find(params[:id])
        if skillpresent.update(skillpresent_params)
            redirect_to :action => "show", :id =>  skillpresent.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        skillpresent = Skillpresent.find(params[:id])
        skillpresent.destroy
        redirect_to action: :index
        end
    
    private
    def skillpresent_params
        params.require(:skillpresent).permit(:body, :title, :image)
    end
end
