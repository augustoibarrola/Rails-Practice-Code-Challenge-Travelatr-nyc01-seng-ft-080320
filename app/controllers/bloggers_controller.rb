class BloggersController < ApplicationController
    before_action :this_blogger, only: [:show]

    def new
        @blogger = Blogger.new
    end

    def show
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.valid?
            @blogger.save
            redirect_to blogger_path(@blogger)
        else
            render :new
        end
    end

    private
    
    def blogger_params
      params.require(:blogger).permit(:name, :bio, :age)
    end

    def this_blogger
        @blogger = Blogger.find(params[:id])
    end

end