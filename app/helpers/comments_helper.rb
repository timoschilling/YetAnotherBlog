module CommentsHelper
  def format_comment_date(date)
    date.strftime("%d.%m.%Y")
  end
end
