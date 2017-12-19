module ApplicationHelper
  def url_to_links(s)
    s.gsub(URI.regexp, '<a target="_blank" href="\0">\0</a>').html_safe
  end
end
