class UsersController < ApplicationController
	before_filter :check_logged_in, :except => [:new, :create] #ngoai tru truong hop new va create thi ko can check_logged_in
	before_filter :check_permission, :only => [:edit, :update] #chi check_permission doi voi edit va update

  make_resourceful do
    actions :all
  end

  private

  def check_permission
		if current_user.id != current_object.id  #neu object ko phai la current_user thi ko cho phep thuc hien actions
      flash[:error] = 'Permission denied! hehehe'
      redirect_to home_path
    end
  end
end
