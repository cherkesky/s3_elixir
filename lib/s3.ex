defmodule S3 do
  @moduledoc """
  Documentation for `S3`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> S3.hello()
      :world

  """
  def hello do
    :world
  end

  def bucketsls do
    ExAws.S3.list_buckets() |> ExAws.request!() |> get_in([:body, :buckets])
  end
  def objectsls(bucket) do
    ExAws.S3.list_objects(bucket) |> ExAws.request!() |> get_in([:body, :contents])
  end

  @spec s3put :: :ok | ExAws.Operation.S3.t()
  def s3put do
    image = IO.gets("Please enter the file name & path: ")
      |> String.trim()
      |>IO.inspect()

    case File.read("elixir.png") do
      {:ok, content} -> ExAws.S3.put_object("s3-elixir-s3","images/elixir.png", content)
                        |> ExAws.request!()
      {:error, reason} -> IO.puts(reason)
      end
      # ExAws.S3.put_object("s3elixirs3", "images/elixir.png", image)
  end
end
