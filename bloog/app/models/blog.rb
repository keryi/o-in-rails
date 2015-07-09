class Blog
  attr_reader :entries

  def initialize
    @entries = []
  end

  def title
    'This is title'
  end

  def subtitle
    'This is subtitle'
  end
end
