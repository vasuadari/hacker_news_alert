defmodule HackerNews.ClientTest do
  use ExUnit.Case, async: true

  alias HackerNews.Client

  @tag :pending
  describe "fetch_rss_feed" do
    test "returns rss feed" do
      assert {:ok, "<rss version=" <> _} = Client.fetch_rss_feed()
    end
  end
end
