printing
buildGreenReportOn: stream

	| packages |
	
	testResult ifNil: [ ^ self ].
	
	self buildGreenTitleOn: stream.
	self buildGreenTestResultsOn: stream.
	self buildGreenChangesOn: stream.
	self buildSetupDescriptionOn: stream.