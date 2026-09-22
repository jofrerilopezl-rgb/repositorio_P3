defmodule Registro do

  def main do

    nombre_usuario =
      "ingrese el nombre del usuario: "
    |> Util.ingresar(:texto)
    |> String.trim()

    crear_usuario(nombre_usuario)
    |> Util.mostrar_mensaje()

  end

  def crear_usuario(nombre)do

    if String.length(nombre) >=5 do
      "Usuario creado con éxito: #{nombre}"
    else
      "Error, el nombre debe tener al menos 5 caracteres"
    end

  end

end

Registro.main()
