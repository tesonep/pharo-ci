printing
buildRedReportOn: stream
	
	self buildErrorReportOn: stream.
	self buildTestsReportOn: stream.
	
	stream lf.
	self buildSetupDescriptionOn: stream.