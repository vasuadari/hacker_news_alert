defmodule HackerNews do
  alias HackerNews.{RSSReader, EmailComposer}

  @from Application.get_env(:hacker_news_alert, HackerNews.Mailer) |> Keyword.get(:username)

  def send_top_news_alert(name, email, news_items \\ fetch_top_news()) do
    compose_email_with_top_news(name, email, news_items)
    |> HackerNews.Mailer.deliver()
  end

  def compose_email_with_top_news(name, email, news_items \\ fetch_top_news()) do
    EmailComposer.compose(
      {"Hacker News", @from},
      {name, email},
      %{items: news_items},
      EmailComposer.TopNews
    )
  end

  def fetch_top_news do
    RSSReader.items()
  end
end
