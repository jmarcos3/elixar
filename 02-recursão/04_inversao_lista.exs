ExUnit.start()

defmodule InversaoLista do
  @doc """
  Implementar uma função que inverte a ordem
  dos elementos em uma lista usando recursão.
  """
  @spec run(list(integer)) :: list(integer)
  def run(xs) do
    inverteLista(xs,[])
  end

  def inverteLista([],lista) do lista end # condição de parada quando a lista estiver vazia

  def inverteLista([h|t],listaAux) do
    listaAux = [h | listaAux] # Separo a lista em head e tail, e em toda chamada recursiva eu adiciono o elemento ao inicio da lista aux
    inverteLista(t,listaAux)
  end
end

defmodule InversaoListaTest do
  use ExUnit.Case, async: true

  test "deve inverter a ordem dos elementos de uma lista" do
    assert InversaoLista.run([]) == []
    assert InversaoLista.run([1]) == [1]
    assert InversaoLista.run([1, 2, 3]) == [3, 2, 1]
  end
end
