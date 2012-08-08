protocol
commit: workingCopy in: repo message: message
	| newVersion |

	[ newVersion := workingCopy newVersion ]
		on: MCVersionNameAndMessageRequest
		do: [:n | n resume: (Array with: n suggestedName with: message)].
		
	newVersion ifNil: [ ^ self ].
	repo storeVersion: newVersion.
	repo storeDependencies: newVersion