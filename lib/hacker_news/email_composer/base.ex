defmodule HackerNews.EmailComposer.Base do
  @callback compose(tuple() | String.t(), tuple() | String.t(), Map.t()) :: String.t()
end
