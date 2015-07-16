require 'minitest/autorun'
require 'ostruct'
require_relative '../spec_helper_lite'
require_relative '../../app/exhibits/text_post_exhibit'

describe TextPostExhibit do
  before do
    post = OpenStruct.new(
      title: 'title',
      body: 'body',
      pubdate: 'pubdate'
    )
    @context = stub!
    @tp_exhibit = TextPostExhibit.new(post, @context)
  end

  it 'delegates method calls to post' do
    @tp_exhibit.title.must_equal 'title'
    @tp_exhibit.body.must_equal 'body'
    @tp_exhibit.pubdate.must_equal 'pubdate'
  end

  it 'render itself with appropriate partial' do
    mock(@context).render(
      partial: '/posts/text_post', locals: { post: @tp_exhibit }) {
      'the_html'
    }
    @tp_exhibit.render_body.must_equal 'the_html'
  end
end
