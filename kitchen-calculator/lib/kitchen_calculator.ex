defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_unit, volume} = volume_pair
    volume
  end

  def to_milliliter(volume_pair) do
    converted_volume =
      case volume_pair do
        {:cup, volume} ->
          volume * 240

        {:fluid_ounce, volume} ->
          volume * 30

        {:teaspoon, volume} ->
          volume * 5

        {:tablespoon, volume} ->
          volume * 15

        {:milliliter, volume} ->
          volume
      end

    {:milliliter, converted_volume}
  end

  def from_milliliter(volume_pair, unit) do
    {_mililiter, volume} = volume_pair

    case {unit, volume} do
      {:cup, volume} ->
        {:cup, volume / 240}

      {:fluid_ounce, volume} ->
        {:fluid_ounce, volume / 30}

      {:teaspoon, volume} ->
        {:teaspoon, volume / 5}

      {:tablespoon, volume} ->
        {:tablespoon, volume / 15}

      {:milliliter, volume} ->
        {:milliliter, volume}
    end
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
