class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    #GET /spices
    def index
        spices= Spice.all
        render json: spices
    end

    #POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # #GET /spice/:id
    # def show
    #     spice = spice_find
    #     render json: spice
    # end

    #PATCH /spice/:id
    def update
        spice = spice_find
        spice.update(spice_params)
        render json: spice
    end

    #DELETE /birds/:id
    def destroy
        spice = spice_find
        spice.destroy
        head :no_content
    end
        

private
    def render_not_found_response
        render json: {error: "Spice not found" }, status: :not_found
    end

    def spice_params
        params.permit(:title, :image, :name, :rating, :notes, :description)
    end
    
    def spice_find
        Spice.find(params[:id])
    end

end
