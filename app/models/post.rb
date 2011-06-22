class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true
  validates_length_of :title, :maximum => 256
  validates :user_id, :presence => true
end
