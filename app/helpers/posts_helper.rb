module PostsHelper
  def format_post_date(date)
    date.strftime("%Y.%m.%d")
  end
end
