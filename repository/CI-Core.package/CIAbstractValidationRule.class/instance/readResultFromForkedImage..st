image forking
readResultFromForkedImage: forkedImage
	| readStream |
	readStream := forkedImage pipeFromOutput upToEnd asByteArray readStream.
	[ ^ (FLMaterializer newDefault materializeFrom: readStream) root ]
		on: Error do: [ :error| 
			^ CIValidationResult failure: 'Could not parse result from forked image' ]