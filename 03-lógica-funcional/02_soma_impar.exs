ExUnit.start()

defmodule SomaImpares do
  @doc """
  Soma todos os números ímpares em uma lista de inteiros utilizando recursão.

  ## Dicas
  - Você pode usar a função `rem/2` para verificar se um número é ímpar.
  - Considere o caso base de uma lista vazia.

  ## Exemplos

      iex> SomaImpares.run([1, 2, 3, 4, 5])
      9

      iex> SomaImpares.run([])
      0
  """
  @spec run(list(integer)) :: integer
  def run(nums) do
    somaImpar(nums,0)
  end

  def somaImpar([],soma) do soma end
  def somaImpar([h|t],soma) do
    
    cond do
    Integer.is_odd(h) == true -> soma = soma + h
    Integer.is_odd(h) == false -> soma
    end

    somaImpar(t,soma)


  end
end

defmodule SomaImparesTest do
  use ExUnit.Case, async: true

  test "soma números ímpares em uma lista" do
    assert SomaImpares.run([1, 2, 3, 4, 5]) == 9
  end

  test "retorna 0 para uma lista vazia" do
    assert SomaImpares.run([]) == 0
  end
end
