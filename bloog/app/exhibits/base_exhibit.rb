require 'delegate'

class BaseExhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    super(model)
  end
end
