# frozen_string_literal: true
class PreviewGenerationService
  THUMBNAIL_FETCHER = LinkThumbnailer

  def call(link:)
    @link = link

    begin
      preview = fetch_thumbnail
      json    = make_valid(preview.to_json)

      ServiceResponse.new(json)
    rescue LinkThumbnailer::Exceptions =>
      ServiceResponse.new(nil, true,
  end

  private

  def fetch_thumbnail
    THUMBNAIL_FETCHER.generate(@link)
  end

  def make_valid(string)
    JSON.parse(string)
  end
end
