accessing
uniqueInstance
	^ UniqueInstance ifNil: [ UniqueInstance := self basicNew initialize ].