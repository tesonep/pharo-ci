accessing
newestComment
	^ self comments detectMax: [ :comment| comment updated ]