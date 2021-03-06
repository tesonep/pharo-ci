saving
submit
	
	"save an issue on the tracker"
	
	| result |
	
	id ifNotNil: [ ^  self error: 'Cannot create the same issue twice. Original issue is ', self viewUrl ].
	result := self postXML: self issueCreateXML to: self issueUrl.
	
	"set the id to prevent multiple submissions of the same issue"
	id := result location squeezeOutNumber.
	
	^ result.