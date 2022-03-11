defmodule BirdCount do
  def today(list) do
    case list do
      [today | _] ->
        today

      _ ->
        nil
    end
  end

  def increment_day_count(list) do
    case list do
      [today | tail] ->
        [today + 1 | tail]

      _ ->
        [1]
    end
  end

  def has_day_without_birds?(list) do
    Enum.member?(list, 0)
  end

  def total(list) do
    case list do
      [] ->
        0

      [_|_] ->
        Enum.reduce(list, fn birds, acc -> birds + acc end)
    end
  end

  def busy_days(list) do
    Enum.count(list, fn x -> x >= 5 end)
  end
end
