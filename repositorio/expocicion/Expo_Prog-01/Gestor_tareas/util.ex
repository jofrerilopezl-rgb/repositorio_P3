defmodule Util do
  def ingresar(mensaje, :texto) do
    IO.gets(mensaje) |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        IO.puts(:stderr, "Error: Ingrese un numero valido.\n")
        ingresar(mensaje, :entero)
    end
  end
end
