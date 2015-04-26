class Admin::ImagesController < Admin::BaseController
  def create
    images = Image.add(params)
    render json: images.collect{|f| f.image.url}.to_json
  end
end
