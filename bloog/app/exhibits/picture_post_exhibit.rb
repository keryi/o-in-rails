require_relative 'base_exhibit'

class PicturePostExhibit < BaseExhibit
  def render_body
    @context.render(partial: '/posts/picture_body', locals: { post: self })
  end

  def self.applicable_to?(model)
    model.is_a?(Post) && model.picture?
  end
end
