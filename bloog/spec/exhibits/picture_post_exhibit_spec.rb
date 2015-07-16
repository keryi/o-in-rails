require 'minitest/autorun'
require 'ostruct'
require_relative '../spec_helper_lite'
require_relative '../../app/exhibits/picture_post_exhibit'

describe PicturePostExhibit do
  before do
    @post = OpenStruct.new(
      title: 'title',
      body: 'body',
      pubdate: 'pubdate')
    @context = stub!
    @pp_exhibit = PicturePostExhibit.new(@post, @context)
  end

  it 'delegates method calls to the post' do
    @pp_exhibit.title.must_equal 'title'
    @pp_exhibit.body.must_equal 'body'
    @pp_exhibit.pubdate.must_equal 'pubdate'
  end

  it 'renders itself with the appropriate partial' do
    mock(@context).render(
      partial: '/posts/picture_body', locals: { post: @pp_exhibit }) {
      'the_html'
    }
    @pp_exhibit.render_body.must_equal 'the_html'
  end
end
