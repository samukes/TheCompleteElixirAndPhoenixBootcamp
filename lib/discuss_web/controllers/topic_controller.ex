defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Allcontext.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
  end
end
