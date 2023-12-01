defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
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

  def partTwo() do
    # input = File.read!("./lib/input.txt")
    input = """
          two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    """

    numbers_as_text = [
      "one 1",
      "two 2",
      "three 3",
      "four 4",
      "five 5",
      "six 6",
      "seven 7",
      "eight 8",
      "nine 9"
    ]

    sanitized_input =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(fn x ->
        numbers_as_text
        |> Enum.reduce(x, fn {k, v}, acc -> String.replace(acc, k, v) end)
      end)
      |> Enum.map(fn x -> String.replace(x, ~r/[^\d]/, "") end)

    IO.inspect(sanitized_input)

    sanitized_input
    |> Enum.map(fn x ->
      (x |> String.first()) <> (x |> String.last())
    end)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end
end
