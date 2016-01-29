module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def error_messages(resource)
    resource.errors.full_messages.each do |msg|
      concat(content_tag(:div, msg, class: "alert alert-danger") do
        concat(content_tag(:button, type: "button", class: "close", data: {dismiss: "alert"}, aria: {label: "Close"}) do
          concat content_tag(:span, '&times;'.html_safe, aria: {hidden: "true"})
        end)
        concat msg
      end)
    end
    nil
  end
end
