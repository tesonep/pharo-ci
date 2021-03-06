tests
impactedPackagesTests
			
	| categories classes |
	categories := self relatedPackages.
	
	classes := self class environment allClasses select: [:class | 
						categories anySatisfy: [:name | 
							class category beginsWith: name ]].
					
	^ classes select: [:e | (e inheritsFrom: TestCase) and: [ e isAbstract not ]].