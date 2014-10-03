require 'active_record'

class UserScore < ActiveRecord::Base
  belongs_to :category
end
