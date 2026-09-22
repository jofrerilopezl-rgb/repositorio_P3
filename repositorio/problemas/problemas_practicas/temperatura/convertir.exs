defmodule ConvertidorTemperatura do



  def main(celsius) do
    celsius = "Ingrese la temperatura en grados Celsius: "
    |> String.trim()
    |> String.to_float()
    |> celsius_a_fahrenheit()
    |> imprimir_temperatura()
  end


  def celsius_a_fahrenheit(celsius) do
    celsius * 9 / 5 + 32
  end


  def imprimir_temperatura(fahrenheit) do
    IO.puts("La temperatura en Fahrenheit es: #{fahrenheit}")
  end


end

ConvertidorTemperatura.main()

#Responda: ¿cuál de las dos funciones podría probar automáticamente sin
#necesidad de leer la consola? Relacione su respuesta con la buena práctica
#de delegar responsabilidades a funciones pequeñas vista en esta guía.
