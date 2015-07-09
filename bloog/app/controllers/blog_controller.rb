class BlogController < ApplicationController
  def index
    @blog = Blog.new
    post_one = @blog.new_post
    post_one.title = 'This is a post'
    post_one.body = 'This is a post body'
    post_one.publish

    post_two = @blog.new_post title: 'This is another post'
    post_two.body = 'This is another post body'
    post_two.publish
  end
end
