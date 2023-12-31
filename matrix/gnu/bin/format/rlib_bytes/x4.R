#!/usr/bin/r

# Encode in a Common Format
# Description
# Format an R object for pretty printing.

# Usage
# format(x, ...)

# ## Default S3 method:
# format(x, trim = FALSE, digits = NULL, nsmall = 0L,
#        justify = c("left", "right", "centre", "none"),
#        width = NULL, na.encode = TRUE, scientific = NA,
#        big.mark   = "",   big.interval = 3L,
#        small.mark = "", small.interval = 5L,
#        decimal.mark = getOption("OutDec"),
#        zero.print = NULL, drop0trailing = FALSE, ...)

# ## S3 method for class 'data.frame'
# format(x, ..., justify = "none")

# ## S3 method for class 'factor'
# format(x, ...)

# ## S3 method for class 'AsIs'
# format(x, width = 12, ...)
# Arguments
# x	
# any R object (conceptually); typically numeric.

# trim	
# logical; if FALSE, logical, numeric and complex values are right-justified to a common width: if TRUE the leading blanks for justification are suppressed.

# digits	
# how many significant digits are to be used for numeric and complex x. The default, NULL, uses getOption("digits"). This is a suggestion: enough decimal places will be used so that the smallest (in magnitude) number has this many significant digits, and also to satisfy nsmall. (For the interpretation for complex numbers see signif.)

# nsmall	
# the minimum number of digits to the right of the decimal point in formatting real/complex numbers in non-scientific formats. Allowed values are 0 <= nsmall <= 20.

# justify	
# should a character vector be left-justified (the default), right-justified, centred or left alone. Can be abbreviated.

# width	
# default method: the minimum field width or NULL or 0 for no restriction.

# AsIs method: the maximum field width for non-character objects. NULL corresponds to the default 12.

# na.encode	
# logical: should NA strings be encoded? Note this only applies to elements of character vectors, not to numerical, complex nor logical NAs, which are always encoded as "NA".

# scientific	
# Either a logical specifying whether elements of a real or complex vector should be encoded in scientific format, or an integer penalty (see options("scipen")). Missing values correspond to the current default penalty.

# ...	
# further arguments passed to or from other methods.

# big.mark, big.interval, small.mark, small.interval, decimal.mark, zero.print, drop0trailing	
# used for prettying (longish) numerical and complex sequences. Passed to prettyNum: that help page explains the details.

# Details
# format is a generic function. Apart from the methods described here there are methods for dates (see format.Date), date-times (see format.POSIXct) and for other classes such as format.octmode and format.dist.

# format.data.frame formats the data frame column by column, applying the appropriate method of format for each column. Methods for columns are often similar to as.character but offer more control. Matrix and data-frame columns will be converted to separate columns in the result, and character columns (normally all) will be given class "AsIs".

# format.factor converts the factor to a character vector and then calls the default method (and so justify applies).

# format.AsIs deals with columns of complicated objects that have been extracted from a data frame. Character objects and (atomic) matrices are passed to the default method (and so width does not apply). Otherwise it calls toString to convert the object to character (if a vector or list, element by element) and then right-justifies the result.

# Justification for character vectors (and objects converted to character vectors by their methods) is done on display width (see nchar), taking double-width characters and the rendering of special characters (as escape sequences, including escaping backslash but not double quote: see print.default) into account. Thus the width is as displayed by print(quote = FALSE) and not as displayed by cat. Character strings are padded with blanks to the display width of the widest. (If na.encode = FALSE missing character strings are not included in the width computations and are not encoded.)

# Numeric vectors are encoded with the minimum number of decimal places needed to display all the elements to at least the digits significant digits. However, if all the elements then have trailing zeroes, the number of decimal places is reduced until nsmall is reached or at least one element has a non-zero final digit; see also the argument documentation for big.*, small.* etc, above. See the note in print.default about digits >= 16.

# Raw vectors are converted to their 2-digit hexadecimal representation by as.character.

# format.default(x) now provides a “minimal” string when isS4(x) is true.

# The internal code respects the option getOption("OutDec") for the ‘decimal mark’, so if this is set to something other than "." then it takes precedence over argument decimal.mark.

# Value
# An object of similar structure to x containing character representations of the elements of the first argument x in a common format, and in the current locale's encoding.

# For character, numeric, complex or factor x, dims and dimnames are preserved on matrices/arrays and names on vectors: no other attributes are copied.

# If x is a list, the result is a character vector obtained by applying format.default(x, ...) to each element of the list (after unlisting elements which are themselves lists), and then collapsing the result for each element with paste(collapse = ", "). The defaults in this case are trim = TRUE, justify = "none" since one does not usually want alignment in the collapsed strings.

# References
# Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.

# See Also
# format.info indicates how an atomic vector would be formatted.

# formatC, paste, as.character, sprintf, print, prettyNum, toString, encodeString.

# Examples

format(1:10)
format(1:10, trim = TRUE)

zz <- data.frame("(row names)"= c("aaaaa", "b"), check.names = FALSE)
format(zz)
format(zz, justify = "left")

## use of nsmall
format(13.7)
format(13.7, nsmall = 3)
format(c(6.0, 13.1), digits = 2)
format(c(6.0, 13.1), digits = 2, nsmall = 1)

## use of scientific
format(2^31-1)
format(2^31-1, scientific = TRUE)

## a list
z <- list(a = letters[1:3], b = (-pi+0i)^((-2:2)/2), c = c(1,10,100,1000),
          d = c("a", "longer", "character", "string"),
          q = quote( a + b ), e = expression(1+x))
## can you find the "2" small differences?
(f1 <- format(z, digits = 2))
(f2 <- format(z, digits = 2, justify = "left", trim = FALSE))
f1 == f2 ## 2 FALSE, 4 TRUE

## A "minimal" format() for S4 objects without their own format() method:
cc <- methods::getClassDef("standardGeneric")
format(cc) ## "<S4 class ......>"