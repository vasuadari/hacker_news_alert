defmodule HTTPClient do
  defdelegate get(url), to: Mojito
end
