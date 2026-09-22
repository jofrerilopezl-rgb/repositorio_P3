defmodule Util do

   def mostrar_mensaje(mensaje) do
      mensaje
      |> IO.puts()
   end

   def mostrar_mensaje_java(mensaje) do
       System.cmd("java",["-cp",".","Mensaje", mensaje])
   end

  #pattern matching
  def ingresar(mensaje,:texto) do # atomo
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  # Tarea : usar manejo de excepciones para evitar errores de conversión
  def ingresar(mensaje,:entero) do
    mensaje
    |> IO.gets()
    |> String.trim()
    |> String.to_integer()
  end


end
