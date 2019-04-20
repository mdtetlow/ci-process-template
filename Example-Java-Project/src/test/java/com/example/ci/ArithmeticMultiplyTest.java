package com.example.ci;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.example.ci.BasicArithmeticHelper;

/**
 * Unit test for Add method
 */
public class ArithmeticMultiplyTest
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void basicMultiplyTestTrue()
    {
        int res = BasicArithmeticHelper.multiply(2, 2);
        assertTrue(res == 4);
    }
}
