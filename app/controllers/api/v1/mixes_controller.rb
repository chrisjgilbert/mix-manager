class Api::V1::MixesController < ApplicationController

  def index
    @Mixes = Mix.all
    render json: @Mixes
  end

end
