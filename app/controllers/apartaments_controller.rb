class ApartamentsController < ApplicationController

    before_action :check_current_user, only: [:index, :new, :create]

    def index
        @apartaments = current_user.apartaments.paginate(per_page: 16, page: params[:page])
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

    def predict_price
        @apartament = Apartament.new
    end

    def run_predict_price
        @apartament = Apartament.new(apartament_params)
        @apartament.price = 1
        @apartament.user_id = 1
        if !@apartament.valid?
            gon.error_count = @apartament.errors.count
            render "predict_price"
        else
            @apartament.price = PriceModel.predict(@apartament)
            redirect_to show_predicted_apartament_path(apartament: @apartament.attributes)
        end
    end

    def show_apartament
        @apartament = Apartament.new(apartament_params)
    end

    private 
    
    def apartament_params
      params.require(:apartament).permit(:title, :description, :price, :no_of_rooms, :surface, 
        :county, :city, :no_of_bathrooms, :no_of_parking, :no_of_terraces, :age, :partitioning, :zone, :price)
    end
    
end
