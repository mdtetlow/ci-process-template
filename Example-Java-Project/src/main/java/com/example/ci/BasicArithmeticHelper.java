/**
 *  * Info about this package doing something for package-info.java file.
 *   */
package com.example.ci;

/**
 * Basic Arithmetic Helper.
 * NOTE: This is for demo puroses only - it is not a valid Helper class
 *       as it provides functionality this is available in the JDK
 *       However it demonstrates a basic Java project structure
 *
 */
public final class BasicArithmeticHelper {

    /**
    * Private default constructor.
    */
    private BasicArithmeticHelper() { }

    /**
    * Adds two integers together.
    * @param a First operand
    * @param b Second operand
    * @return a add b
    */
    public static int add(final int a, final int b) {
        return a + b;
    }

    /**
    * Subtracts an integer from another integer.
    * @param a First operand
    * @param b Second operand
    * @return a subtract b
    */
    public static int subtract(final int a, final int b) {
        return a - b;
    }

    /**
    * Multiplies two integers together.
    * @param a First operand
    * @param b Second operand
    * @return a multiplied by b
    */
    public static int multiply(final int a, final int b) {
        return a * b;
    }

    /**
    * Divides one integer by another integer.
    * @param a First operand
    * @param b Second operand
    * @return a divided by b
    */
    public static int divide(final int a, final int b) {
        return a / b;
    }

    /**
    * Produces modulus of two integers.
    * @param a First operand
    * @param b Second operand
    * @return modulus of a and b
    */
    public static int modulus(final int a, final int b) {
        return a % b;
    }
}
