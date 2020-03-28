defmodule HackerNews.EmailComposer do
  def compose(sender, recipient, map, composer) do
    composer.compose(sender, recipient, map)
  end
end
