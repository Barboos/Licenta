class ApartamentsController < ApplicationController

    before_action :check_current_user, only: [:index, :new, :create]

    def index
        @apartaments = current_user.apartaments
    end

    def new 
        @apartament = Apartament.new
    end

    def show
        @apartament = Apartament.find(params[:id])
    end

    def create
        @apartament = current_user.apartaments.build(apartament_params)
        if @apartament.save 
            flash[:success] = "The Apartament was posted!"
            redirect_to action: 'show', id: @apartament.id
        else
            gon.error_count = @apartament.errors.count
            render "new"
        end
    end

    private 
    
    def apartament_params
      params.require(:apartament).permit(:title, :description, :price, :no_of_rooms, :surface, :county, :city)
    end
end
