defmodule Plataforma do
  def main do
    usuario = "Ingrese el nombre del usuario: " |> Util.ingresar(:texto)
    edad_usuario = "Ingrese la edad del usuario: " |> Util.ingresar(:entero)
    credenciales_usuario = "Ingrese las credenciales del usuario (true/false): " |> Util.ingresar(:boolean)
    intentos_fallidos = "Ingrese el número de intentos fallidos: " |> Util.ingresar(:entero)

    validar_acceso(usuario, edad_usuario, credenciales_usuario, intentos_fallidos)
    |> Util.mostrar_mensaje()
  end

  def verificar_credenciales(credenciales) do
    unless credenciales do
      {:error, "Acceso denegado: credenciales inválidas."}
    else
      :ok
    end
  end

  def verificar_edad(edad) do
    unless edad >= 18 do
      {:error, "Restricción de edad: el usuario es menor de edad."}
    else
      :ok
    end
  end

  def verificar_intentos_fallidos(intentos) do
    if intentos >= 3 do
      {:error, "Cuenta bloqueada: ha alcanzado o superado el límite de 3 intentos fallidos."}
    else
      :ok
    end
  end

  def validar_acceso(_usuario, edad, credenciales, intentos) do
    eval_credenciales = verificar_credenciales(credenciales)

    if eval_credenciales != :ok do
      eval_credenciales
    else
      eval_edad = verificar_edad(edad)

      if eval_edad != :ok do
        eval_edad
      else
        eval_intentos = verificar_intentos_fallidos(intentos)

        if eval_intentos != :ok do
          eval_intentos
        else
          {:ok, "Acceso concedido"}
        end
      end
    end
  end
end

Plataforma.main()
