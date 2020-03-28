import Config

config :hacker_news_alert, HackerNews.Mailer,
  adapter: Swoosh.Adapters.SMTP,
  relay: "smtp.gmail.com",
  username: System.get_env("GMAIL_USERNAME"),
  password: System.get_env("GMAIL_PASSWORD"),
  ssl: true,
  retries: 2
