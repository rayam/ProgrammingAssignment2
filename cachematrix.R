## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a list containing a function which
## 1. sets the value of the matrix
## 2. gets the value of the matrix
## 3. sets the value of the inverse
## 4. gets the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL 
  }
  get <- function() x
  setinv <- function(m) m <<- m
  getinv <- function () m
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## cacheSolve calculates the inverse of the matrix, 
## taking the inverse from the cache if it's already
## been calculated

cacheSolve <- function(x) {
 m <- x$getinv()
 if(!is.null(m)) {
   message('getting cached data')
   return(m)
 }
 data <- x$get()
 m <- solve(data)
 x$setinv(m)
 m
}