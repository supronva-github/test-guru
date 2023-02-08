module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo , "https://github.com/#{author}/#{repo}", target: :blank
  end

  def show_flash
    flash.map do |key, message|
      content_tag :p, message, class: "flash #{key}"
    end.join.html_safe
  end

  def icon(name)
      "<i class='bi bi-#{name}'></i>".html_safe
  end
end
