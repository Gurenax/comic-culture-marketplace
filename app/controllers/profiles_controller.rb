class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[show edit update destroy]
  before_action :set_checkbox_same_address, only: %i[show new edit]
  before_action :set_shipping_address, only: %i[create update]

  # GET /profiles
  # GET /profiles.json``
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.billing_address = Address.new
    @profile.shipping_address = Address.new
    # @use_same_address = false
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    # byebug
    @profile = Profile.new(profile_params)

    # Assign current user to the new profile
    @profile.user = current_user

    # Get checkbox value if billing address is same as shipping address
    # use_same_address = params.permit(:use_same_address)[:use_same_address]
    # @profile.shipping_address = @profile.billing_address.dup if use_same_address == '1'
    # byebug

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :first_name, :last_name, :image_data,
                                      :date_of_birth, :short_bio, :superpowers, :favourites,
                                      billing_address_attributes:
                                      %i[id house_number street_name town_suburb city state postal_code country_code],
                                      shipping_address_attributes:
                                      %i[id house_number street_name town_suburb city state postal_code country_code])
    end

    # Set the checkbox value to true if shipping address is same with billing address
    def set_checkbox_same_address
      return false if @profile.nil?
      @use_same_address = (@profile.shipping_address.attributes.except('id','created_at','updated_at') == @profile.billing_address.attributes.except('id','created_at','updated_at'))
    end

    # If the same address checbox is ticked, copy billing address attributes to shipping address attributes
    def set_shipping_address
      if params[:use_same_address] == '1'
        params[:profile][:shipping_address_attributes][:house_number] = params[:profile][:billing_address_attributes][:house_number]
        params[:profile][:shipping_address_attributes][:street_name] = params[:profile][:billing_address_attributes][:street_name]
        params[:profile][:shipping_address_attributes][:town_suburb] = params[:profile][:billing_address_attributes][:town_suburb]
        params[:profile][:shipping_address_attributes][:city] = params[:profile][:billing_address_attributes][:city]
        params[:profile][:shipping_address_attributes][:state] = params[:profile][:billing_address_attributes][:state]
        params[:profile][:shipping_address_attributes][:postal_code] = params[:profile][:billing_address_attributes][:postal_code]
        params[:profile][:shipping_address_attributes][:country_code] = params[:profile][:billing_address_attributes][:country_code]
      end
    end
end
