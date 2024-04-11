ExUnit.start()

defmodule InversaoString do
  @doc """
  Inverte uma string fornecida utilizando recursão.

  ## Dicas
  - Lembre-se de que uma string pode ser tratada como uma lista de caracteres.
  - Considere o caso base onde a string é vazia.

  ## Exemplos

      iex> InversaoString.run("elixir")
      "rixile"

      iex> InversaoString.run("")
      ""
  """
  @spec run(String.t()) :: String.t()
  def run(s) do
    lista = String.graphemes(s) # graphemes transforma a string em uma lista de caracteres
    inverteString(Enum.reverse(lista),[])
  end

  def inverteString([],listaAux) do Enum.join(listaAux) end # Enum.join transforma a lista em string
  def inverteString([h|t],listaAux) do
    listaAux = listaAux ++ [h]
    inverteString(t,listaAux)
  end

end

defmodule InversaoStringTest do
  use ExUnit.Case, async: true

  test "inverte uma string não vazia" do
    assert InversaoString.run("elixir") == "rixile"
  end

  test "retorna uma string vazia quando a entrada também for uma string vazia" do
    assert InversaoString.run("") == ""
  end
end
