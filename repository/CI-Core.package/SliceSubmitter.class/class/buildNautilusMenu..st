nautilus menu
buildNautilusMenu: aBuilder
	<nautilusPackageMenu>
	| package target mc |
	target := aBuilder model.
	(package := target selectedPackage) ifNil: [ ^ self ].
	mc := NautilusMCBindings default retrieveMCPackageFor: package.
	
	mc workingCopy modified not ifTrue: [ ^ self ].
	(aBuilder item: #'Commit this package')
		action: [ self new 
						receiver: target window;
						mcPackage: mc;
						submitNewSlice ];
		order: 1299.5;
		icon: UITheme current forwardIcon;
		help: 'Create a bug entry and a slice for the selected package';
		withSeparatorAfter.
	