defmodule ElixirJobs.Offers.Queries.Offer do
  import Ecto.Query, warn: false

  def by_id(query, id) do
    from o in query,
      where: o.id == ^id
  end

  def by_slug(query, slug) do
    from o in query,
      where: o.slug == ^slug
  end

  def published(query) do
    from o in query,
      where: not is_nil(o.published_at) and o.published_at <= ^NaiveDateTime.utc_now()
  end

  def order_published(query) do
    from o in query,
      order_by: o.published_at
  end

  def order_inserted(query) do
    from o in query,
      order_by: o.inserted_at
  end
end