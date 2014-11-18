## Amend a set of funcitons to demonstrate lexical scoping in
## the R language through inverse matrix generation and manipulation

## Matrix func def and accompanying function definitions

makeCacheMatrix <- function(x = matrix()) {  # retrieve matrix parameters
      m <- NULL                              # create storage object
      set <- function(y){                    # initialize set function and value
          x <<- y                            # superassign y value to x
          m <<- NULL                         # update m variable in containing environment 
      }
      get <- function() x                    # define get function to retrieve matrix
      setmean <- function(mean) m <<- mean   # define setmean func/get mean & assign m variable
      getinverse <- function()  m            # define func to retrieve inverse matrix
      list(set = set, get = get, setmean = setmean, getinverse = getinverse) ## set func params
}


## Func to retrieve matrix and create or determine inverse

cacheSolve <- function(x, ...) {             # retrieve matrix
        m <- x$getinverse()                  # retrieve matrix data
        if(!is.null(m)){                     # check if inverse matrix has been calculated
            message("getting chached data")  
            return(m)                        # return cached data
        }
        data <- x$get()                      # retrieve matrix
        m <- solve(data, ...)                # calculate inverse
        x$setmean(m)                         # retrieves mean calculated matrix and assigns to m
        m                                    # returns inverse matrix
}
