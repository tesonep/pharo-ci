accessing
relatedPackages
	^ relatedPackages ifNil: [ relatedPackages := self loadRelatedPackages ].
	