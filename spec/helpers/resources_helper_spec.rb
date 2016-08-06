require 'rails_helper'

RSpec.describe ResourcesHelper do
  describe '#imgage_for' do
    subject { helper.image_source_for(resource) }

    context 'resource preview has no image' do
      let(:resource) { build :resource, :no_preview_image }

      it { is_expected.to be_nil }
    end

    context 'resource preview does have an image' do
      let(:resource) { build :resource, :preview_image }

      it { is_expected.to eq resource.preview['images'].first['src'] }
    end
  end
end
