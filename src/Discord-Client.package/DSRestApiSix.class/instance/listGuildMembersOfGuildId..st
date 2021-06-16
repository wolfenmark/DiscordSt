public
listGuildMembersOfGuildId: guildId
	"Returns a list of guild member objects that are members of the guild.
	See https://discordapp.com/developers/docs/resources/guild#list-guild-members"

	| reply partialReply params |
	self flag: #TODO. "This is a quick hack implemented to handle members pagination. Fix this in the proper way."
	
	params := Dictionary new
		at: 'limit' put: 1000 asString;
		at: 'after' put: 0 asString;
		yourself.
	reply := OrderedCollection new.
	[
		partialReply := self listGuildMembersOfGuildId: guildId queryParams: params.
		('Received ' , partialReply size printString , ' additional members') traceCr.
		reply addAll: partialReply.
		params at: 'after' put: partialReply last user id asString.
	] doWhileTrue: [ partialReply size = 1000 ].
	('Total members received: ' , reply size printString) traceCr.

	^ reply