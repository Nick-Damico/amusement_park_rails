module ApplicationHelper
  include SessionsHelper

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def full_title(title = '')
      app_title = 'RailsAmusementPark'
    if title.empty?
      app_title
    else
      "#{app_title} | #{title}"
    end
  end

  def is_admin?
    current_user.admin
  end
end
