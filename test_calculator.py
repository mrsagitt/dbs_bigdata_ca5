# -*- coding: utf-8 -*-
"""
Created on Sun Dec 03 19:56:37 2017

@author: Dominik
"""

# testing suite inside

import unittest
from calculator import Calculator

class TestCalculator(unittest.TestCase):

    def setUp(self):
        self.calc = Calculator()
  
    def test_calculator_add_method_returns_correct_result(self):
        result = self.calc.add([1,2,3,4,5])
        self.assertEqual(15, result)
    def test_calculator_add_method_returns_correct_result_negatives(self):
        result = self.calc.add([1,-1,2,-2])
        self.assertEqual(0, result)
    def calc_add_raises_error_with_non_integer_args(self):
        self.assertRaises(ValueError, self.calc.add, ['two', 'three', 2,3])
        
    def test_calculator_modulo_returns_correct_value(self):
        result = self.calc.mod([3,6,9], [3,3,3])
        self.assertEqual([0,0,0], result)
    def test_calculator_modulo_returns_correct_recycle_value(self):
        result = self.calc.mod([3,6,9], [3])
        self.assertEqual([0,0,0], result)
    def test_calculator_modulo_method_raise_error(self):
        self.assertRaises(ValueError, self.calc.mod, [1,2,3],['a','b','c'])

    def test_calculator_square_method_int_returns_correct_result(self):
        result = self.calc.square([1,2,3,4,5])            
        self.assertEqual([1,4,9,16,25], result)
    def test_calculator_square_method_negative_returns_correct_result(self):
        result = self.calc.square([-1,-2,-3,-4,-5])
        self.assertEqual([1,4,9,16,25], result)
    def test_calculator_square_method_float_returns_correct_result(self):
        result = self.calc.square([0.5, 0.25])
        self.assertEqual([0.25, 0.0625], result)
    def test_calculator_square_method_raise_error(self):
        self.assertRaises(ValueError, self.calc.square, ['two', 'four'])
        
    def test_calculator_cube_method_int_returns_correct_result(self):
        result = self.calc.cube([1,-2,3])            
        self.assertEqual([1,-8,27], result)
    def test_calculator_cube_method_float_returns_correct_result(self):
        result = self.calc.cube([0.5, -0.25])
        self.assertEqual([0.125, -0.015625], result)
    def test_calculator_cube_method_raise_error(self):
        self.assertRaises(ValueError, self.calc.cube, ['two', 'minus four'])
        
    def test_calculator_power_method_int_returns_correct_result(self):
        result = self.calc.power([1,2,3], [3,2,1])            
        self.assertEqual([1,4,3], result)
    def test_calculator_power_method_float_returns_correct_result(self):
        result = self.calc.power([0.5, -0.25], [2, 3])
        self.assertEqual([0.25, -0.015625], result)
    def test_calculator_power_method_raise_error(self):
        self.assertRaises(ValueError, self.calc.power, ['one', 'two'],['three', 'four'])
        
    def test_calculator_subtract_method_returns_correct_result(self):
        result = self.calc.subtract([-1,-2,-3,-4,-5])
        self.assertEqual(13, result)    
    def calc_subtract_raises_error_with_non_integer_args(self):
        self.assertRaises(ValueError, self.calc.add, ['one',2,3])
        
    def test_calculator_temerature_conv_returns_correct_result_fahr(self):
        result = self.calc.temperature([0,100],'f')
        self.assertEqual([32.0,212.0], result)
    def test_calculator_temerature_conv_returns_correct_result_cels(self):
        result = self.calc.temperature([32,212],'c')
        self.assertEqual([0.0,100.0], result)
    def test_calculator_temerature_conv_raises_error(self):
        self.assertRaises(ValueError, self.calc.temperature, [100,200],'k')
        
    def test_calculator_currency_conv_raises_error_currency(self):
        self.assertRaises(ValueError, self.calc.currency, 1, 'abc')
    def test_calculator_currency_conv_raises_error_amount(self):
        self.assertRaises(ValueError, self.calc.currency, 'two', 'usd')
        
    def test_calculator_sine_returns_correct_result(self):
        result = self.calc.sine([0,90])
        self.assertEqual([0.0,1.0], result)
    def test_calculator_sine_raises_error(self):
        self.assertRaises(ValueError, self.calc.sine, 'a')

    def test_calculator_factor_returns_correct_value(self):
        result = self.calc.factor([0,1,2,3])
        self.assertEqual([1, 1, 2, 6],result)
    def test_calculator_factor_raise_error_negative_int(self):
        self.assertRaises(ValueError, self.calc.factor, [-1])
    
    
if __name__ == '__main__':
    unittest.main()