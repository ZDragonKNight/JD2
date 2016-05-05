local action = function(msg, blocks, ln)
    -- save stats
    if blocks[1] == 'start' then
        if msg.chat.type == 'private' then
            local hash = 'bot:general'
            client:hincrby(hash, 'users', 1)
            local name = msg.from.first_name:mEscape()
            api.sendMessage(msg.chat.id,'test', true)
        end
        return
    end
    if blocks[1] == 'help' then
        mystat('/help')
        if msg.chat.type == 'private' then
            local name = msg.from.first_name:mEscape()
             api.sendMessage(msg.chat.id,'test', true)
            return
        end
        keyboard = {}
        keyboard.inline_keyboard = {
    	    {
    		    {text = "Normal user", callback_data = '/user'},
			    {text = "Moderator", callback_data = '/mod'},
    		    {text = "Owner", callback_data = '/owner'}
	    	},
    		{
    			{text = "Info", callback_data = '/info'}
	    	}
    	}
        local res = api.sendKeyboard(msg.from.id, 'Choose the *role* to see the available commands:', keyboard, true)
        if res then
            api.sendMessage(msg.chat.id,'test', true)
        else
            api.sendMessage(msg.chat.id,'test', true)
        end
    end
    if msg.cb then
        local role = blocks[1]
        local msg_id = msg.message_id
        local text
        if role == 'user' then
            text = 'test'
        elseif role == 'mod' then
            text = 'test'
        elseif role == 'owner' then
            text = 'test'
        elseif role == 'info' then
            text = 'test'
        end
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
    end
end

return {
	action = action,
	triggers = {
    	'^/(help)@'..bot.username..'$',
	    '^/(start)@'..bot.username..'$',
	    '^/(start)$',
	    '^/(help)$',
	    '^###cb:/(user)',
    	'^###cb:/(owner)',
	    '^###cb:/(mod)',
	    '^###cb:/(info)'
    }
}
