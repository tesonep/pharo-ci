private
container

	^container ifNil: [ container :=  PanelMorph new
										color: Color red;
										vResizing: #spaceFill;
										hResizing: #spaceFill
										yourself ]