display
open
	" UI to select issues to integrate "
	| issues issueNumbers preloadString postloadString |
	
	self ensureLoggedIn ifFalse: [ ^ self ].
	
	issues := self openSelectionList.
	issues ifNil: [ ^ self ].
	issueNumbers := issues collect: #id.
	preloadString := UITheme current 
		textEditorIn: World text: 'Enter the preload script' 
		title: 'Preload script' entryText: '' entryHeight: 300.
	postloadString := UITheme current 
		textEditorIn: World text: 'Enter the postload script' 
		title: 'Postload Script' entryText: '' entryHeight: 300.
	
	self writePreloadFile: preloadString.
	self writePostloadFile: postloadString.
	
	self runTheScript: issueNumbers.