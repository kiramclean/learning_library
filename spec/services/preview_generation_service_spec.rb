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
      expect(keys).to match ["url", "favicon", "title", "description", "images", "videos"]
    end
  end
end
