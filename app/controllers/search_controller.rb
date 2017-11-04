class SearchController < ApplicationController
  def index
    @keywords = params.permit(:keywords)[:keywords]
    @location = params.permit(:location)[:location]
    @location_radius = params.permit(:location_radius)[:location_radius]
    
    unless @keywords.blank?
      if !@location.blank? and @location_radius.to_i > 0
        geocoder = Geocoder.coordinates(@location)
        coordinates = "#{geocoder[0]}, #{geocoder[1]}" unless geocoder.nil?
        # byebug
        @products = Product.search(@keywords, {filters:'status:Available', aroundLatLng: coordinates, aroundRadius: @location_radius.to_i})
      else
        @products = Product.search(@keywords, {filters:'status:Available'})
      end
    end
  end

  def new
  end

end
