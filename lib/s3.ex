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
  def runlambda do
    ExAws.Lambda.invoke("exawstest", %{},%{},[]) |> ExAws.request!()
  end
  def lambdals do
    ExAws.Lambda.list_functions() |> ExAws.request!()
  end
  def bucketls do
    ExAws.S3.list_buckets() |> ExAws.request!() |> get_in([:body, :buckets])
  end
  def objectls(bucket) do
    ExAws.S3.list_objects(bucket) |> ExAws.request!() |> get_in([:body, :contents])
  end

  @spec s3put :: :ok | ExAws.Operation.S3.t()
  def s3put do
    image = IO.gets("Please enter the file name & path: ")
      |> String.trim()
      |>IO.inspect()

    case File.read(image) do
      {:ok, content} -> ExAws.S3.put_object("s3-elixir-s3","images/#{image}", content)
                        |> ExAws.request!()
      {:error, reason} -> IO.puts(reason)
      end

 end
  #def invoke(payload) do
  #   ExAws.Lambda.invoke("aws-ses-lambda-v1", payload, "no_context")
  #   |> ExAws.request(region: System.get_env("AWS_REGION"))
  # end
end
