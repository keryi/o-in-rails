require_relative 'base_exhibit'

class PicturePostExhibit < BaseExhibit
  def render_body
    @context.render(partial: '/posts/picture_body', locals: { post: self })
  end
end
