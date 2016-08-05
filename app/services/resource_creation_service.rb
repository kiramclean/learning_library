# frozen_string_literal: true
class ResourceCreationService
  def call(user:, input:)
    @user = user
    @params = input

    resource = create_resource
    add_thumbnail_to(resource)

    ServiceResponse.new(resource, resource.errors.none?)
  end

  private

  def create_resource
    if @user.nil?
      Resource.create(@params)
    else
      @user.resources.create(@params)
    end
  end

  def add_thumbnail_to(resource)
    previewer = PreviewGenerationService.new.call(link: resource.link)
    resource.update_attributes preview: previewer.object
  end
end
