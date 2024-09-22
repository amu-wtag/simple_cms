module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'application/error_messages', locals: { object: })
  end

  def status_tag(_flg, options = {})
    options = options.dup # Duplicate the options hash to prevent modifying frozen hash
    options[:true_text] ||= ''
    options[:false_text] ||= ''

    if _flg
      content_tag(:span, options[:true_text], class: 'status true')
    else
      content_tag(:span, options[:false_text], class: 'status false')
    end
  end
end
