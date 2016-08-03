# frozen_string_literal: true
class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resource = Resource.new
    @resources = Resource.all
  end

  def show
  end

  def create
    @resource = new_resource

    if @resource.save
      redirect_to resources_path, notice: successful_create
    else
      flash[:alert] = 'Resource could not be saved. Please try again.'
      render :new
    end
  end

  def destroy
    @resource.destroy
    redirect_to resources_url, notice: 'Resource was successfully destroyed.'
  end

  private

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def new_resource
    if current_user.present?
      current_user.resources.new(resource_params)
    else
      Resource.new(resource_params)
    end
  end

  def resource_params
    params.require(:resource).permit(:link)
  end

  def successful_create
    return t('.success.user') if current_user.present?
    t('.success.guest')
  end
end
