module ApplicationHelper

  #Sets the title for the page
  def title page_title
    content_for(:title){page_title}
  end
end
