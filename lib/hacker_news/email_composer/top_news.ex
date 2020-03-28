defmodule HackerNews.EmailComposer.TopNews do
  @behaviour HackerNews.EmailComposer.Base

  @current_file_path __ENV__.file
  @subject "Top News"
  @url "https://news.ycombinator.com"

  import Swoosh.Email

  def compose(sender, recipient, %{items: items}) do
    file_path =
      @current_file_path
      |> Path.dirname()
      |> Path.join("top_news.html.eex")

    html_body = EEx.eval_file(file_path, items: items, url: @url)

    new()
    |> from(sender)
    |> to(recipient)
    |> subject(@subject)
    |> html_body(html_body)
  end
end
