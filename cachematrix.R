## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	
  m <-NULL                    ## set local varialbe to initiate m as null

  set <-function(y =matrix()){
    x <<-y
    m <<-NULL
  }                           ##set new value and initiate m as null in parent environment
  
  get <- function() x        ## get the matrix 
  setcacheinverse <-function(inverse)  m <<-inverse			##store the inverse of the matrix in parent 
  															##environment
  getinverse <-function()  m								##get the inverse of the matrix
  
  list(set=set, get=get, setcacheinverse=setcacheinverse, getinverse=getinverse)
  															##return the results as list which includes 
  															##four functions set/get/set_inverse/		       
															##get_inverse 
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
	    m <-x$getinverse()                                   ## if the inverse of the matrix is calculated 
	    													 ## previously, returned the value stored in 
	    													 ## the parent environment without calculating 
	    													 ## again
    if(!is.null(m)) {
               message ("getting cached data")
               return(m)
           }
     data <-x$get()											## if the inverse of the matrix is new, 
     														## calculate and input the inverse, store
     														## the inverse in parent environment
     m <-solve(data)
     x$setcacheinverse(m)
     m	   
	
	
}
