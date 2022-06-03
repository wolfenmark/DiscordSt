mapping - message
messageReferenceMappingFor: aNeoJSONMapper
	aNeoJSONMapper
		for: DSMessageReference do: [ :mapping |
			mapping allowNil.
	      mapping mapAccessor: #messageId to: #message_id.
	      mapping mapAccessor: #channelId to: #channel_id.
			mapping mapAccessor: #guildId to: #guild_id. ].