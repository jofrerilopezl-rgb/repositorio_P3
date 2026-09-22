defmodule Tienda do
  @moduledoc """
  Módulo que representa una tienda de productos.
  -version 1.0
  -autor: Juan Pérez
  -fecha: 2024-06-15
  """

  @doc """
  Función principal que inicia la aplicación de la tienda.
  """
  def main do

    valor_total = "Ingresar el valor total de la compra: "
    |> Util.ingresar(:entero) # inmutable

    valor_entregado= "Ingresar el valor del pago: "
    |> Util.ingresar(:entero) # inmutable

    calcular_devuelta(valor_total, valor_entregado)
    |> generar_mensaje_devuelta()
    |> Util.mostrar_mensaje()

  end

  
  def calcular_devuelta(valor_total, valor_entregado) do
    valor_entregado - valor_total
  end

  def generar_mensaje_devuelta(devuelta) do
   "La devuelta es: #{devuelta}"
  end
end

Tienda.main()
