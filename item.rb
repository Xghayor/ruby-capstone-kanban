require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :archived_items

  def initialize(publish_date)
    @id = rand(1..1000)
    @publish_date = publish_date
    @archived = false
    @archived_items = []
    @genre = []
    @author = []
    @source = []
    @label = []
  end

  def set_genre(genre)
    @genre << genre
  end

  def set_author(author)
    @author << author
  end

  def set_source(source)
    @source << source
  end

  def set_label(label)
    @label << label
  end

  def can_be_archived?
    ten_years_ago = Date.today - 10 * 365
    @publish_date < ten_years_ago
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      @archived_items << self
    end
  end
end