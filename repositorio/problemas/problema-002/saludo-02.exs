defmodule Saludo do

  def main do

    "ingrese el nombrre del empleado"
    |> ingresar(:texto)
    |> genrar_mensaje()
    |> Util.mostrar_mensaje()
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |>IO.gets()
    |>String.trim()
  end

  def genrar_mensaje(nombre) do
    "Bienvenidos, #{nombre}, a la empresa Once Ltda"
  end


end

Saludo.main()
