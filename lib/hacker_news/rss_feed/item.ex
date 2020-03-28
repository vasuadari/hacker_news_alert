defmodule HackerNews.RSSFeed.Item do
  defstruct [
    :comments,
    :description,
    :id,
    :link,
    :published_date,
    :site,
    :title
  ]

  def new(item) do
    {
      "item",
      [],
      [
        {"title", [], [title]},
        {"link", [], [link]},
        {"pubdate", [], [published_date]},
        {"comments", [], [comments]},
        {"description", [], [description]}
      ]
    } = item

    %URI{host: host} = URI.parse(link)
    %URI{query: query} = URI.parse(comments)
    uri = URI.decode_query(query)

    %__MODULE__{
      comments: comments,
      description: description,
      id: uri["id"],
      link: link,
      published_date: published_date,
      site: host,
      title: title
    }
  end
end
