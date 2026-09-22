defmodule Tienda do

@moduledoc """
  Este módulo representa una tienda que solicita al usuario el valor de una compra y genera un mensaje de bienvenida personalizado.
  -version 1.0
  -autor: jofrer Lopez
  fecha: 2024-09-08
"""

@doc """
funcuion principal que inicia la aplicacion de la tienda
"""

  def main do

    valor_total = "ingrese el valor total de la compra: "
    |>Util.ingresar(:entero)

    valor_entregado = "ingrese el valor entregado por el cliente: "
    |>Util.ingresar(:entero)

    calcular_devuelta(valor_total, valor_entregado)
    |> generar_mensaje_devuelta()
    |> Util.mostrar_mensaje()

  end



  def calcular_devuelta(valor_total, valor_entregado) do
    if valor_entregado >= valor_total do
      valor_entregado - valor_total
    else
      IO.puts("El valor entregado es menor al valor total de la compra. Por favor, ingrese un valor válido.")
      valor_entregado = "ingrese nuevamente el valor entregado por el cliente: "
      |>Util.ingresar(:entero)
      calcular_devuelta(valor_total, valor_entregado)
    end

  end



  def generar_mensaje_devuelta(devuelta) do
    "El valor de la devuelta es: #{devuelta}"
  end



end

Tienda.main()
