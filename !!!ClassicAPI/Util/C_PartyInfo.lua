local IsInRaid = IsInRaid
local SendChatMessage = SendChatMessage
local strformat = string.format
local NewTicker = C_Timer.NewTicker

C_PartyInfo = C_PartyInfo or {}

local countdownTicker
function C_PartyInfo.DoCountdown(count)
	if ( countdownTicker ) then
		return
	end

	local channel = IsInRaid() and "RAID_WARNING" or "PARTY"
	local countdown = count

	local func = function()
		local timer = strformat(COMPACT_UNIT_FRAME_COUNTDOWN_START, countdown)
		local now = COMPACT_UNIT_FRAME_COUNTDOWN_NOW
		if ( countdown == 0 ) then
			countdownTicker = nil
		end
		SendChatMessage(countdown > 0 and timer or now, channel)
		countdown = countdown - 1
	end

	countdownTicker = NewTicker(1, func, count + 1)
end