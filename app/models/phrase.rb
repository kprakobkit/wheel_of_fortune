require 'active_record'

class Phrase < ActiveRecord::Base
  belongs_to :category
end
