defmodule HackerNews.RSSReader do
  alias HackerNews.Client
  alias HackerNews.RSSFeed.Item

  def items do
    with {:ok, rss_content} <- Client.fetch_rss_feed(),
         {:ok, document} <- Floki.parse_document(rss_content),
         items when is_list(items) <- Floki.find(document, "item") do
      items |> Enum.map(&Item.new/1)
    end
  end
end
