mapping - message
messageMappingFor: aNeoJSONMapper
	aNeoJSONMapper
		for: DSMessage do: [ :mapping |
			mapping allowNil.
	      mapping mapAccessor: #id.
	      mapping mapAccessor: #channelId to: #channel_id.
	      (mapping mapAccessor: #author) valueSchema: DSUser.
	      mapping mapAccessor: #content.
	      (mapping mapAccessor: #timestamp) valueSchema: DateAndTime.
	      (mapping mapAccessor: #editedTimestamp to: #edited_timestamp) valueSchema: DateAndTime.
			mapping mapAccessor: #isTextToSpeech to: #tts.
			mapping mapAccessor: #hasMentionEveryone to: #mention_everyone.
			(mapping mapAccessor: #mentions) valueSchema: #CollectionOfUsers.
			(mapping mapAccessor: #mentionRoleIds to: #mention_roles).
			(mapping mapAccessor: #attachments) valueSchema: #CollectionOfAttachments.
			(mapping mapAccessor: #embeds) valueSchema: #CollectionOfEmbeds.
			(mapping mapAccessor: #reactions) valueSchema: #CollectionOfReactions.
			mapping mapAccessor: #nonce.
			mapping mapAccessor: #isPinnedInChannel to: #pinned.
			mapping mapAccessor: #webhookId to: #webhook_id.
			mapping mapAccessor: #type.
			(mapping mapAccessor: #messageReference to: #message_reference) valueSchema: DSMessageReference.
			(mapping mapAccessor: #referencedMessage to: #referenced_message) valueSchema: DSMessage ].
	self 
		userMappingFor: aNeoJSONMapper;
		dateAndTimeMappingFor: aNeoJSONMapper;
		collectionOfUsersMappingFor: aNeoJSONMapper;
		collectionOfAttachmentsMappingFor: aNeoJSONMapper;
		collectionOfEmbedsMappingFor: aNeoJSONMapper;
		collectionOfReactionsMappingFor: aNeoJSONMapper;
		messageReferenceMappingFor: aNeoJSONMapper.