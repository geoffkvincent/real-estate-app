class Api::PropertiesController < ApplicationController
  def index
    render json: Property.availible
  end
end
