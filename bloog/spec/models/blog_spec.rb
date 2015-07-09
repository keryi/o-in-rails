require 'minitest/autorun'
require 'ostruct'
require_relative '../../app/models/blog'

describe Blog do
  before { @blog = Blog.new }

  it 'has no entries' do
    @blog.entries.must_be_empty
  end

  describe '#new_post' do
    before do
      @new_post = OpenStruct.new
      @blog.post_source = ->{ @new_post }
    end

    it 'returns a new post' do
      @blog.new_post.must_equal @new_post
    end

    it "sets the blog's reference to itself" do
      @blog.new_post.blog.must_equal @blog
    end
  end
end
