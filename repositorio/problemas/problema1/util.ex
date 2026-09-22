defmodule Util do

  def mostrar_mensaje(mensaje) do
    System.cmd("java", ["-cp", "..", "problema1.Mensaje", mensaje])
  end



end
