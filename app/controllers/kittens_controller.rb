class KittensController < ApplicationController
    def index  
        #localhost:3000/kittens.json
        #localhost:3000/kittens
        @kittens = Kitten.all
        respond_to do |format|
            format.html # Render HTML template (default behavior)
            format.json { render json: @kittens } # Render JSON response
        end
    end
    def show 
        #localhost:3000/kittens/1.json
        #localhost:3000/kittens/1
        @kitten  = Kitten.find(params[:id])
        respond_to do |format|
            format.html # Render HTML template (default behavior)
            format.json { render json: @kitten } # Render JSON response
        end
    end
    def new 
        @kitten = Kitten.new 
    end
    def create
        @kitten = Kitten.create(kitten_params) 
        redirect_to root_path
    end 
    def edit 
        @kitten = Kitten.find(params[:id])
    end 
    def update 
        @kitten = Kitten.update(kitten_params)
        redirect_to kitten_path
    end 
    def destroy  
        @kitten = Kitten.find(params[:id])
        @kitten.destroy
    end
    private
    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
