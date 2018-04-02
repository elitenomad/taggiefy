module Taggiefy
  class Tag < ApplicationRecord
    attr_accessible :name
    has_many :taggings, :dependent => :destroy, :class_name => 'Taggiefy::Tagging'

    validates_presence_of :name
    validates_uniqueness_of :name
    validates_length_of :name, :maximum => 255
  end
end
