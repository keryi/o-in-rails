require_relative 'base_exhibit'

class TextPostExhibit < BaseExhibit
  def render_body
    @context.render(partial: '/posts/text_post', locals: { post: self })
  end
end
