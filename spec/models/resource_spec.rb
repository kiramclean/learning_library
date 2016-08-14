# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Resource, type: :model do
  subject { build :resource }

  it { is_expected.to respond_to :title, :description, :link, :image_url, :cost, :level, :tag_list }

  it { is_expected.to validate_presence_of   :link }
  it { is_expected.to validate_uniqueness_of :link }

  describe 'url validation' do
    it { is_expected.to allow_value('http://hi.com').for :link }
    it { is_expected.to allow_value('https://hi.com').for :link }
    it { is_expected.not_to allow_value('hi.com').for :link }
    it { is_expected.not_to allow_value('just a sentence').for :link }
    it { is_expected.not_to allow_value('www.usehttp.com').for :link }
  end

  describe 'tagging' do
    it 'is taggable' do
      resource = create :resource

      resource.tag_list.add('ruby, rails, backend', parse: true)
      resource.save

      expect(resource.tag_list).to match_array %w(ruby rails backend)
    end
  end
end
