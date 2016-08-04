# frozen_string_literal: true
class Resource < ApplicationRecord
  validates_presence_of :link
  validates_uniqueness_of :link
  validates :link, url: true

  acts_as_taggable_on :cost, :level, :skill
end
