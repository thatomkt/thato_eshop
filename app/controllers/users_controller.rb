class UsersController < ApplicationController

  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  #load_and authorize_resource

  #authorize_resource
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # The next statement is going to check whether the current user is allowed
    # to "edit" the user that is saved inside the variable "@user". The variable "@user"
    # has the result of "User.find(params[:id])" which is executed by the "set_user"
    # (look above which says before_action :set_user)
    # For example, if current user is user with id "1" (Thato Lion) and
    # tries to access /users/2/edit , then params[:id] is "2" and hence
    # @user is user with id "2" (Thato Tigger). So, method below is going to check
    # whether Thato Lion (current user) is authorized to "edit" Thato Tigger (user
    # with id "2" in @user)
    # authorize! :edit, @user 
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_user
    #  @user = User.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end

    class AddAdminFlagToUsers < ActiveRecord::Migration
      def change
        add_column :users, :admin, :boolean, default: false, null: false
      end
    end

    class Ability
        include CanCan::Ability

        def initialize(user)
          user ||= User.new  # guest user (not logged in)
          if user.admin?
           can :manage, :all
          else
           can :read, :all
          end
        end
    end
end
