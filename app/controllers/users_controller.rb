class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    ensure_admin!
    @users = User.all
  end

  # GET /users/1
  def show
    ensure_self_or_admin!
  end

  # GET /users/new
  def new
    ensure_admin!
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    ensure_self_or_admin!
  end

  # POST /users
  def create
    ensure_admin!
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'L\'utilisateur a été créé avec succès'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    # NB : We don't actually prevent a user from changing his email.
    ensure_self_or_admin!
    if @user.update(user_params)
      redirect_to @user, notice: 'L\'utilisateur a été modifié avec succès'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    ensure_admin!
    @user.destroy
    redirect_to users_url, notice: 'L\'utilisateur a été supprimé avec succès'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def ensure_self_or_admin!
      if ! ( current_user.admin? or current_user == @user )
        redirect_to root_path, alert: 'Cette opération requiert des droits d\'administrateur'
      end
    end

    def ensure_admin!
      if ! current_user.admin?
        redirect_to root_path, alert: 'Cette opération requiert des droits d\'administrateur'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      # NB : we don't actually prevent a user from changing his email.
      params.require(:user).permit(:email, :name, :phone)
    end
end
