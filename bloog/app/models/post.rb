require 'active_model'

class Post
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :blog, :title, :body, :pubdate, :image_url
  validates :title, presence: true

  def initialize(args={})
    args.each { |k, v| send "#{k}=", v }
  end

  def publish(clock=DateTime)
    return false unless valid?
    self.pubdate = clock.now
    @blog.add_entry self
  end

  def persisted?
    false
  end
end
