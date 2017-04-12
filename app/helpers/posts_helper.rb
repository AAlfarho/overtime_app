module PostsHelper
  def status_label status
    status_span_generator(status)
  end

  def status_span_generator status
    label_class = ""
    case status.to_sym
      when :submitted
        label_class = 'label-primary'
      when :approved
        label_class = 'label-success'
      when :rejected
        label_class = 'label-danger'
    end
    content_tag(:span, status.upcase, class: "label #{label_class}")
  end
end
