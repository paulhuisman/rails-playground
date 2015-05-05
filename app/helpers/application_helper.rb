module ApplicationHelper
	def nav_links
    items = [articles_link, authors_link, comments_link]
    content_tag :ul, :class => "nav nav-tabs " do
      items.collect { |item| concat item}
    end
  end

  def articles_link
    nav_item_active_if(@articles || @article) do
     link_to "Articles", articles_path
    end
  end

  def authors_link
    nav_item_active_if(@authors || @author) do
     link_to "Authors", authors_path
    end
  end

  def comments_link
    nav_item_active_if(@comments || @comment) do
     link_to "Comments", comments_path
    end
  end

  def nav_item_active_if(condition, attributes = {}, &block)
    if condition
      attributes["class"] = "active"
    end
    content_tag(:li, attributes, &block)
  end
end

