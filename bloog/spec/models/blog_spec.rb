require 'minitest/autorun'
require_relative '../../app/models/blog'

describe Blog do
  before { @blog = Blog.new }

  it 'has no entries' do
    @blog.entries.must_be_empty
  end
end
