module ApplicationHelper
  def status_tag(_flg, options = {})
    options[:true_text] ||= ''
    options[:false_text] ||= ''

    if _flg
      content_tag(:span, options[:true_text], class: 'status true')
    else
      content_tag(:span, options[:false_text], class: 'status false')
    end
  end
end
