class PhotosController < ApplicationController
  respond_to :json

  def index
    lat, lng = params[:lat], params[:lng]
    radius = params[:radius] || 5

    if lat and lng
      @photos = Photo.nearby(radius, lng.to_f, lat.to_f)
      respond_with({:photos => @photos})
    else
      respond_with({:message => "Invalid or missing lng/lat parameters"}, :status => 406)
    end
  end

  def show
    @photo = Photo.find(params[:id])
    respond_with(@photo)
  end

  def create
    @photo = Photo.new
    @photo.lnglat = "POINT(#{params[:lng]} #{params[:lat]}"
    @photo.image = params[:image]
    @photo.save

    respond_with(@photo)
  end
end
