instance creation
fromXML: entryNode
	| issue |
	
	issue := self with: (entryNode findTag: 'issues:id') text asInteger.
	
	issue published: entryNode published text asDateAndTime.
	issue updated: entryNode updated text asDateAndTime.
	issue title: entryNode title text.
	
	issue content: ((GoogleIssueComment fromXML: entryNode)
							issue: issue;
							yourself).
	
	issue labels: ((entryNode findAllTags: 'issues:label') 
							collect: [:element| element text]).
	
	^ issue