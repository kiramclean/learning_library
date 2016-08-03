# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'user adds and manages their resources' do
  scenario 'guest adds a resource' do
    visit resources_path

    add_resource

    expect(page).to have_content 'http://hithere.com'
    expect(page).to have_content t('resources.create.success.guest')
    expect(Resource.count).to eq 1
  end

  scenario 'user adds a resource and visits their profile' do
    user = create :user
    visit resources_path(as: user)

    add_resource

    expect(page).to have_content t('resources.create.success.user')

    visit user_path(user, as: user)

    resource       = user.resources.first
    other_user     = create :user
    other_resource = create :resource, user: other_user

    expect(page).to     have_content resource.link
    expect(page).not_to have_content other_resource.link
  end

  private

  def add_resource
    find('summary', text: 'Add a new resource to our library').click
    fill_form :resource, link: 'http://hithere.com'
    click_button 'Create resource'
  end
end

