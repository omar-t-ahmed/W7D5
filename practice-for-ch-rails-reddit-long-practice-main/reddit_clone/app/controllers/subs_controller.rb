class SubsController < ApplicationController
    before_action :require_moderator, only: [:edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def new
        render :new
    end

    def create
        
    end

    def show

    end

    def edit

    end

    def update

    end
end
