local GetNumFriends = GetNumFriends
local GetFriendInfo = GetFriendInfo

C_FriendList = C_FriendList or {}

C_FriendList.GetNumFriends = function()
	return GetNumFriends()
end

C_FriendList.GetFriendInfoByIndex = function(index)
	return GetFriendInfo(index)
end