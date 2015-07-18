require_relative 'base_exhibit'

class TextPostExhibit < BaseExhibit
  def render_body
    @context.render(partial: '/posts/text_post', locals: { post: self })
  end

  def self.applicable_to?(model)
    model.is_a?(Post) && !(model.picture?)
  end
end
