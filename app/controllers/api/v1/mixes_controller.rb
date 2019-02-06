class Api::V1::MixesController < ApplicationController

  def index
    mixes = Mix.all
    render json: mixes
  end

  def create
    mix = Mix.create(mix_params)
    render json: mix
  end

  def destroy
    Mix.destroy(params[:id])
    head 200
  end

  def update
    head 200
  end

  private

  def mix_params
    params.require(:mix).permit(:id, :title, :description, :url)
  end

end
