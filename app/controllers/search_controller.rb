class SearchController < ApplicationController
  before_action :set_params
  before_action :set_filters

  def index
    if !@location.blank? && @location_radius.to_i > 0
      geocoder = Geocoder.coordinates(@location)
      coordinates = "#{geocoder[0]}, #{geocoder[1]}" unless geocoder.blank?
      @products = Product.search(@keywords, {filters:@filters, aroundLatLng: coordinates, aroundRadius: @location_radius.to_i}) unless @keywords.blank?
    else
      @products = Product.search(@keywords, {filters:@filters}) unless @keywords.blank?
    end
    # byebug
  end

  # def new
  # end

  private

  def set_params
    @keywords = params.permit(:keywords)[:keywords]
    @location = params.permit(:location)[:location]
    @location_radius = params.permit(:location_radius)[:location_radius]
    @manufacturer_or_publisher = params.permit(:manufacturer_or_publisher)[:manufacturer_or_publisher]
    @category = params.permit(:category)[:category]
    @seller_name = params.permit(:seller_name)[:seller_name]
  end

  def set_filters
    @filters = ''
    @filters.concat("status:'Available'")
    unless @manufacturer_or_publisher.blank?
      @filters.concat(" AND (manufacturer:'#{@manufacturer_or_publisher}'")
      @filters.concat(" OR publisher:'#{@manufacturer_or_publisher}')")
    end
    @filters.concat(" AND category:'#{@category}'") unless @category.blank?
    @filters.concat(" AND seller_name:'#{@seller_name}'") unless @seller_name.blank?
  end

end