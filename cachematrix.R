## the first function defines and returns four functions for working with
## an input value and cached value computed from the input
## the second function computes

## this function stores the input matrix and defines
##four functions for that will eventually compute and
##cache the inverse of the input matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv) m <<- inv
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## this functions uses the list from the previous function
## as input.  the inverse of the input matrix from the previous function
## is computed and cached.  Subsequent calls for the inverse are taken from
## the cache as long as the input matrix has not changed.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
	  data = x$get()
        i <- solve(data)
        x$setinv(i)
        i
}
