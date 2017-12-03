# -*- coding: utf-8 -*-
"""
Dominik Hemzaczek, 10360024@mydbs.ie
CA5, calculator on map reduce filter lambda
3/12/2017, revision 1
"""
import json, urllib, math

class Calculator(object):
    
    def add(self, x):
        number_types = (int, long, float, complex)
        if all(isinstance(item , number_types) for item in x):
            return reduce(lambda a,b: a+b, x)
        else:
            raise ValueError
            
    def subtract(self, x):
        number_types = (int, long, float, complex)
        if all(isinstance(item , number_types) for item in x):
            return reduce(lambda a,b: a-b, x)
        else:
            raise ValueError            
            
    def mod(self, x, y):
        # return modulus for given parameters
        number_types = (int, long, float, complex)
        
        if all(isinstance(item, number_types) for item in x) \
        and all(isinstance(item, number_types) for item in y):
            if len(y) == 1:
                y=y*len(x)
            return map(lambda a,b: a%b, x,y)
        else:
            raise ValueError
            
    def square(self, x):
        number_types = (int, long, float, complex)
        if all(isinstance(item, number_types) for item in x):
            return map(lambda a: a*a, x)
        else:
            raise ValueError
            
    def cube(self, x):
        number_types = (int, long, float, complex)
        if all(isinstance(item, number_types) for item in x):
            return map(lambda a: a**3, x)
        else:
            raise ValueError
    
    def power(self, x, y):
        number_types = (int, long, float, complex)
        if all(isinstance(item, number_types) for item in x) \
        and all(isinstance(item, number_types) for item in y):            
            return map(lambda a,b: a**b, x,y)
        else:
            raise ValueError
            
    def temperature(self, x, m):
        # convert temp between fahrenheit and celsius depending on user's choice
        number_types = (int, float)
        l = ['f','c']
        
        if all(isinstance(item, number_types) for item in x) \
        and m in l:
            if m == 'f':
                return map(lambda a: a * 9.0 / 5.0 + 32, x)
            elif m == 'c':
                return map(lambda a: (a -32) * 5.0 / 9.0, x)                        
            else:
                raise ValueError
        else:
            raise ValueError
            
            
    def currency(self, x, cur):
        #live converion from euro to other currencies
        number_types = (int, float)
        # list of available conversions
        currency = ['USD','IDR','BGN','ILS','GBP','DKK','CAD','JPY','HUF','RON',
                    'MYR','SEK','SGD','HKD','AUD','CHF','KRW','CNY','TRY','HRK',
                    'NZD','THB','NOK','RUB','INR','MXN','CZK','BRL','PLN','PHP','ZAR']
        
        # convert to uppercase
        cur = map(lambda a: a.upper(), cur)
        
        # is x correct datatype?
        # are all elements of cur in currency list?
        if isinstance(x, number_types) \
        and sum(map(lambda a: a in currency, cur)) == len(cur):
            url = 'http://api.fixer.io/latest'
            response = urllib.urlopen(url)
            data = json.loads(response.read())
            rates = data['rates']
            return map(lambda a: rates[a] * x, cur)
            
        # raise 'unrecognised currency' or non-numerical amount error
        else:
            raise ValueError
            
    def sine(self, x):
        # returns sine for given degrees (converted to radians)
        number_types = (int, float)
        
        if all(isinstance(item, number_types) for item in x):
            if x >= 0:
                #rad = x * math.pi / 180
                rad = map(lambda a: a * math.pi / 180, x)
                return map(lambda a: math.sin(a), rad)
        else:
            raise ValueError
            
    def factor(self, x):
        number_types = (int)        
        if all(isinstance(item, number_types) for item in x) \
        and not filter(lambda a: a < 0, x):
           return map(lambda a: math.factorial(a), x)
        else:
            raise ValueError
            
