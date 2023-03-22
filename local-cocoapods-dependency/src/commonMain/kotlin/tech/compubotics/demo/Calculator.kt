package tech.compubotics.demo

interface CalculatorOperations {
    fun add(a: Int, b: Int): Int
    fun multiply(a: Int, b: Int): Int
}

expect class Calculator : CalculatorOperations
