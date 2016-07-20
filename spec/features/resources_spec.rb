require 'rails_helper'

RSpec.feature 'user adds and manages their resources' do
  scenario 'guest adds a resource' do
    visit resources_path

    find('summary', text: 'Add a new resource to our library').click
    fill_form :resource, link: 'http://hithere.com'
    click_button 'Create resource'
    expect(page).to have_content 'http://hithere.com'
    expect(Resource.count).to eq 1
  end
end
