module Helpers

  # Date used in blog post.
  def format_date(date)
    date.strftime("%B %d, %Y")
  end

  # Dates on archives page.
  def short_date(date)
    date.strftime("%b %d")
  end

  # Groups archived posts by year.
  def group_by_year(pages)
    grouped = {}
    pages.each do |page|
      year = page.created_at.year
      grouped[year] ||= []
      grouped[year] << page
    end
    grouped.sort.reverse.each do |group|
      yield group.first, group.last
    end  
  end

  # Used for the index page.  Renders
  # part of the page if it's too long.
  def render_partially(text, page)
    return text if text.length < 2300
    opener = text.split(/<\/p>/).first
    opener += "&nbsp;<span class='readmore'>
      (<a href='#{page.url}'>more...</a>)</span></p>"
    return opener
  end

  # Code highlighting helper.
  def code(lang, &block)
    uv(:lang => lang, :theme => "twilight", &block)
  end
end

Webby::Helpers.register(Helpers)
