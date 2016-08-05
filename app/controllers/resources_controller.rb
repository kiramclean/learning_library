# frozen_string_literal: true
class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = Resource.all
  end

  def show
  end

  def new
    @resource = Resource.new
    render :new
  end

  def create
    result = ResourceCreationService.new.call(user: current_user, input: resource_params)

    if result.success?
      redirect_to resources_path, notice: successful_create
    else
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
    params.require(:resource).permit(:link, :cost_list, :level_list, :skill_list)
  end

  def successful_create
    return t('.success.user') if current_user.present?
    t('.success.guest')
  end
end
