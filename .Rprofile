# vim: ft=r
# options
if (interactive()) {
    local({
        options(editor = 'vim',
                stringsAsFactors = FALSE,
                tab.width = 3)
    })
}
# constants
tau <- 2*pi
# operators
'%nin%' <- function(x, y) { !(x %in% y) }
# functions
na.rm <- function(x) { x[!is.na(x)] }
notna <- function(x) { x & !is.na(x) }
gt <- function(x, a=1) { x[x > a] }
ngt <- function(x, ...) { names(gt(table(x), ...)) }
