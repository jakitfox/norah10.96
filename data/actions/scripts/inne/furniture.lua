local furniture = {
	[26089] = 26111, [26111] = 26089, [26110] = 26088, [26088] = 26110, [26109] = 26087,
	[26087] = 26109, [26107] = 26108, [26108] = 26107, [26100] = 26101, [26101] = 26100,
	[26098] = 26099, [26099] = 26098, [26097] = 26095, [26095] = 26097, [26096] = 26094,
	[26094] = 26096, [26090] = 26092, [26092] = 26090, [26091] = 26093, [26093] = 26091,
	[25391] = 25390, [25390] = 25391
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local furniture = furniture[item:getId()]
	if not furniture then
		return false
	end
	item:transform(furniture)
	return true
end
