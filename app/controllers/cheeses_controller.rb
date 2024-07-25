class CheesesController < ApplicationController
  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, only: %i[id name price is_best_seller], methods: [:summary]
    else
      render json: { error: 'cheese not found' }, status: :not_found
    end
  end
end
