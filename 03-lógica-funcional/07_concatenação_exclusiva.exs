ExUnit.start()

defmodule ConcatenacaoExclusiva do
  @doc """
  Concatena duas listas, excluindo da primeira lista os elementos já presentes na segunda.

  ## Dicas
  - Utilize recursão para percorrer a primeira lista e verificar se um elemento está na segunda lista.
  - Pode ser útil criar uma função auxiliar para verificar se um elemento está contido em uma lista.

  ## Exemplos

      iex> ConcatenacaoExclusiva.run([1, 2, 3], [3, 4, 5])
      [1, 2, 4, 5]

      iex> ConcatenacaoExclusiva.run([], [1, 2, 3])
      [1, 2, 3]
  """
  @spec run(list(any), list(any)) :: list(any)
  def run(lista1, lista2) do
    listaAux = concatenar(lista1,lista2,[])
    verificar(listaAux,[])
  end

  def concatenar([],[],la) do la end
  def concatenar([h|t],l2,la) do
    la = la ++ [h]
    concatenar(t,l2,la)
  end
  def concatenar([],[h|t],la) do
    la = la ++ [h]
    concatenar([],t,la)
  end


  def verificar([],listaFinal) do listaFinal end
  def verificar([h|t],listaFinal) do
    num = h
    cond do
      comparar(t,num) == true ->
      listaFinal = listaFinal ++ [h]
      verificar(t,listaFinal)

      comparar(t,num) == false -> novaCauda = tail(t)
      verificar(novaCauda,listaFinal)
    end

  end

  def comparar([], _num) do true end
  def comparar([h|_t],num) do
    cond do
      h == num -> false
      true -> true
    end
  end

  def tail ([_h|t]) do t end
end
defmodule ConcatenacaoExclusivaTest do
  use ExUnit.Case, async: true

  test "concatena listas excluindo elementos repetidos" do
    assert ConcatenacaoExclusiva.run([1, 2, 3], [3, 4, 5]) == [1, 2, 4, 5]
  end

  test "concatena uma lista vazia com uma lista não vazia" do
    assert ConcatenacaoExclusiva.run([], [1, 2, 3]) == [1, 2, 3]
  end
end
