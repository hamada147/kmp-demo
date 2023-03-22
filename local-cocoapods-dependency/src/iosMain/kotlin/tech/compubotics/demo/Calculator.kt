package tech.compubotics.demo
import cocoapods.demo.Demo

actual class Calculator : CalculatorOperations {
    override fun add(a: Int, b: Int): Int {
        return Demo.addWithA(a.toLong(), b.toLong()).toInt()
    }

    override fun multiply(a: Int, b: Int): Int {
        return Demo.multiplyWithA(a.toLong(), b.toLong()).toInt()
    }
}
