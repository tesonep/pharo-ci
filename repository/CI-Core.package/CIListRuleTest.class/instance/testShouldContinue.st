tests
testShouldContinue

	| ruleOne ruleTwo aResult ruleThree ruleFour |
	
	ruleOne := [ :change | CIValidationResult failure: 'test failure' ] asCIValidationRule.
	ruleTwo := [ :change | CIValidationResult message: 'test message' ] asCIValidationRule.
	ruleThree := [ :change | CIValidationResult warning: 'test message' ] asCIValidationRule.
	ruleFour := [ :change | CIValidationResult failure: 'test message' ] asCIValidationRule.
	aResult := (((CIListRule with: ruleOne with: ruleTwo ) addWith: ruleThree) addWith: ruleFour) validate.
	
	self assert: aResult failures size equals: 2.
	self assert: aResult messages size equals: 1.	
	self assert: aResult warnings size equals: 1.