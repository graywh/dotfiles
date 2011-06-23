# vim: ft=r
if (interactive()) {
    local({
        options(editor = 'vim',
                repos = 'http://debian.mc.vanderbilt.edu/R/CRAN/',
                tab.width = 4)
    })
}
tau <- 2*pi
'%nin%' <- function(x, y) { !(x %in% y) }
'%xin%' <- function(x, y) { x[which(x %in% y)] }
na.rm <- function(x) { x[!is.na(x)] }
