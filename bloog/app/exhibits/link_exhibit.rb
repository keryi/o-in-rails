class LinkExhibit < BaseExhibit
  RELATIONS = %w[next prev up]

  def next_url
    @context.url_for(self.next)
  end

  def prev_url
    @context.url_for(prev)
  end

  def up_url
    @context.url_for(up)
  end

  def url_hashes
    {
      'links': RELATIONS.map do |rel|
        {
          'rel': rel,
          'href': send("#{rel}_url")
        }
      end
    }
  end

  def serializable_hash(*args)
    super.merge(url_hashes)
  end

  def to_json(options = {})
    serializable_hash(options).to_json
  end

  def self.applicable_to?(model)
    model.is_a?(Post)
  end
end
