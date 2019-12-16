module ApplicationHelper


  def flash_class(level)
    case level
    when :notice then 'alert alert-success alert-dismissible'
    when :alert then 'alert alert-danger alert-dismissible'
    end
  end

end
