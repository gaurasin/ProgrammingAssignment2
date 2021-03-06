## Below are two functions that are used to create a special object that stores a Matrix and cache's its Inverse.
## functions do

## The first function, makeVector creates a special "Matrix", which is really a list containing a function to

##set the value of the Matrix
##get the value of the Matrix
##set the value of the Inverse
##get the value of the Inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## The following function calculates the Inverse of the special "Matrix" 
##created with the above function. However, it first checks to see if the 
##inverse has already been calculated. If so, it gets the inverse from 
##the cache and skips the computation. Otherwise, it calculates the inverse of the 
##data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
