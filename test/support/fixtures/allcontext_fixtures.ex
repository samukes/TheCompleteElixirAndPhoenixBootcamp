defmodule Discuss.AllcontextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discuss.Allcontext` context.
  """

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Discuss.Allcontext.create_topic()

    topic
  end
end
