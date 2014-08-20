## This file defines two functions, to calculate and cache the inverse of a matrix,
## 'makeChacheMatrix" and 'cacheSolve'

## The function 'makeCacheMatrix' creates a list, containing functions to
##      1.  set the value of the matrix ($set)
##      2.  get and display the value of the matrix ($get)
##      3.  set the value of the invert of the matrix ($setinverse)
##      4.  get the value of the invert of the matrix ($getinverse)

makeCacheMatrix <- function(x = matrix()) {
    m<-NULL # calling the function will clear previous values and initialize the object
    set<-function(y){
        x<<-y # tries to find the object in the search path
        m<<-NULL
    }
    get<-function() x
    setinverse<-function(solve) m<<-solve # used by cacheSolve, assigning the inverse 
    getinverse<-function() m
    list(set=set, get=get,setinverse=setinverse,getinverse=getinverse)
}


## The function 'cacheSolve' calculates the inverse of a square
## matrix by calling the function 'solve', and caching the result in 

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m<-x$getinverse()
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    data<-x$get()
    if(ncol(data)!=nrow(data)){ # only square matrices can be inverted
        message("matrix must be square")
        m<-NULL
        return()
    }
    m<-solve(data)
    x$setinverse(m)
    m
}
