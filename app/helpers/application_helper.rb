module ApplicationHelper

  @@base_title = "Microposts"

  def base_title
    @@base_title
  end

  def full_title(page_title = '')
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
