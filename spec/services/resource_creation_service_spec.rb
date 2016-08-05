# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ResourceCreationService do
  describe '#call' do
    let(:resource_params) { { link: 'http://hithere.com' } }
    let(:strong_params)   { ActionController::Parameters.new(resource_params).permit! }
    let(:successful_service_response) { double 'response', success?: true, object: '["json"]' }

    context 'current user is a guest' do
      subject { described_class.new.call(user: nil, input: strong_params) }

      before do
        allow_any_instance_of(PreviewGenerationService).to receive(:call).and_return successful_service_response
      end

      it { is_expected.to be_a ServiceResponse }
      it { is_expected.to be_success           }

      it 'creates a new Resource' do
        expect { subject }.to change(Resource, :count).by 1
      end

      it 'creates a new resource with no user id' do
        expect(Resource.count).to eq 0
        subject
        expect(Resource.last.user_id).to eq nil
      end
    end

    context 'current user is logged in' do
      let(:user) { create :user }

      subject { described_class.new.call(user: user, input: strong_params) }

      before do
        allow_any_instance_of(PreviewGenerationService).to receive(:call).and_return successful_service_response
      end

      it 'creates a new resource with the right user id' do
        expect(Resource.count).to eq 0
        subject
        expect(Resource.last.user_id).to eq user.id
      end
    end

    describe 'end to end test' do
      subject { described_class.new.call(user: nil, input: strong_params) }

      # it { is_expected.to be_a ServiceResponse }
      # it { is_expected.to be_success           }

      # it 'adds a preview to the resource' do
      #   subject
      #   expect(Resource.last.preview).to be_present
      # end
    end
  end
end
