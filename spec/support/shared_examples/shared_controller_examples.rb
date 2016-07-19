RSpec.shared_examples 'successful request' do
  it 'returns success status code' do
    subject
    expect(response).to have_http_status :success
  end
end
