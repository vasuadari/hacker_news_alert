defmodule HackerNews.Client do
  @rss_url "https://news.ycombinator.com/rss"

  def fetch_rss_feed do
    HTTPClient.get(@rss_url)
    |> case do
      {:ok, %{body: body, status_code: 200}} ->
        {:ok, body}

      _ ->
        {:error, :failed}
    end
  end
end
