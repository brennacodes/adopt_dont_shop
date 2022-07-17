module ApplicationHelper
  def nav_link(name, path)
    link_to name, path, class: "nav-link"
  end
end
