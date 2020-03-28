defmodule Mix.Tasks.HackerNewsAlert do
  use Mix.Task

  @app_name :hacker_news_alert

  def run(_) do
    {:ok, _} = Application.ensure_all_started(@app_name)
    news_items = HackerNews.fetch_top_news()

    Path.join([
      :code.priv_dir(@app_name),
      "static",
      "subscribers.txt"
    ])
    |> File.stream!()
    |> Stream.each(fn row ->
      [name, email] = String.split(row, ",")

      {:ok, _} =
        HackerNews.send_top_news_alert(
          name,
          String.trim(email),
          news_items
        )
    end)
    |> Stream.run()

    IO.puts("Emails have been sent successfully.")
  end
end
