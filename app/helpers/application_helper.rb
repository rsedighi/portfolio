module ApplicationHelper
  def flash_class(level)
    case level
      # when :notice then "info"
      # when :success then "success"
      # when :error then "error"
      # when :alert then "warning"
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
