class PreviewGenerationJob < ApplicationJob
  queue_as :default

  def perform(resource:)
    @resource = resource

    preview = fetch_thumbnail
    # TODO: Update resource with scraped data from the thumbnail, in the service
    # assign_json_to_resource(preview)
  end

  private

  def fetch_thumbnail
    PreviewGenerationService.new.call(link: @resource.link)
  end

  def assign_json_to_resource(previewer)
    @resource.update_attributes preview: previewer.object
  end
end
