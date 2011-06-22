require 'spec_helper'

describe User do
  it "should create an user with email and name" do
    User.create!({ :name => 'Your name', :email => 'example@example.com', :password => 'password', :password_confirmation => 'password' })
  end

  it "should require a name" do
    user = User.new({ :email => 'example@example.com' })
    user.should_not be_valid
  end

  it "should require an email" do
    user = User.new({ :name => 'test name' })
    user.should_not be_valid
  end

  it "should require a valid email" do
    user = User.new({ :name => 'test name', :email => 'testemail' })
    user.should_not be_valid
  end

  it "should require a password" do
    user = User.new({ :name => 'test name', :email => 'example@example.com' })
    user.should_not be_valid
  end

  it "should be false if passwords dont match" do
    user = User.new({ :name => 'test name', :email => 'example@example.com', :password => 'password' })
    user.password_match?('something').should be_false
  end
end
