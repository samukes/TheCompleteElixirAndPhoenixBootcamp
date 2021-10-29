defmodule Discuss.AllcontextTest do
  use Discuss.DataCase

  alias Discuss.Allcontext

  describe "topics" do
    alias Discuss.Allcontext.Topic

    import Discuss.AllcontextFixtures

    @invalid_attrs %{title: nil}

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Allcontext.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Allcontext.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Topic{} = topic} = Allcontext.create_topic(valid_attrs)
      assert topic.title == "some title"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Allcontext.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Topic{} = topic} = Allcontext.update_topic(topic, update_attrs)
      assert topic.title == "some updated title"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Allcontext.update_topic(topic, @invalid_attrs)
      assert topic == Allcontext.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Allcontext.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Allcontext.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Allcontext.change_topic(topic)
    end
  end
end
