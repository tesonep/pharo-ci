private
issuesWithParams: urlParams
	^ self issuesFromXML: (self get: (self issuesURL, urlParams)) contents
	