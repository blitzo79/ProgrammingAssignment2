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

	get <- function() return(x)


	## method: sets the inverse

	setInverse <- function(inverse) {
		im <<- inverse
	}


	## method: get the inverse of the matrix

	getInverse <- function() return(im)


	## list containing a function to set, get, setInverse & getInverse
	
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should 
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {

	## get the inverse matrix

	m <- x$getInverse()


	## check to see if inverse matrix exists

	if( !is.null(m) ) {
		message("getting cached data")
		return(m)
	}	


	## no inverse matrix exists
	## get the matrix

	matrix <- x$get()


	## solve the inverse matrix

	inv <- solve(matrix)


	## set the inverse matrix

	x$setInverse(inv)
	
	
	## Return a matrix that is the inverse of 'x'
	
	return(inv)

}
