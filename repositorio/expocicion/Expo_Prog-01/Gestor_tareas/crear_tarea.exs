defmodule GestorTareas do
  def main do
    IO.puts("Bienvenido, Gestione sus tareas")

    tareas_iniciales = [
      %{id: 1, descripcion: "Comprar insumos", responsable: "Carlos", dias_plazo: 1, completada: false},
      %{id: 2, descripcion: "Enviar reporte", responsable: "Ana", dias_plazo: 4, completada: true}
    ]

    menu(tareas_iniciales, 3)
  end

  defp menu(tareas, id) do
    IO.puts("\n--- MENÚ PRINCIPAL ---")
    IO.puts("1 Crear nueva")
    IO.puts("2 Ver todas")
    IO.puts("3 Completar alguna")
    IO.puts("4 Eliminar alguna")
    IO.puts("5 Salir")

    opcion = Util.ingresar("Elija una opcion: ", :entero)

    case opcion do
      1 ->
        {nuevas_tareas, nuevo_id} = crear_tarea(tareas, id)
        menu(nuevas_tareas, nuevo_id)

      2 ->
        mostrar_tareas(tareas)
        menu(tareas, id)

      3 ->
        nuevas_tareas = actualizar_tarea(tareas)
        menu(nuevas_tareas, id)

      4 ->
        mostrar_tareas(tareas)
        nuevas_tareas = eliminar_tarea(tareas)
        menu(nuevas_tareas, id)

      5 ->
        IO.puts("Saliendo...")

      _ ->
        IO.puts("Opcion no valida")
        menu(tareas, id)
    end
  end

  defp crear_tarea(tareas, id) do
    IO.puts("\n--- Crear Tarea ---")
    desc = Util.ingresar("Descripcion: ", :texto)
    usuario = Util.ingresar("Persona asignada: ", :texto)
    plazo = Util.ingresar("Dias de plazo maximo: ", :entero)

    nueva_tarea = %{
      id: id,
      descripcion: desc,
      responsable: usuario,
      dias_plazo: plazo,
      completada: false
    }

    IO.inspect({:ok, "Tarea registrada"})
    {tareas ++ [nueva_tarea], id + 1}
  end

  defp mostrar_tareas(tareas) do
    IO.puts("\n--- Lista de Tareas ---")

    if tareas == [] do
      IO.puts("No hay tareas registradas.")
    else
      Enum.each(tareas, fn tarea ->
        estado = if tarea.completada, do: "HECHA", else: "PENDIENTE"

        urgencia = cond do
          tarea.dias_plazo <= 1 -> "Urgente (1 dia)"
          tarea.dias_plazo <= 3 -> "Prioritaria (3 dias)"
          tarea.dias_plazo <= 5 -> "Baja prioridad (5 dias)"
          true -> "Para rato (+5 dias)"
        end

        IO.puts("[ID: #{tarea.id}] #{tarea.descripcion} | Asignado a: #{tarea.responsable} | Estado: #{estado} | Plazo: #{urgencia}")
      end)
    end
  end

  defp actualizar_tarea(tareas) do
    id_buscar = Util.ingresar("\nIngrese el id de la tarea para marcarla como completada: ", :entero)

    tareas_actualizadas = Enum.map(tareas, fn tarea ->
      if tarea.id == id_buscar do
        %{tarea | completada: true}
      else
        tarea
      end
    end)

    IO.inspect({:ok, "Tarea actualizada"})
    tareas_actualizadas
  end

  defp eliminar_tarea(tareas) do

    id_eliminar = Util.ingresar("\nIngrese el ID de la tarea a eliminar: ", :entero)
    tareas_actualizadas = Enum.reject(tareas, fn tarea -> tarea.id == id_eliminar end)

    IO.inspect({:ok, "Tarea eliminada"})
    tareas_actualizadas
  end
end

GestorTareas.main()
