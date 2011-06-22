require 'spec_helper'

describe UsersController do
    it "GET new should render a new page" do
      get :new
      response.should render_template('new')
    end

    it "GET show should render a show page" do
      @user = Factory(:user)
      get :show, :id => @user.id
      response.should render_template('show')
    end
end
