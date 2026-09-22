defmodule RegistrarPaquete do

  def main do
    nombre_cliente =
      "Ingrese el nombre del cliente: "
      |> Util.ingresar(:texto)

    nombre_destinatario =
      "Ingrese el nombre del destinatario: "
      |> Util.ingresar(:texto)

    direccion_entrega =
      "Ingrese la dirección de entrega: "
      |> Util.ingresar(:texto)

    generar_mensaje(nombre_cliente, nombre_destinatario, direccion_entrega)
    |> Util.mostrar_mensaje()

   end


    def generar_mensaje(nombre_cliente, nombre_destinatario, direccion_entrega) do
      "El paquete a nombre de #{nombre_cliente} quedó registrado para ser entregado a #{nombre_destinatario} en la dirección #{direccion_entrega}"
    end

end

RegistrarPaquete.main()
