initialization
createTypes

	^ #('Type-Bug' 'Type-Cleanup' 'Type-Feature')
		collect: [:e | DropListItem named: e do: []].