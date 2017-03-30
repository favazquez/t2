class User < ApplicationRecord
  validates_presence_of :user, :username
end
