require 'delegate'

class BaseExhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    super(model)
  end

  def to_model
    __getobj__
  end

  def class
    __getobj__.class
  end

  class << self
    def exhibits
      [PicturePostExhibit, TextPostExhibit]
    end

    def exhibit(model, context)
      exhibits.inject(model) do |model, exhibit|
        exhibit.exhibit_if_applicable?(model, context)
      end
    end

    def exhibit_if_applicable?(model, context)
      if applicable_to?(model)
        new(model, context)
      else
        model
      end
    end

    # this method to be override by subclass
    def applicable_to?(model)
      false
    end
  end
end
