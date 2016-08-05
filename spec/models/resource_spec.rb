# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Resource, type: :model do
  subject { build :resource }

  it { is_expected.to respond_to :link, :cost_list, :level_list, :skill_list, :preview }

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
    it 'is taggable on cost' do
      resource = create :resource

      resource.cost_list.add('free')
      resource.save

      expect(resource.cost_list).to match_array ['free']
    end

    it 'is taggable on level' do
      resource = create :resource

      resource.level_list.add('I know nothing')
      resource.save

      expect(resource.level_list).to match_array ['I know nothing']
    end

    it 'is taggable on skill' do
      resource = create :resource

      resource.skill_list.add('ruby, rails, backend', parse: true)
      resource.save

      expect(resource.skill_list).to match_array %w(ruby rails backend)
    end
  end
end
