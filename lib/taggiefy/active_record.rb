module Taggiefy::ActiveRecord
  def self.included(base)
    base.extend Taggiefy::ActiveRecord::ClassMethods
  end

  module ClassMethods
    def have_many_tags
      has_many :taggings, :class_name => 'Taggiefy::Tagging', :as => :taggable, :dependent => :destroy
      has_many :tags,     :class_name => 'Taggiefy::Tag', :through => :taggings
    end
  end

  def tag_names
    @tag_names ||= Taggiefy::TagNames.new self
  end

  def tag_names=(names)
    if names.is_a?(Taggiefy::TagNames)
      @tag_names = names
    else
      @tag_names = Taggiefy::TagNames.new_with_names self, names
    end
  end
end