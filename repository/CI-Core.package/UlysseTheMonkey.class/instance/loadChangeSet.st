private
loadChangeSet
	"load the changeset(s) for the issue"
	
	self flag: 'TODO: record the adds/changes/removes per package'.
	
	self issue changeSets do: [ :attachment | 
		 [ attachment contents asString readStream fileIn ] 
			on: Error 
			do: [ :e| self addError: e forFile: attachment description ]].
		
	self extraTests addAll: self dirtyPackagesTests.