# frozen_string_literal: true
class UsersController < Clearance::UsersController
  def show
    @user = current_user
  end
end
