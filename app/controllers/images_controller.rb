class ImagesController < ApplicationController
  def create
    images = Image.add(params)
    render json: images.collect{|f| f.path}.to_json
  end
end
