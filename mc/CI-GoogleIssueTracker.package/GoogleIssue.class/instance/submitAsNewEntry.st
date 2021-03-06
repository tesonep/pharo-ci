new issue
submitAsNewEntry
	| response |
	
	response := self postXML: (self newIssueXML) to: self newEntryURL.
	response statusLine code = 201
		ifTrue: [ id := (response headers headers at: 'Location') squeezeOutNumber ]
		ifFalse: [ ErrorWhileCreationException response: response ].
		
	^ self