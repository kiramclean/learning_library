# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ServiceResponse do
  let(:object) { double 'object' }

  context 'activerecord object' do
    it 'fails with errors on the object' do
      sample_errors = [ double('some fake errors') ]
      allow(object).to receive(:errors).and_return(sample_errors)
      expect(ServiceResponse.new(object).success?).to eq false
    end

    it 'is successful without errors on the object' do
      allow(object).to receive_message_chain(:errors).and_return([])
      expect(ServiceResponse.new(object).success?).to eq true
    end
  end

  context '#success?' do
    it 'defaults to success' do
      expect(ServiceResponse.new(object).success?).to eq true
    end

    it 'allows overriding of success? even for activerecord models' do
      sample_active_record_model = double(:ar_model, errors: [])
      expect(ServiceResponse.new(sample_active_record_model, false).success?).to eq false
    end
  end

  it 'passes the message over' do
    message = 'The email and password did not match records'
    expect(ServiceResponse.new(object, false, message).message).to eq message
  end

  it 'uses provided success values' do
    expect(ServiceResponse.new(object, false).success?).to eq false
    expect(ServiceResponse.new(object, true).success?).to  eq true
  end

  describe '#to_hash' do
    it 'returns a hash for awesome print' do
      message = 'something happened'
      expect(ServiceResponse.new(object, false, message).to_hash).to eq object: object, success?: false, message: message
    end
  end
end

