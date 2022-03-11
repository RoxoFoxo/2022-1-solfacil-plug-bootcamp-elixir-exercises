defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&String.split(&1, ~r'[aeiouxy]', include_captures: true, parts: 2, trim: true))
    |> Enum.map(&rules/1)
    |> Enum.join(" ")
  end

  ### Haven't solved, probably will start over ###

  defp rules([start, vowel, rest]) do
    cond do
      String.match?(start, ~r'q$') and vowel == "u" ->
        rest <> start <> vowel <> "ay"

      true ->
        vowel <> rest <> start <> "ay"
    end
  end

  defp rules([vowel, rest]) do
    cond do
      vowel == "x" and String.match?(rest, ~r'^[aeiou]') ->
        rest <> vowel <> "ay"

      vowel == "y" and String.match?(rest, ~r'^[aeiou]') ->
        rest <> vowel <> "ay"

      # vowel and rest get switched up in this case
      rest == "y" and String.length(vowel) == 1 ->
        rest <> vowel <> "ay"

      true ->
        vowel <> rest <> "ay"
    end
  end
end
