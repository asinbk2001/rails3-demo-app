class PostsController < ApplicationController
  before_filter :check_logged_in
  before_filter :check_permission, :only => [:edit, :update, :destroy]

  make_resourceful do
    actions :all

    before :create do
      current_object.user_id = current_user.id
    end
  end
  
  private

  def check_permission
    if current_user.id != current_object.user_id
      flash[:error] = 'Permission denied!'
      redirect_to home_path
    end
  end
end
