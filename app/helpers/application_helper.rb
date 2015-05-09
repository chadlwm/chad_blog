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

  def show_flashes
    result_html = []
    css = {error: 'danger', notice: 'info'}
    flash.each do |key, msg|
      html =<<-HTML
        <div class='alert alert-#{css[key.to_sym]} alert-dismissible fade in' role='alert'>
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
          #{msg}
        </div>
      HTML

      result_html << html
    end
    raw result_html.join
  end

  def render_metas(args = {})
    binding.pry
    @title = args[:title] || Settings.site.title
    @description = args[:description] || Settings.site.description
    @url = args[:url] || Settings.site.url
    @avatar = args[:avatar] || Settings.site.avatar
    @avatar = "http://#{request.server_name}#{@avatar}" unless @avatar.start_with?('http://')
    @site_name = Settings.site.title

    render 'layouts/metas'
  end
end
