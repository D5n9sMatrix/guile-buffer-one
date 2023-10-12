#!/usr/bin/r

# Set Options with Consistency Checks
# Description
# Utility function for setting options with some consistency checks. The attributes of the new settings in new are checked for consistency with the model (often default) list in name.opt.

# Usage
# check.options(new, name.opt, reset = FALSE, assign.opt = FALSE,
#               envir = .GlobalEnv,
#               check.attributes = c("mode", "length"),
#               override.check = FALSE)
# Arguments
# new	
# a named list

# name.opt	
# character with the name of R object containing the default list.

# reset	
# logical; if TRUE, reset the options from name.opt. If there is more than one R object with name name.opt, remove the first one in the search() path.

# assign.opt	
# logical; if TRUE, assign the ...

# envir	
# the environment used for get and assign.

# check.attributes	
# character containing the attributes which check.options should check.

# override.check	
# logical vector of length length(new) (or 1 which entails recycling). For those new[i] where override.check[i] == TRUE, the checks are overridden and the changes made anyway.

# Value
# A list of components with the same names as the one called name.opt. The values of the components are changed from the new list, as long as these pass the checks (when these are not overridden according to override.check).

# Note
# Option "names" is exempt from all the checks or warnings, as in the application it can be NULL or a variable-length character vector.

# Author(s)
# Martin Maechler

# See Also
# ps.options and pdf.options, which use check.options.

# Examples

(L1 <- list(a = 1:3, b = pi, ch = "CH"))
check.options(list(a = 0:2), name.opt = "L1")
check.options(NULL, reset = TRUE, name.opt = "L1")