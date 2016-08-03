# frozen_string_literal: true
class Resource < ApplicationRecord
  validates_presence_of :link
  belongs_to :user
end
