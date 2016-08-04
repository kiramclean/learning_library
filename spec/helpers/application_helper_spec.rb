# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#show_error' do
    it 'returns the content tag for an object that has errors' do
      object = build :resource, link: 'invalid.url'
      object.valid?

      expect(show_error(object, :link)).
        to eq '<p class="field-error">Looks like that&#39;s not a valid url. Please enter a full url.</p>'
    end

    it 'returns nothing for an object that has no errors' do
      object = build :resource, link: 'http://validlink.com'
      object.valid?

      expect(show_error(object, :name)).to eq nil
    end
  end
end
