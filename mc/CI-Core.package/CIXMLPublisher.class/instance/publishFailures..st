publishing
publishFailures: aCIValidationResult
	self xmlWriter
		writeWith: [ :writer | 
			writer tag: 'finality' with: 'succeed'.
			writer tag: 'failure' with: [
				aCIValidationResult errors do: [ :aMessage | 
					writer tag: 'result' with: aMessage asString ]]]