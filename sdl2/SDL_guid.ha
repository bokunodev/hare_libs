use types::c;

export type GUID = struct {
	data: [16]u8,
};

export @symbol("SDL_GUIDToString"   ) fn GUIDToString(guid: GUID, pszGUID: *c::char, cbGUID: int) void;
export @symbol("SDL_GUIDFromString" ) fn GUIDFromString(pchGUID: const*c::char) GUID;
