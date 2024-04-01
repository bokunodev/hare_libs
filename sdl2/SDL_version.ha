use types::c;

export type version = struct {
	major: u8,
	minor: u8,
	patch: u8,
};

export @symbol("SDL_GetVersion"  ) fn GetVersion(ver: *version) void;
export @symbol("SDL_GetRevision" ) fn GetRevision() const*c::char;
