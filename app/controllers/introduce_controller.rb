class IntroduceController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    def index
    end

    
end
