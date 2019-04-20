package com.example.ci;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.example.ci.BasicArithmeticHelper;

/**
 * Unit tests for Class BasicArithmeticHelper
 */
public class BasicArithmeticHelperTest
{
    @Test
    public void basicAddTestTrue()
    {
        int res = BasicArithmeticHelper.add(1, 2);
        assertTrue(res == 3);
    }

    @Test
    public void basicDivideTestTrue()
    {
        int res = BasicArithmeticHelper.divide(2, 2);
        assertTrue(res == 1);
    }

    @Test
    public void basicModulusTestTrue()
    {
        int res = BasicArithmeticHelper.modulus(3, 2);
        assertTrue(res == 1);
    }

    @Test
    public void basicMultiplyTestTrue()
    {
        int res = BasicArithmeticHelper.multiply(2, 2);
        assertTrue(res == 4);
    }

    @Test
    public void basicSubtractTestTrue()
    {
        int res = BasicArithmeticHelper.subtract(2, 1);
        assertTrue(res == 1);
    }
}
