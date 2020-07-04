# Calling makeCacheMatrix on a matrix gives a special cache matrix whose matrix
# and inverse matrix can be set or looked up.
# Calling cacheSolve on a cache matrix returns its cached inverse matrix if
# available, otherwise returns a newly calculated inverse matrix.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInv <- function(inverse) inv <<- inverse
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
