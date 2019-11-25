defmodule Words do
  @spec count(String.t) :: map()
  def count(sentence) do
    tokens = sentence 
    |> String.downcase()
    |> String.replace(~r/@|#|\$|%|&|\^|:|_|!|,/u, " ") 
    |> String.split()
    Enum.reduce(tokens, Map.new(), &count_word/2)
  end

  defp count_word(word, map) do
    Map.update(map, word, 1, &(&1 + 1))
  end
end
