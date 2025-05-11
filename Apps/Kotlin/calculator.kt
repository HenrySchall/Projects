fun main() {
    println("Calculadora Simples em Kotlin")

    print("Digite o primeiro número: ")
    val num1 = readLine()?.toDoubleOrNull() ?: return println("Entrada inválida!")

    print("Digite o operador (+, -, *, /): ")
    val operador = readLine()

    print("Digite o segundo número: ")
    val num2 = readLine()?.toDoubleOrNull() ?: return println("Entrada inválida!")

    val resultado = when (operador) {
        "+" -> num1 + num2
        "-" -> num1 - num2
        "*" -> num1 * num2
        "/" -> {
            if (num2 == 0.0) {
                println("Erro: divisão por zero!")
                return
            } else {
                num1 / num2
            }
        }
        else -> {
            println("Operador inválido!")
            return
        }
    }

    println("Resultado: $resultado")
}