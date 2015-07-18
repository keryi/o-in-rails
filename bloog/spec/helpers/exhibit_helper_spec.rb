require 'minitest/autorun'
require 'byebug'
require_relative '../spec_helper_lite'
require_relative '../../app/exhibits/base_exhibit'
require_relative '../../app/exhibits/picture_post_exhibit'
require_relative '../../app/exhibits/text_post_exhibit'
require_relative '../../app/helpers/exhibit_helper'

stub_class 'Post'

describe ExhibitHelper do
  before do
    @it = Object.new
    @it.extend ExhibitHelper
    @context = stub!
  end

  it 'decorates picture posts with a PicturePostExhibit' do
    post = Post.new
    stub(post).picture? { true }
    @it.exhibit(post, @context).must_be_kind_of(Post)
  end

  it 'decorates text posts with a TextPostExhibit' do
    post = Post.new
    stub(post).picture? { false }
    @it.exhibit(post, @context).must_be_kind_of(Post)
  end

  it 'leaves object it does not know about alone' do
    model = Object.new
    @it.exhibit(model, @context).must_be_same_as(model)
  end
end
