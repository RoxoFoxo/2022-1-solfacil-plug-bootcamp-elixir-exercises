defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    floor(score / 2) - 5
  end

  @spec ability :: pos_integer()
  def ability do
    1..4
    |> Enum.map(fn _ -> roll_six_sided_die() end)
    |> Enum.sort()
    |> Enum.drop(1)
    |> Enum.sum()
  end

  defp roll_six_sided_die do
    Enum.random(1..6)
  end

  @spec character :: t()
  def character do
    constitution_score = ability()
    hitpoints = modifier(constitution_score) + 10

    %DndCharacter{
      strength: ability(),
      dexterity: ability(),
      constitution: constitution_score,
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
      hitpoints: hitpoints
    }
  end
end
