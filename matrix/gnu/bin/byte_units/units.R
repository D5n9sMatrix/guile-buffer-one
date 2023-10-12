#!/usr/bin/r

# Time Intervals / Differences
# Description
# Time intervals creation, printing, and some arithmetic. The print() method calls these “time differences”.

# Usage
# time1 - time2

# difftime(time1, time2, tz,
#          units = c("auto", "secs", "mins", "hours",
#                    "days", "weeks"))

# as.difftime(tim, format = "%X", units = "auto", tz = "UTC")

# ## S3 method for class 'difftime'
# format(x, ...)
# ## S3 method for class 'difftime'
# units(x)
# ## S3 replacement method for class 'difftime'
# units(x) <- value
# ## S3 method for class 'difftime'
# as.double(x, units = "auto", ...)

# ## Group methods, notably for round(), signif(), floor(),
# ## ceiling(), trunc(), abs(); called directly, *not* as Math():
# ## S3 method for class 'difftime'
# Math(x, ...)
# Arguments
# time1, time2	
# date-time or date objects.

# tz	
# an optional time zone specification to be used for the conversion, mainly for "POSIXlt" objects.

# units	
# character string. Units in which the results are desired. Can be abbreviated.

# value	
# character string. Like units, except that abbreviations are not allowed.

# tim	
# character string or numeric value specifying a time interval.

# format	
# character specifying the format of tim: see strptime. The default is a locale-specific time format.

# x	
# an object inheriting from class "difftime".

# ...	
# arguments to be passed to or from other methods.

# Details
# Function difftime calculates a difference of two date/time objects and returns an object of class "difftime" with an attribute indicating the units. The Math group method provides round, signif, floor, ceiling, trunc, abs, and sign methods for objects of this class, and there are methods for the group-generic (see Ops) logical and arithmetic operations.

# If units = "auto", a suitable set of units is chosen, the largest possible (excluding "weeks") in which all the absolute differences are greater than one.

# Subtraction of date-time objects gives an object of this class, by calling difftime with units = "auto". Alternatively, as.difftime() works on character-coded or numeric time intervals; in the latter case, units must be specified, and format has no effect.

# Limited arithmetic is available on "difftime" objects: they can be added or subtracted, and multiplied or divided by a numeric vector. In addition, adding or subtracting a numeric vector by a "difftime" object implicitly converts the numeric vector to a "difftime" object with the same units as the "difftime" object. There are methods for mean and sum (via the Summary group generic), and diff via diff.default building on the "difftime" method for arithmetic, notably -.

# The units of a "difftime" object can be extracted by the units function, which also has a replacement form. If the units are changed, the numerical value is scaled accordingly. The replacement version keeps attributes such as names and dimensions.

# Note that units = "days" means a period of 24 hours, hence takes no account of Daylight Savings Time. Differences in objects of class "Date" are computed as if in the UTC time zone.

# The as.double method returns the numeric value expressed in the specified units. Using units = "auto" means the units of the object.

# The format method simply formats the numeric value and appends the units as a text string.

# Note
# Units such as "months" are not possible as they are not of constant length. To create intervals of months, quarters or years use seq.Date or seq.POSIXt.

# See Also
# DateTimeClasses.

# Examples

(z <- Sys.time() - 3600)
Sys.time() - z                # just over 3600 seconds.

## time interval between release days of R 1.2.2 and 1.2.3.
ISOdate(2001, 4, 26) - ISOdate(2001, 2, 26)

as.difftime(c("0:3:20", "11:23:15"))
as.difftime(c("3:20", "23:15", "2:"), format = "%H:%M") # 3rd gives NA
(z <- as.difftime(c(0,30,60), units = "mins"))
as.numeric(z, units = "secs")
as.numeric(z, units = "hours")
format(z)