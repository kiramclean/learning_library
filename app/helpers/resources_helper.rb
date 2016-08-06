module ResourcesHelper
  def image_source_for(resource)
    return nil if resource.preview['images'].nil?
    resource.preview['images'].first['src']
  end
end
