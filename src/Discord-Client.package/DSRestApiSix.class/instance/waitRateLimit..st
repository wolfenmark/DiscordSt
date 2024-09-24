as yet unclassified
waitRateLimit: aResponse
	| headers |
	self flag: #FIXME "This is a quick hack to test suboptimal rate limiting to dump data even if not efficiently".
	headers := aResponse headers.
	(headers includesKey: 'X-Ratelimit-Remaining') ifTrue: [ | bucket remaining resetTime |
		bucket := headers at: 'X-Ratelimit-Bucket'.
		remaining := headers at: 'X-Ratelimit-Remaining'.
		resetTime := headers at: 'X-Ratelimit-Reset'.
	
		((remaining asInteger) > 0)
			ifFalse: [ | now waitTime |
				now := DateAndTime now asUnixTime asInteger.
				waitTime := ((resetTime asInteger) - now) second.
				waitTime wait.
		].
	].
