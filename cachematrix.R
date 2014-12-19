## This function creates a special matrix  

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL

## By the "set" function a new value is assigned to the object: 
set<-function(y) {
  x<<-y
  m<<-NULL
}

## 3 other functions are also defined, these will be used later by cacheSolve: 

## The "get" function returns the value of the original vector:  
get<-function() {x}
## The "setmatrix" function is called by cacheSolve during the first access; 
## it will store the value: 
setmatrix<-function(solve) {m<<-solve}
## The "getmatrix" function will be used during subsequent accesses: 
getmatrix<-function() {m}

list (set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}

## The function below fetches or calculates the inverse of a matrix

## The input x below is an object created by makeCacheMatrix above:
cacheSolve <- function(x=matrix(), ...) {
## Accesses the object x and gets the value: 
m<-x$getmatrix()

## If the value has already been cached, fetches it: 
if(!is.null(m)) {
  message("getting cashed data")
  return(m)
}
## If the value has not been cached yet, does the calculations: 
matrix<-x$get()
m<-solve(matrix, ...)
x$setmatrix(m)
m
}
