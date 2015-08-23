## makeCacheMatrix creates a matrix that can be cached and a list of functions to change, store and get its value or the value of inverse matrix
## cacheSolve returns the inverse matrix value if it has already been computed or computes a value of the inverse matrix, stores it and retuns it 

## makeCacheMatrix is a function that creates a matrix and stores a list of 4 functions: set, get, setinvm, getinvm.
## set - changes matrix in the main function
## get - returns matrix stored in main function
## setinvm - sets and stores the value of invm variable
## getinvm - returns the value of invm variable stored

makeCacheMatrix <- function(x = matrix(nrow=2,ncol=2)) {
  invm<-NULL
  set<-function(y){
    x<<-y
    invm<<-NULL}
  get<-function()x
  setinvm<-function(solve)invm<<-solve
  getinvm<-function()invm
  list(set=set,get=get,setinvm=setinvm,getinvm=getinvm)
}


## cacheSolve is a function that computes the inverse of a matrix created in makeCacheMatrix and returns it value
## First it checks if invm has any value assigned to it
## If matrix has not changed and inverse of a matrix has been computed in returns the stored value
## If matrix has changed and value has not been computed before, it computes the value of inverse matrix, stores it and returns it
cacheSolve <- function(x, ...) {
invm <- x$getinvm()
if(!is.null(invm)) {
  message("getting cached data")
  return(invm)
}
data <- x$get()
invm <- solve(data, ...)
x$setinvm(invm)
invm
  }
