# frozen_string_literal: true
RSpec.shared_examples 'successful request' do
  it 'returns success status code' do
    subject
    expect(response).to have_http_status :success
  end
end

RSpec.shared_examples 'action not allowed for guests' do
  context 'guest tries to access' do
    it 'redirects an unauthenticated visitor' do
      subject
      expect(controller).to deny_access
    end
  end
end

RSpec.shared_examples 'action that is allowed for guests' do
  context 'guest tries to access' do
    it 'works' do
      subject
      expect(response).to have_http_status :success
      expect(controller).not_to set_flash
    end
  end
end
