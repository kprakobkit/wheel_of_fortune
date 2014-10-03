require 'active_record'
require_relative '../../config/application'

class CreateTables < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    create_table :phrases do |t|
      t.string :phrase
      t.references :category
    end

    create_table :user_scores do |t|
      t.string :name
      t.integer :score
      t.references :category
    end


  end
end
