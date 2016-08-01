# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'Voting on a resource' do
  scenario 'logged in user up and down-votes a resource' do
    user     = create :user
    resource = create :resource

    visit resources_path(as: user)
  end

  # I'm logged in
  # I see a list of resources
  # I click the up arrow
  # The count should be up by one
  # I click the down arrow
  # The count should be down by one

  # I'm a guest
  # I click on the up arrow
  # I should see a flash message asking me to sign up to vote
  # I click the down arrow
  # Same mesasge
end
