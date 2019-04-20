package com.example.ci;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.example.ci.BasicArithmeticHelper;

/**
 * Unit test for Add method
 */
public class ArithmeticModulusTest
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void basicModulusTestTrue()
    {
        int res = BasicArithmeticHelper.modulus(3, 2);
        assertTrue(res == 1);
    }
}
