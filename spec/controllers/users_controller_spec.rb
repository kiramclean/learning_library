# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it { is_expected.to respond_to :show }
end
