defmodule Tienda do
  def main do
    precio_producto =
      "ingrese el precio del producto: "
      |> Util.ingresar(:real)

    descuento_estudiante = Tienda.crear_descuento(20)
    descuento_empleado = Tienda.crear_descuento(30)

    descuento_estudiante_valor = descuento_estudiante.(precio_producto)
    descuento_empleado_valor = descuento_empleado.(precio_producto)

    crear_mensaje(descuento_estudiante_valor, descuento_empleado_valor)
    |> Util.mostrar_mensaje()
  end

  def crear_descuento(descuento) do
    fn precio ->
      precio * (1 - descuento / 100)
    end
  end

  def crear_mensaje(descuento_estudiante, descuento_empleado) do
    est_formateado = :erlang.float_to_binary(descuento_estudiante, [decimals: 1])
    emp_formateado = :erlang.float_to_binary(descuento_empleado, [decimals: 1])

    "El valor final para estudiantes es de $#{est_formateado} y para empleados es de $#{emp_formateado}"
  end

end

Tienda.main()
