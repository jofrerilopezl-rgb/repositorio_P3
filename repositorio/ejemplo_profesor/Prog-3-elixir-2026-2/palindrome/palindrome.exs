# trim
# reverse
# replace
defmodule Palindroma do

  def main do

    "Ingrese una palabra o frase para verificar si es palíndroma: "
    |> Util.ingresar(:texto)
    |> es_palindroma?()
    |> generar_mensaje()
    |> Util.mostrar_mensaje()

  end


  def es_palindroma?(frase) do
    frase
    |> String.downcase()
    |> String.replace(" ", "")
    |> then(fn cadena -> cadena == String.reverse(cadena) end)
  end

  def generar_mensaje(es_palindroma) do
    if es_palindroma do
      "La frase ingresada es palíndroma"
    else
      "La frase ingresada no es palíndroma"
    end
  end

  def generar_mensaje(true) do
      "La frase ingresada es palíndroma"
  end

  def generar_mensaje(false) do
      "La frase ingresada no es palíndroma"
  end

end

Palindroma.main()
