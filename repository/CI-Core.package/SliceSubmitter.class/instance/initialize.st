initialize
initialize
	"Initialization code for SliceSubmitter"

	super initialize.
		
	issue := GoogleIssue new
				status: PharoTrackerLabels accepted;
				tracker: self tracker;
				yourself.
	receiver := World.
	mcPackage := nil.