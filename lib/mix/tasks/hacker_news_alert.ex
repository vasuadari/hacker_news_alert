defmodule Mix.Tasks.HackerNewsAlert do
  use Mix.Task

  @app_name :hacker_news_alert

  def run([time_zone_arg]) do
    {:ok, _} = Application.ensure_all_started(@app_name)
    news_items = HackerNews.fetch_top_news()

    subscribers_file_path()
    |> File.stream!()
    |> Stream.each(fn
      "\n" ->
        :skip

      "#" <> _ ->
        :skip

      row ->
        [name, email, time_zone] = String.split(row, ",")
        name = String.trim(name)
        email = String.trim(email)
        time_zone = String.trim(time_zone)

        send_alert(
          Mix.env(),
          name,
          email,
          time_zone,
          time_zone_arg,
          news_items
        )

        :ok
    end)
    |> Stream.run()

    IO.puts("Emails have been sent successfully.")
  end

  defp send_alert(:prod, name, email, time_zone, input_time_zone, news_items)
       when input_time_zone == time_zone do
    {:ok, _} =
      HackerNews.send_top_news_alert(
        name,
        String.trim(email),
        news_items
      )
  end

  defp send_alert(env, _name, email, time_zone, input_time_zone, _news_items)
       when input_time_zone == time_zone do
    IO.puts("Mock sending email to #{email} in #{time_zone} time_zone in #{env} env.")
  end

  defp send_alert(_env, _name, _email, _time_zone, _input_time_zone, _news_items), do: :ok

  defp subscribers_file_path do
    file_name =
      if Mix.env() == :prod do
        "subscribers.txt"
      else
        "test_subscribers.txt"
      end

    Path.join([
      :code.priv_dir(@app_name),
      "static",
      file_name
    ])
  end
end
