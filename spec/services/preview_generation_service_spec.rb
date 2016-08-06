# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PreviewGenerationService, :vcr do
  let(:resource) { build :resource, link: 'http://stackoverflow.com' }

  subject { described_class.new.call(link: resource.link) }

  it { is_expected.to be_a ServiceResponse }
  it { is_expected.to be_success           }

  describe '#call' do
    it 'returns the right json object' do
      keys = subject.object.keys
      expect(keys).to match %w(url favicon title description images videos)
    end

    context 'thumbnail fetcher fails' do
      it 'still returns an acceptable json object' do
        allow(LinkThumbnailer).to receive(:generate).and_raise(LinkThumbnailer::Exceptions, 'no can do')
        keys = subject.object.keys
        expect(keys).to match %w(url description)
      end
    end
  end
end

RSpec.describe PreviewNotAvailable do
  subject { described_class }

  it { is_expected.to respond_to :to_json }

  describe '#to_json' do
    let(:link) { 'http://hi.com' }
    let(:expected_json_pattern) do
      "{\"url\":\"#{link}\",\"description\":\"#{t('resources.preview.fetch_error')}\"}"
    end

    it 'returns a json parseable string' do
      expect(subject.new(link: link).to_json).to eq expected_json_pattern
    end
  end
end
