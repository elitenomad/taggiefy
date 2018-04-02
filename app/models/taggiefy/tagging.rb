module Taggiefy
  class Tagging < ApplicationRecord
    belongs_to :tag, :class_name => '::Taggiefy::Tag'
    belongs_to :taggable, :polymorphic => true
  end
end
