require 'delegate'

class TextPostExhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    super(model)
  end

  def render_body
    @context.render(partial: '/posts/text_post', locals: { post: self })
  end
end
