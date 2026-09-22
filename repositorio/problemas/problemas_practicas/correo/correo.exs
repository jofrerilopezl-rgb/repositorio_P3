defmodule Correo do

  def main do

    nombre_usuario =
      "ingrese el nombre del usuario: "
    |> Util.ingresar(:texto)
    |> String.trim()
    |> String.downcase()

    apellido_usuario =
      "ingrese el apellido del usuario: "
    |> Util.ingresar(:texto)
    |> String.trim()
    |> String.downcase()

    crear_correo(nombre_usuario,apellido_usuario)
    |> Util.mostrar_mensaje()

  end

  def crear_correo(nombre,apellido)do

    "#{nombre}.#{apellido}@uniquindio.edu.co"

  end

end

Correo.main()
