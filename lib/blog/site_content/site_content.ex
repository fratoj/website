defmodule Blog.SiteContent do
  require Logger

  @moduledoc """
  The SiteContent context.
  """

  import Ecto.Query, warn: false
  alias Blog.Repo

  alias Blog.SiteContent.Client

  @doc """
  Returns the list of clients.

  ## Examples

      iex> list_clients()
      [%Client{}, ...]

  """
  def list_clients do
    Repo.all(Client)
  end

  @doc """
  Gets a single client.

  Raises `Ecto.NoResultsError` if the Client does not exist.

  ## Examples

      iex> get_client!(123)
      %Client{}

      iex> get_client!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client!(id), do: Repo.get!(Client, id)

  @doc """
  Creates a client.

  ## Examples

      iex> create_client(%{field: value})
      {:ok, %Client{}}

      iex> create_client(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client(attrs \\ %{}) do
    %Client{}
    |> Client.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a client.

  ## Examples

      iex> update_client(client, %{field: new_value})
      {:ok, %Client{}}

      iex> update_client(client, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client(%Client{} = client, attrs) do
    client
    |> Client.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Client.

  ## Examples

      iex> delete_client(client)
      {:ok, %Client{}}

      iex> delete_client(client)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client changes.

  ## Examples

      iex> change_client(client)
      %Ecto.Changeset{source: %Client{}}

  """
  def change_client(%Client{} = client) do
    Client.changeset(client, %{})
  end

  alias Blog.SiteContent.Career

  @doc """
  Returns the list of careers.

  ## Examples

      iex> list_careers()
      [%Career{}, ...]

  """
  def list_careers do
    Repo.all(Career)
  end

  @doc """
  Gets a single career.

  Raises `Ecto.NoResultsError` if the Career does not exist.

  ## Examples

      iex> get_career!(123)
      %Career{}

      iex> get_career!(456)
      ** (Ecto.NoResultsError)

  """
  def get_career!(id), do: Repo.get!(Career, id)

  @doc """
  Creates a career.

  ## Examples

      iex> create_career(%{field: value})
      {:ok, %Career{}}

      iex> create_career(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_career(attrs \\ %{}) do
    %Career{}
    |> Career.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a career.

  ## Examples

      iex> update_career(career, %{field: new_value})
      {:ok, %Career{}}

      iex> update_career(career, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_career(%Career{} = career, attrs) do
    career
    |> Career.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Career.

  ## Examples

      iex> delete_career(career)
      {:ok, %Career{}}

      iex> delete_career(career)
      {:error, %Ecto.Changeset{}}

  """
  def delete_career(%Career{} = career) do
    Repo.delete(career)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking career changes.

  ## Examples

      iex> change_career(career)
      %Ecto.Changeset{source: %Career{}}

  """
  def change_career(%Career{} = career) do
    Career.changeset(career, %{})
  end

  alias Blog.SiteContent.Blogpost

  @doc """
  Returns the list of blogposts.

  ## Examples

      iex> list_blogposts()
      [%Blogpost{}, ...]

  """
  def list_blogposts do
    Blogpost
    |> Repo.all()
    |> Repo.preload(:user)
  end

  @doc """
  Gets a single blogpost.

  Raises `Ecto.NoResultsError` if the Blogpost does not exist.

  ## Examples

      iex> get_blogpost!(123)
      %Blogpost{}

      iex> get_blogpost!(456)
      ** (Ecto.NoResultsError)

  """
  def get_blogpost!(id) do
    Blogpost
    |> Repo.get!(id)
    |> Repo.preload(:user)
  end

  @doc """
  Creates a blogpost.

  ## Examples

      iex> create_blogpost(%{field: value})
      {:ok, %Blogpost{}}

      iex> create_blogpost(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_blogpost(attrs \\ %{}) do
    # |> Ecto.Changeset.cast_assoc(:user, with: &Blogpost.changeset/2)
    %Blogpost{}
    |> Blogpost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a blogpost.

  ## Examples

      iex> update_blogpost(blogpost, %{field: new_value})
      {:ok, %Blogpost{}}

      iex> update_blogpost(blogpost, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_blogpost(%Blogpost{} = blogpost, attrs) do
    blogpost
    |> Blogpost.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:user, with: &Blogpost.changeset/2)
    |> Repo.update()
  end

  @doc """
  Deletes a Blogpost.

  ## Examples

      iex> delete_blogpost(blogpost)
      {:ok, %Blogpost{}}

      iex> delete_blogpost(blogpost)
      {:error, %Ecto.Changeset{}}

  """
  def delete_blogpost(%Blogpost{} = blogpost) do
    Repo.delete(blogpost)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking blogpost changes.

  ## Examples

      iex> change_blogpost(blogpost)
      %Ecto.Changeset{source: %Blogpost{}}

  """
  def change_blogpost(%Blogpost{} = blogpost) do
    Blogpost.changeset(blogpost, %{})
  end
end
