class PostsController < ApplicationController
  before_filter :check_logged_in
  before_filter :check_permission, :only => [:edit, :update, :destroy]

  make_resourceful do
    actions :all

    before :create do
		current_object.user_id = current_user.id	#gan gia tri cho user_id cua post, user_id la khoa ngoai cho cac posts
    end				#current_user la bien cua session_helper ma session_helper la 1 module, no dc include vao ApplicationController
		end					#vi vay tat ca cac controller ke thuc no, deu chua cac bien cua session_helper
  
  private

  def check_permission
    if current_user.id != current_object.user_id
      flash[:error] = 'Permission denied!'
      redirect_to home_path
    end
  end
end
