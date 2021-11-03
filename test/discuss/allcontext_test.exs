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

  describe "users" do
    alias Discuss.Allcontext.User

    import Discuss.AllcontextFixtures

    @invalid_attrs %{email: nil, provider: nil, token: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Allcontext.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Allcontext.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", provider: "some provider", token: "some token"}

      assert {:ok, %User{} = user} = Allcontext.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.provider == "some provider"
      assert user.token == "some token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Allcontext.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", provider: "some updated provider", token: "some updated token"}

      assert {:ok, %User{} = user} = Allcontext.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.provider == "some updated provider"
      assert user.token == "some updated token"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Allcontext.update_user(user, @invalid_attrs)
      assert user == Allcontext.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Allcontext.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Allcontext.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Allcontext.change_user(user)
    end
  end
end
