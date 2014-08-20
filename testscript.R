# Testscript: for makeCacheMatrix and cacheSolve
# as proposed on https://class.coursera.org/rprog-006/forum/thread?thread_id=204
#
t<-matrix(c(1,2,3,4), ncol=2)
s<-makeCacheMatrix(t)
s$get()
s$getinverse()
cacheSolve(s)
s$getinverse()
cacheSolve(s)
s$set(matrix(c(10,20,30,40),ncol=2)) # 'set' also clears m (m<<-NULL)
s$getinverse() # therefore result is NULL
cacheSolve(s) # setting it again
cacheSolve(s) # found in the cache
s$get() # new values
s$setinverse(0) # the, wrong way to do it...
s$getinverse()
s$get()
cacheSolve(s) # calling setinverse corrupted the code... we should include a checkpoint
t<-matrix(c(5,10,5,20),ncol=2)
s<-makeCacheMatrix(t) # again set up correctly
s$get()
cacheSolve(s)
cacheSolve(s)
# now let's check how code is working for non-invertible matrix
t<-matrix(c(1,2,3,4,5,6), ncol=3)
s<-makeCacheMatrix(t)
s$get()
s$getinverse()
cacheSolve(s)
s$getinverse()
cacheSolve(s)
