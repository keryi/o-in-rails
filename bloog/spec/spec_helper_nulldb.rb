require "bundler/setup"
require_relative 'spec_helper_lite'

module SpecHelpers
  def setup_nulldb
    require 'nulldb'
    schema_path = File.expand_path('../db/schema.rb', File.dirname(__FILE__))
    ActiveRecord::Base.establish_connection :adapter => :nulldb,
                                        :schema  => schema_path
  end

  def teardown_nulldb
    NullDB.restore
  end
end
