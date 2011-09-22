loading
loadAttachments
	"since there is no api for accessing attachments from the google issuetracker we have to manually fetch the website and extract the attachments :)"
	
	| soup regex attachmentLinks commentTags attachment comment|
	
	soup := Soup fromString:  (self tracker get: self viewUrl) contents.
	
	"manually find the matching attachment urls.."
	regex := 'http\://pharo.googlecode.com/issues/attachment\?.*' asRegex.
	
	attachmentLinks := ((soup // 'a') select: [ :tag| tag size = 1])
									attribute: #href matching: regex.
	
	"find the parent comment"
	commentTags := (soup // 'div') attribute: 'id' matching: 'hc[0-9]+' asRegex.
		
	"assign attachments to issues"
	^ Array streamContents: [ :stream|
		commentTags do: [ :commentTag|
			comment := self comments at: (commentTag id allButFirst: 2) asInteger + 1.
			attachmentLinks 
				select: [ :link| commentTag includesTag: link] 
				thenDo: [ :link|
					stream nextPut: 
						(comment addAttachment: 
							((GoogleAttachement fromURL: link href)
										issue: self;
										yourself))]]]
							
	