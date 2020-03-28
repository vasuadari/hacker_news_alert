defmodule HackerNewsTest do
  use ExUnit.Case

  describe "fetch_top_news/0" do
    test "returns top news" do
      assert is_list(HackerNews.fetch_top_news())
    end
  end

  describe "compose_email_with_top_news/0" do
    test "returns composed email with latest news" do
      assert %Swoosh.Email{} = HackerNews.compose_email_with_top_news()
    end
  end
end
