publishing
publishFailure: aCIValidationResult 
	| hasTestFailures change |
	
	change := aCIValidationResult change.
	
	self flag: 'stupid test for now'.
	hasTestFailures := aCIValidationResult failures anySatisfy: [ :failure | 
		failure asString includesSubstring: '>>#test' ].
	
	hasTestFailures
		ifTrue: [ change workNeededFailingTests: aCIValidationResult htmlString ]
		ifFalse: [ change workNeeded: aCIValidationResult htmlString ]