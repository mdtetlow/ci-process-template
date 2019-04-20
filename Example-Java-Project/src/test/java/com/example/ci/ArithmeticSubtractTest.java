package com.example.ci;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.example.ci.BasicArithmeticHelper;

/**
 * Unit test for Add method
 */
public class ArithmeticSubtractTest
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void basicSubtractTestTrue()
    {
        int res = BasicArithmeticHelper.subtract(2, 1);
        assertTrue(res == 1);
    }
}
