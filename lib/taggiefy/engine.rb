require 'taggiefy/active_record'
require 'taggiefy/tag_names'

module Taggiefy
  class Engine < ::Rails::Engine
    isolate_namespace Taggiefy

    #TODO: Might not work. Use Initializers ?
    ActiveSupport.on_load :active_record do
      include TagEchidna::ActiveRecord
    end
  end
end
