# Calling makeCacheMatrix on a matrix gives a special cache matrix whose matrix
# and inverse matrix can be set or looked up.
# Calling cacheSolve on a cache matrix returns its cached inverse matrix if
# available, otherwise returns a newly calculated inverse matrix.

# makeCacheMatrix takes a matrix and returns a list of functions that can be
# used to interact with the matrix and its inverse, essentially making it a
# cache matrix that can store its computed inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInv <- function(inverse) inv <<- inverse
    getInv <- function() inv
    
    return(list(
        set = set,
        get = get,
        setInv = setInv,
        getInv = getInv
    ))
}


# cacheSolve takes a cache matrix and returns the already computed inverse
# stored in it, if available. Otherwise it computes the inverse of the matrix,
# stores it in the cache matrix, and finally returns the inverse.

cacheSolve <- function(x, ...) {
    inv <- x$getInv()
    if (!is.null(inv)) {
        message("getting cached inverse")
        return(inv)
    }
    inv <- solve(x$get(), ...)
    x$setInv(inv)
    
    return(inv)
}
