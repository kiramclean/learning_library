# frozen_string_literal: true
class User < ApplicationRecord
  include Clearance::User

  has_many :resources
end
