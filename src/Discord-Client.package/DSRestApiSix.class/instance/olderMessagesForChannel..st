public - channel
olderMessagesForChannel: aChannel
	"Return a collection of messages for a given channel 
	that are older then the oldest message the channel holds.
	If there are no current messages, it returns the recent messages."
	<return: #DSMessages of: #DSMessage>
	| queryParams |
	queryParams := aChannel oldestMessage 
		ifNotNil: [ :aMessage | Dictionary new at: 'before' put: aMessage id; yourself ]
		ifNil: [ #() ].
	^ self messagesForChannelId: aChannel id queryParams: queryParams