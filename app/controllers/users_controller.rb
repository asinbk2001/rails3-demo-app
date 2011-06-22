class UsersController < ApplicationController
  before_filter :check_logged_in, :except => [:new, :create]
  before_filter :check_permission, :only => [:edit, :update]

  make_resourceful do
    actions :all
  end

  private

  def check_permission
    if current_user.id != current_object.id
      flash[:error] = 'Permission denied!'
      redirect_to home_path
    end
  end
end
