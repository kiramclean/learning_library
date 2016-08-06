# frozen_string_literal: true
class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = Resource.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @resource = Resource.new
    render :new
  end

  def create
    @resource = new_resource

    if @resource.save
      fetch_preview
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

  def fetch_preview
    previewer = PreviewGenerationJob.call(link: @resource.link)
    @resource.update_attributes preview: previewer.object # do this in a background job
  end

  def successful_create
    return t('.success.user') if current_user.present?
    t('.success.guest')
  end
end
