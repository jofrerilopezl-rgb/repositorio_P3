defmodule Fabrica do
  def main do
    cedula = Util.ingresar("Ingrese la cédula del cliente: ", :entero)

    calcular_promocion(cedula)
    |> Util.mostrar_mensaje()
  end

  def calcular_promocion(cedula) do

    #rem sirve como el % de java
    if rem(cedula,1991) == 0 do
      "¡Felicidades! El cliente RECIBE el 50% de descuento."
    else
      "El cliente NO recibe descuento."
    end
  end
end


Fabrica.main()
