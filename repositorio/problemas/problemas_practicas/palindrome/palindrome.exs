defmodule Palindrome do
  def main do
    palabra = "Ingrese una palabra: "
    |> Util.ingresar(:texto)

    if es_palindromo?(palabra) do
      "La palabra '#{palabra}' es un palíndromo."
      |> Util.mostrar_mensaje()
    else
      "La palabra '#{palabra}' no es un palíndromo."
      |> Util.mostrar_mensaje()
    end
  end

  defp es_palindromo?(palabra) do
    palabra = String.downcase(palabra)
    palabra == String.reverse(palabra)
  end

end

Palindrome.main()
