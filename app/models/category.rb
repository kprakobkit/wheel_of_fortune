require 'active_record'

class Category < ActiveRecord::Base
  has_many :phrases
  has_many :user_scores
end
