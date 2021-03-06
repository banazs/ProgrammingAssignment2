#####################
## makeCacheMatrix ##
#####################
makeCacheMatrix <- function(x = matrix()) {
  
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) i <<- solve
  getsolve <- function() i
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
  
}

################
## cacheSolve ##
################
 cacheSolve <- function(x, ...) {
  
  i <- x$getsolve()
  if(!is.null(i)) {
    message("Getting cached data...")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setsolve(i)
  i

}