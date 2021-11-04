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

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        provider: "some provider",
        token: "some token"
      })
      |> Discuss.Allcontext.create_user()

    user
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Discuss.Allcontext.create_comment()

    comment
  end
end
