require 'rails_helper'

RSpec.describe PreviewGenerationJob, type: :job do
  describe '#perform' do
    let(:resource) { create :resource, link: 'http://stackoverflow.com' }

    subject { described_class }

    it 'enqueues a new job' do
      expect { subject.perform_later(resource) }.to change(enqueued_jobs, :size).by 1
    end

    it 'calls the preview generator' do
      successful_service_response = double 'response', success?: true, object: 'an object'
      allow_any_instance_of(PreviewGenerationService).to receive(:call).and_return successful_service_response

      expect_any_instance_of(PreviewGenerationService).to receive(:call).with(link: resource.link)

      subject.new.perform(resource: resource)
    end

    it 'updates the resource', :vcr do
      expect(resource.preview).to be_nil
      subject.new.perform(resource: resource)
      expect(resource.preview).to be_present
    end
  end
end
