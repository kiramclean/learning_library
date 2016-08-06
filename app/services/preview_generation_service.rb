# frozen_string_literal: true
class PreviewGenerationService
  THUMBNAIL_FETCHER = LinkThumbnailer

  def call(link:)
    @link = link

    @preview = begin
                 fetch_thumbnail
               rescue LinkThumbnailer::Exceptions => e
                 no_preview
               end

    json = make_valid(@preview.to_json)

    ServiceResponse.new(json)
  end

  private

  def fetch_thumbnail
    THUMBNAIL_FETCHER.generate(@link)
  end

  def make_valid(string)
    JSON.parse(string)
  end

  def no_preview
    PreviewNotAvailable.new(link: @link)
  end
end

class PreviewNotAvailable
  def initialize(link:)
    @link = link
  end

  def to_json
    "{\"url\":\"#{@link}\",\"description\":\"#{I18n.t('resources.preview.fetch_error')}\"}"
  end
end
