defmodule Util do

  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end



  def mostrar_mensaje(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end



  def ingresar(mensaje, :texto) do
    mensaje
    |>IO.gets()
    |>String.trim()
  end

  def ingresar(mensaje, :entero) do
    mensaje
    |>IO.gets()
    |>String.trim()
    |>String.to_integer()
  end

end
