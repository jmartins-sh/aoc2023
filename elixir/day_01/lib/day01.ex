defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day01.hello()
      :world

  """
  def partOne() do
    input = File.read!("./lib/input.txt")

    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.replace(x, ~r/[^\d]/, "") end)
    |> Enum.map(fn x ->
      (x |> String.first()) <> (x |> String.last())
    end)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end
end
