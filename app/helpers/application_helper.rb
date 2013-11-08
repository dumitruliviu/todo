module ApplicationHelper
  def markdown(content)
    new_content = RedCloth.new(content).to_html
  end
  
  def set_title(page_title)
    content_for(:title) { page_title }
  end
end
