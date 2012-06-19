# vim: ft=r
# options
if (interactive()) {
    local({
        options(editor = 'vim',
                repos = 'http://debian.mc.vanderbilt.edu/R/CRAN/',
                tab.width = 3)
    })
}
# constants
tau <- 2*pi
# operators
'%nin%' <- function(x, y) { !(x %in% y) }
'%xin%' <- function(x, y) { x[which(x %in% y)] }
'%xnin%' <- function(x, y) { x[which(x %nin% y)] }
# functions
na.rm <- function(x) { x[!is.na(x)] }
notna <- function(x) { x & !is.na(x) }
gt <- function(x, a=1) { x[x > a] }
ngt <- function(x, ...) { names(gt(table(x), ...)) }
