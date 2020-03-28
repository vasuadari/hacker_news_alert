defmodule HackerNews.RSSReaderTest do
  use ExUnit.Case

  alias HackerNews.RSSReader
  alias HackerNews.RSSFeed.Item

  describe "items/0" do
    test "returns list of news items" do
      items = RSSReader.items()

      assert [%Item{} | _] = items
    end
  end
end
