defmodule Tienda do

  def main do
    monto_compra =
      "Ingrese el monto total de la compra: "
      |> Util.ingresar(:real)

    porcentaje_descuento =
      calcular_porcentaje_descuento(monto_compra)

    valor_descuento =
      calcular_valor_descuento(monto_compra, porcentaje_descuento)

    valor_final =
      calcular_valor_final(monto_compra, valor_descuento)

    generar_mensaje(valor_descuento, valor_final)
    |> Util.mostrar_mensaje()
  end

  #guardas y las clausulas
  defp calcular_porcentaje_descuento(monto) when monto <= 50000 do
    0
  end

  defp calcular_porcentaje_descuento(monto) when monto <= 100000 do
    0.05
  end

  defp calcular_porcentaje_descuento(monto) when monto <= 500000 do
    0.1
  end

  defp calcular_porcentaje_descuento(monto) when monto > 50000 do
    0.15
  end


  defp calcular_valor_descuento(monto, porcentaje) do
    monto * porcentaje
  end

  defp calcular_valor_final(monto, valor_descuento) do
    monto - valor_descuento
  end

  defp generar_mensaje(_valor_descuento, valor_final) do
    valor_final_str = :erlang.float_to_binary(valor_final, [decimals: 1])

    "Valor final de su compra es de: $#{valor_final_str}"
  end

end

Tienda.main()
