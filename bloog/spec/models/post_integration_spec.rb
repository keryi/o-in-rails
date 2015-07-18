require 'spec_helper_full'

describe Post do
  it 'has default body' do
    post = make_post(body: '')
    post.body.must_equal('Nothing to see here')
  end
end
