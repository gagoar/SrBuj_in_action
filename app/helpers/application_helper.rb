module ApplicationHelper
  def errors_for(object, field)
    if object && object.errors[field].any?
      content_tag(:span, object.errors[field].to_sentence, class: 'help-inline error')
    end
  end
end
