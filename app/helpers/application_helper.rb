# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def friendly_date(date)
    date.strftime("%B %e, %Y")
  end
  
  def admin?
    @controller.admin?
  end
  
  def admin
    return '' unless admin?
    #<div class="admin">
    yield
    #</div>
  end
  
  def markdown_help
    return <<-EOH
<span class="help">
  (#{link_to 'Markdown syntax',
      'http://daringfireball.net/projects/markdown/syntax',
        :class => 'admin'})</span>
EOH
  end
  
end
