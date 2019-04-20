package com.example.ci;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.example.ci.BasicArithmeticHelper;

/**
 * Unit test for Add method
 */
public class ArithmeticAddTest
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void basicAddTestTrue()
    {
        int res = BasicArithmeticHelper.add(1, 2);
        assertTrue(res == 3);
    }
}
