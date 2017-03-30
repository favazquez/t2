class UsersController < ApplicationController
  def create
    render json: {status:"trying to create"}
  end
  def show
    render json: {status:"trying to show one "}
  end
  def index
    render json: {status:"trying to show all"}
  end
  def destroy
    render json: {status:"trying to destroy"}
  end
  def edit
    render json: {status:"trying to edit"}
  end
end
