publishing
publishFailure: aCIValidationResult 

	VTermOutputDriver stderr red: (aCIValidationResult change name asString, ' >> test failure report').
	aCIValidationResult failures do: [ :aFailure |
		VTermOutputDriver stderr red: aFailure asString;lf ]