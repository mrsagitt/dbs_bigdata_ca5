# set below to folder with calculator.R file
source("c:/DBS/BIgData/ca5/calculator.R")

# not really a test, just some calls to check if calculator returns any values
# Dominik Hemzaczek, 10360024@mydbs.ie
# 3/12/2017
# revision 1

# add
calc.add(-1,1)
calc.add(3,)
calc.add(,8)
calc.add()

# subtract
calc.subtract(6,3)
calc.subtract(6,)
calc.subtract(,6)
calc.subtract()

# square
calc.square(2)
calc.square(0)
calc.square(-2)
calc.square()

# cube
calc.cube(2)
calc.cube(0)
calc.cube(-2)
calc.cube()

#power
calc.power(2,3)
calc.power(2,0)
calc.power(2,)
calc.power()

# mod
calc.mod(9,3)
calc.mod(9,2)
calc.mod(0,0)
calc.mod('a','b')

# factorial
calc.factorial(5)
calc.factorial(-1)
calc.factorial(0)

# temperature
calc.temp(0,'f')
calc.temp(100,'f')
calc.temp(32,'c')
calc.temp(212,'c')

# currency
calc.currency(10, 'usd')
calc.currency(10, 'xxx')

# sine
calc.sine(0)
calc.sine(90)