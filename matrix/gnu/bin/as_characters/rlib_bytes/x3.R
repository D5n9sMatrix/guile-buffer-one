#!/usr/bin/r

# Apply a Function to a Data Frame Split by Factors
# Description
# Function by is an object-oriented wrapper for tapply applied to data frames.

# Usage
# by(data, INDICES, FUN, ..., simplify = TRUE)
# Arguments
# data	
# an R object, normally a data frame, possibly a matrix.

# INDICES	
# a factor or a list of factors, each of length nrow(data).

# FUN	
# a function to be applied to (usually data-frame) subsets of data.

# ...	
# further arguments to FUN.

# simplify	
# logical: see tapply.

# Details
# A data frame is split by row into data frames subsetted by the values of one or more factors, and function FUN is applied to each subset in turn.

# For the default method, an object with dimensions (e.g., a matrix) is coerced to a data frame and the data frame method applied. Other objects are also coerced to a data frame, but FUN is applied separately to (subsets of) each column of the data frame.

# Value
# An object of class "by", giving the results for each subset. This is always a list if simplify is false, otherwise a list or array (see tapply).

# See Also
# tapply, simplify2array. ave also applies a function block-wise.

# Examples

require(stats)
by(warpbreaks[, 1:2], warpbreaks[,"tension"], summary)
by(warpbreaks[, 1],   warpbreaks[, -1],       summary)
by(warpbreaks, warpbreaks[,"tension"],
   function(x) lm(breaks ~ wool, data = x))

## now suppose we want to extract the coefficients by group
tmp <- with(warpbreaks,
            by(warpbreaks, tension,
               function(x) lm(breaks ~ wool, data = x)))
sapply(tmp, coef)