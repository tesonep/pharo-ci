integration
ensureFix
	
	"check whether this issue has a loadable source, either an attached .cs or .st file or a SLICE"
	
	self hasFix 
		ifFalse: [ self errorNoSources ]