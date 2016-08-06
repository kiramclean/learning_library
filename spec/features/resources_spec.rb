# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'user adds and manages their resources' do
  scenario 'guest adds a resource', :vcr do
    visit resources_path

    click_link t('application.header.new_resource')

    expect(page).to have_content t('resources.new.title')

    add_resource('http://stackoverflow.com')

    expect(page).to have_content 'Stack Overflow'
    expect(page).to have_content 'http://stackoverflow.com'
    expect(page).to have_content 'Q&A for professional and enthusiast programmers'
    expect(page).to have_content t('resources.create.success.guest')
    expect(Resource.count).to eq 1
  end

  scenario 'user adds a resource and visits their profile', :vcr do
    user = create :user
    visit new_resource_path(as: user)

    add_resource('http://udacity.com')

    expect(page).to have_content t('resources.create.success.user')
    expect(page).to have_content 'Udacity - Free Online Classes & Nanodegrees'
    expect(page).to have_content 'Find free online courses, make a career change, or get a new job by completing a Nanodegree program.'

    visit user_path(user, as: user)

    resource       = user.resources.first
    other_user     = create :user
    other_resource = create :resource, user_id: other_user.id

    expect(page).to     have_content resource.link
    expect(page).not_to have_content other_resource.link
  end

  scenario 'user tries to add an invalid url' do
    visit new_resource_path

    add_resource('invalid.url')

    expect(page).to have_content t('errors.messages.url')
  end

  scenario 'user tries to add a duplicate url' do
    create :resource, link: 'http://duplicate.com'

    visit new_resource_path

    add_resource('http://duplicate.com')

    expect(page).to have_content t('activerecord.errors.models.resource.attributes.link.taken')
  end

  scenario "user adds a link we can't fetch any data for", :vcr do
    visit new_resource_path

    add_resource('http://nodatahere.com')

    expect(page).to have_content t('resources.preview.fetch_error')
  end

  private

  def add_resource(link)
    fill_form :resource, 'Link': link
    click_button 'Create resource'
  end
end

