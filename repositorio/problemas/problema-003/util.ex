defmodule Util do

  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end


  def ingresar(mensaje, :texto) do
    mensaje
    |>IO.gets()
    |>String.trim()
  end


#tarea: usar menejo de errores en esta funcion
#integer.paarse verifica si el valor ingresado es un numero entero, si no lo es, retorna :error
  def ingresar(mensaje, :entero) do
  valor =
    mensaje
    |> IO.gets()
    |> String.trim()

  if Integer.parse(valor) != :error do
    String.to_integer(valor)
  else
    IO.puts("Debe ingresar un número entero: ")
    ingresar(mensaje, :entero)
  end

end


end
