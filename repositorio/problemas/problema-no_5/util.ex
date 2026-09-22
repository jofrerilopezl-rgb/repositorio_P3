defmodule Util do
  def ingresar(mensaje, :texto) do
    IO.gets(mensaje)
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    ingresar(mensaje, &String.to_integer/1, :entero)
  end

  def ingresar(mensaje, :real) do
    ingresar(mensaje, &String.to_float/1, :real)
  end

  def ingresar(mensaje, :boolean) do
    entrada = ingresar(mensaje, :texto) |> String.downcase()

    if entrada in ["true", "1", "si", "sí"] do
      true
    else
      if entrada in ["false", "0", "no"] do
        false
      else
        mostrar_error("Error, ingrese 'true' o 'false'\n")
        ingresar(mensaje, :boolean)
      end
    end
  end

  defp ingresar(mensaje, parser, tipo_dato) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número #{tipo_dato}\n"
        |> mostrar_error()

        ingresar(mensaje, parser, tipo_dato)
    end
  end

  def mostrar_mensaje(mensaje) do
    IO.inspect(mensaje)
  end

  def mostrar_error(mensaje) do
    IO.puts(mensaje)
  end
end
