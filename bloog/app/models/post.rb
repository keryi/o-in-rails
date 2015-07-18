require 'date'
require 'active_record'

class Post < ActiveRecord::Base
  include FigLeaf

  hide ActiveRecord::Base, ancestor: true, except: [
    Object, :init_with, :new_record?, :errors, :valid?, :save
  ]

  hide_singletons ActiveRecord::Calculations, ActiveRecord::FinderMethods,
    ActiveRecord::Relation

  attr_accessor :blog
  validates :title, presence: true

  def publish(clock=DateTime)
    return false unless valid?
    self.pubdate = clock.now
    @blog.add_entry self
  end

  def picture?
    image_url.present?
  end

  def save(*)
    set_default_body
    super
  end

  class << self
    def most_recent(limit = 10)
      order('pubdate DESC').limit(limit)
    end

    def first_before_date(date)
      where('pubdate < ?', date).order('pubdate DESC').first
    end

    def first_after_date(date)
      where('pubdate > ?', date).order('pubdate ASC').first
    end

    def prev
      self.class.first_before_date(pubdate)
    end

    def next
      self.class.first_after_date(pubdate)
    end

    def up
      blog
    end
  end

  private

  def set_default_body
    self.body = 'Nothing to see here' if body.blank?
  end
end
