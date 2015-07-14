require 'minitest/autorun'
require_relative '../spec_helper_lite.rb'
require_relative '../../app/models/post'

describe Post do
  before { @post = Post.new }

  it 'starts with blank attributes' do
    @post.title.must_be_nil
    @post.body.must_be_nil
  end

  it 'can read and write a title' do
    @post.title = 'This is a title'
    @post.title.must_equal 'This is a title'
  end

  it 'can read and write a body' do
    @post.body = 'This is a body'
    @post.body.must_equal 'This is a body'
  end

  it 'can belongs to a blog' do
    blog = Object.new
    @post.blog = blog
    @post.blog.must_equal blog
  end

  it 'supporter setting attributes in initializer' do
    post = Post.new title: 'title', body: 'body'
    post.title.must_equal 'title'
    post.body.must_equal 'body'
  end

  it 'is not valid with blank title' do
    [nil, '', ' '].each do |title|
      @post.title = title
      refute @post.valid?
    end
  end

  it 'is not valid with non-blank title' do
    @post.title = 'x'
    assert @post.valid?
  end

  describe '#publish' do
    before do
      @blog = Minitest::Mock.new
      @post.blog = @blog
    end

    after do
      @blog.verify
    end

    describe 'given an invalid post' do
      before { @post.title = nil }

      it 'wont add post to the blog' do
        dont_allow(@blog).add_entry
        @post.publish
      end

      it 'return false' do
        refute @post.publish
      end
    end
  end

  describe '#pubdate' do
    describe 'before publishing' do
      it 'is blank' do
        @post.pubdate.must_be_nil
      end
    end

    describe 'after publishing' do
      before do
        @clock = stub!
        @now = DateTime.parse '2015-07-10T08:15'
        stub(@clock).now() { @now }
        @post.blog = stub!
        @post.title = 'title'
        @post.publish @clock
      end

      it 'is a datetime' do
        @post.pubdate.must_equal @now
      end
    end
  end
end
