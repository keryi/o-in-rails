require_relative 'spec_helper_lite'
require_relative '../config/environment.rb'

module SpecHelpers
  def setup_database
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.start
  end

  def teardown_database
    DatabaseCleaner.clean
  end

  def setup_nulldb
    schema_path = File.expand_path('../db/schema.rb', File.dirname(__FILE__))
    NullDB.nullify(schema: schema_path)
  end

  def teardown_nulldb
    NullDB.restore
  end
end
