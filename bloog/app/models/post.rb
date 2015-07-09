class Post
  attr_accessor :blog, :title, :body

  def initialize(args={})
    args.each { |k, v| send "#{k}=", v }
  end

  def publish
    blog.add_entry self
  end
end
