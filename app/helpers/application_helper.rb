module ApplicationHelper
  def nav_active(local, target)
    local = [] << local unless local.class == Array
    return 'active' if local.include? target.to_sym
  end

  def smart_time_ago(raw_time, days_distance = 7)
    return raw_time if raw_time.blank?
    if raw_time + days_distance.day < Time.now
      raw "<abbr class=\"timeago\" title=\"#{raw_time}\">#{raw_time.strftime('%Y/%m/%d %H:%M')}</abbr>"
    else
      raw "<time class=\"timeago\" title=\"#{raw_time}\" datetime=\"#{raw_time}\"></time>"
    end
  end
end
