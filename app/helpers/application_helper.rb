module ApplicationHelper

def menu_link(text, src)
  link_to content_tag(:b, text), src, class: (current_page?(src) and 'active')          
end

end
