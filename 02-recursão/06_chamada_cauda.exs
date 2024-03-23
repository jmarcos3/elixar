ExUnit.start()

defmodule ChamadaCauda do
  @doc """
  Modificar uma função recursiva (como somatório ou fatorial)
  para usar a otimização de chamada de cauda. Você pode escolher
  qualquer função recursiva, porém você deve escrever de forma
  otimizada para chamada de cauda e também escrever os casos de teste.

  Lembre que "Otimização de Chamada de Cauda" é um método
  aplicado em funções recursivas onde a última instrução
  da funcão é a chamada recursiva, ou seja, a função retorna
  uma chada para a recursão.
  """
  def run(n) do
    fatorial(n,1)
  end

  def fatorial(0,resultado) do resultado end
  def fatorial(n,resultado) do
    fatorial(n-1,resultado*n)
  end
end

defmodule ChamadaCaudaTest do
  use ExUnit.Case, async: true

  test "O valor deve ser:" do
    assert ChamadaCauda.run(1) == 1
    assert ChamadaCauda.run(2) == 2
    assert ChamadaCauda.run(3) == 6
    assert ChamadaCauda.run(4) == 24
    assert ChamadaCauda.run(5) == 120
    assert ChamadaCauda.run(20) == 2_432_902_008_176_640_000
  end
end


"""

"""
