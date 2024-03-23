ExUnit.start()

defmodule Fibonnacci do
  @doc """
  A função de fibonnaci deve receber um inteiro
  e retornar a sequência de fibonnaci como uma lista,
   com o tamanho representado pelo primeiro parâmetro.

  Exemplo: Fibonacci.run(2) # 1 1
  Exemplo: Fibonacci.run(5) # 1 1 2 3 5
  Exemplo: Fibonacci.run(8) # 1 1 2 3 5 8 13 21

  Lembre que a sequência de fibonnacci se dá pela soma
  de um número da sequência somado ao seu antecessor.
  """
  @spec run(integer) :: list(integer)
  def run(n) do
    list = [1,1]  # incialziei a lista já com os valores do fibonacci(2) porque achei mais conveniente
    cond do
      n == 2 -> list # cas seja 2 eu já retorno a lista
      true -> fibo(n-2,list) # caso seja um valor diferente vamos para recursividade, o menos 2 é porque eu já tenho 2 elementos na lista
    end
  end

  def fibo(0,list) do Enum.reverse(list) end
  def fibo(n,[a,b| tail]) do  # aqui eu desistruturei a lista com os primeiros dois elementos e o resto
    next = a + b
    list = fibo(n-1,[next, a, b| tail]) # aqui eu atualizo a lista colocando o novo elemento no começod ela

  end
end

defmodule FibonnacciTest do
  use ExUnit.Case, async: true

  test "deve retornar a sequência de fibonnacci com seus valores corretos" do
    assert Fibonnacci.run(2) == [1, 1]
    assert Fibonnacci.run(5) == [1, 1, 2, 3, 5]
    assert Fibonnacci.run(8) == [1, 1, 2, 3, 5, 8, 13, 21]
  end
end
