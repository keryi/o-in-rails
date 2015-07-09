require 'minitest/autorun'
require_relative '../spec_helper_lite.rb'
stub_module 'ActiveModel::Naming'
stub_module 'ActiveModel::Conversion'
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

  describe '#publish' do
    before do
      @blog = Minitest::Mock.new
      @post.blog = @blog
    end

    after do
      @blog.verify
    end

    it 'add the post to the blog' do
      @blog.expect :add_entry, nil, [@post]
      @post.publish
    end
  end
end
