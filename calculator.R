# CA5 
# Dominik Hemzaczek, 10360024@mydbs.ie
# Programming for Big Data
# 3/12/2017
# revision 1


# Take your calculator program from CA1 and implement it as a set of 10 functions in R.
# Submit an R script of your program to moodle and github.
# Also submit some calls to prove your 10 functions work.

if(!require("httr")) install.packages("httr") # http
if(!require("jsonlite")) install.packages("jsonlite") # JSON
library(httr)
library(jsonlite)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 1. ADD
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.add <- function(x=0,y=0){
# add two numerical values, return nothing if not numerical
# take defaults zero to support only one argument passed
    if (is.numeric(x) & is.numeric(y)) {
        return(x+y)
    }
        return(NA)
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 2. SUBTRTACT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.subtract <- function(x=0,y=0){
    # subtract two numerical values, return nothing if not numerical
    # take defaults zero to support only one argument passed
    if (is.numeric(x) & is.numeric(y)) {
        return(x-y)
    }
        return(NA)
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 3. SQUARE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.square <- function(x=NA){
    if (is.numeric(x)){
        return(x^2)
    }
        return (NA)
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 4. CUBE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.cube <- function(x=NA){
    if (is.numeric(x)) {
        return (x^3)
    }
        return (NA)
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 5. POWER
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.power <- function(x=0,y=0){
    if (is.numeric(x) & is.numeric(y)) {
        return (x**y)
    }
        return(NA)
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 6. MOD
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.mod <- function(x,y){
# return reminder of integer division
# no defaults
    if (is.numeric(x) & is.numeric(y)) {
        return(x%%y)
    }
        return(NA)
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 7. FACTORIAL    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.factorial <- function(x) {
# returns factorial in recursively
    t1 <- is.numeric(x)
    t2 <- x >= 0
    
    if (t1 == T & t2 == T) {
        if (x > 1) {
            return (x * calc.factorial(x-1))
        } else {
            return(1)
        }
        }
            return (NA)
    }
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 8. TEMPERATURE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.temp <- function(degrees = 32, fahr_cels = 'c') {
# convert temp between fahrenheit and celsius depending on user's choice
    x <- degrees
    m <- fahr_cels
    t1 <- is.numeric(x) # check if x is numeric
    m <- tolower(m)     # conver to lowercase
    l <- c('f','c')     # list of accepted values
    t2 <- sum(m == l)   # test if at least one element matches
         
    if (t1 == T & t2 == T) {
        if (m == 'f') {
            return (x*9/5+32)
        } else if (m == 'c') {
            return ((x-32)*5/9)
        }
    }
        return(NA)
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 9. CURRENCY
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.currency <- function(amount=1, currency='EUR') {
# live conversion from euro to other currencies
    n <- c("AUD","BGN","BRL","CAD","CHF","CNY","CZK","DKK","GBP","HKD",
           "HRK","HUF","IDR","ILS","INR","JPY","KRW","MXN","MYR","NOK",
           "NZD","PHP","PLN","RON","RUB","SEK","SGD","THB","TRY","USD",
           "ZAR")
    x <- amount
    cur <- toupper(currency)
    t1 <- cur %in% n
    t2 <- is.numeric(x)
    
    if ((t1 == T) & (t2 == T)) {
        
    url <- 'http://api.fixer.io/latest'
    response <- GET(url=url)
    char_data <- rawToChar(response$content)
    json_data <- fromJSON(char_data)
    rates <- json_data$rates
        ex <- rates[cur]
    return (x * ex[[1]])
    }
    return (NA)
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# 10. SINE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
calc.sine <- function(x=0){
# returns sine for given degrees (converted to radians)
    t1 <- is.numeric(x) 
    if (t1==T){
        rad = x*pi/180
        return (sin(rad))}
    else {
        return (NA)
    }
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#