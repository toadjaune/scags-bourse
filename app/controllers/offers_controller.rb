class OffersController < ApplicationController
  include OffersHelper

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :purge_images]
  before_action :ensure_current_user_can_see, only: :show
  before_action :ensure_current_user_can_modify, only: [:update, :destroy, :purge_images]

  # GET /offers
  def index
    if user_signed_in?
      @offers = Offer.all
    else
      @offers = Offer.where(public: true)
    end
  end

  # GET /offers/1
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user

    if @offer.save
      redirect_to @offer, notice: 'L\'offre a été créée avec succès'
    else
      render :new
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /offers/1
  def destroy
    @offer.destroy
    redirect_to offers_url, notice: 'L\'offre a été supprimée avec succès'
  end

  # DELETE /offers/1/images
  def purge_images
    @offer.images.purge
    redirect_to @offer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def ensure_current_user_can_see
      if ! current_user_can_see?(@offer)
        redirect_to offers_url, alert: 'Vous n\'êtes pas autorisé à voir cette offre'
      end
    end

    def ensure_current_user_can_modify
      if ! current_user_can_modify?(@offer)
        redirect_to @offer, alert: 'Vous n\'êtes pas autorisé à modifier cette offre'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:title, :text, :public, images: [])
    end
end
