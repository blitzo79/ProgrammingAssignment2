## 2 functions to cache the inverse of a matrix
## makeCacheMatrix & cacheSolve

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

	## initialize inverse variable
	
	im <- NULL


	## method: sets the matrix	

	set <- function( matrix ) {
		m <<- matrix
		im <<- NULL
	}


	## method: gets the matrix

	get <- function() {
		m
	}


	## method: sets the inverse

	setInverse <- function(inverse) {
		im <<- inverse
	}


	## method: get the inverse of the matrix

	getInverse <- function() {
		im
	}

}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should 
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {


	m <- x$getInverse()


	if( !is.null(m) ) {
		message("getting cached data")
		return(m)
	}	


	matrix <- x$get()


	m <- solve(matrix)


	x$setInverse(m)
	
	
	


	## Return a matrix that is the inverse of 'x'
        
}
