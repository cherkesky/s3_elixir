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

  def s3ls do
    ExAws.S3.list_buckets() |> ExAws.request!() |> get_in([:body, :buckets])
  end

end
