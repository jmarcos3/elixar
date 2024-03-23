ExUnit.start()

defmodule Fatorial do
  @doc """
  Implementar uma função que calcula o fatorial
  de um número n utilizando recursão.

  ## Dicas

  O fatorial de um número se dá pela multiplicação dele mesmo
  com o resultado do fatorial de seu antecessor.
  """
  @spec run(integer) :: integer
  def run(n) do
    cond do
      n <= 1 -> fatorial(n,1)
      true -> fatorial(n,0)
    end
  end

    def fatorial(1,calculo) do calculo end
    def fatorial(n,calculo) do
      antecessor = calculoAntecessor(n)
      cond do
        antecessor <= 1 -> calculo = n * fatorial(antecessor,1)
        true -> calculo = n * fatorial(antecessor,calculo)
      end
    end

    def calculoAntecessor(n) do
      antecessor = n - 1
      cond do
        antecessor == 0 -> antecessor = 1
        true -> antecessor
      end
    end

end

defmodule FatorialTest do
  use ExUnit.Case, async: true

  test "deve calcular o fatorial de um número inteiro corretamente" do
    assert Fatorial.run(1) == 1
    assert Fatorial.run(2) == 2
    assert Fatorial.run(3) == 6
    assert Fatorial.run(4) == 24
    assert Fatorial.run(5) == 120
    assert Fatorial.run(20) == 2_432_902_008_176_640_000
  end
end
