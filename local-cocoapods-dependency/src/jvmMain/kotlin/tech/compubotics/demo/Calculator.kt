package tech.compubotics.demo

actual class Calculator : CalculatorOperations {
    override fun add(a: Int, b: Int): Int {
        return a + b
    }

    override fun multiply(a: Int, b: Int): Int {
        return a * b
    }
}
