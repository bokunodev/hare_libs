
export type SDL_SYSWM_TYPE = enum {
	SDL_SYSWM_UNKNOWN,
	SDL_SYSWM_WINDOWS,
	SDL_SYSWM_X11,
	SDL_SYSWM_DIRECTFB,
	SDL_SYSWM_COCOA,
	SDL_SYSWM_UIKIT,
	SDL_SYSWM_WAYLAND,
	SDL_SYSWM_MIR,
	SDL_SYSWM_WINRT,
	SDL_SYSWM_ANDROID,
	SDL_SYSWM_VIVANTE,
	SDL_SYSWM_OS2,
	SDL_SYSWM_HAIKU,
	SDL_SYSWM_KMSDRM,
	SDL_SYSWM_RISCOS,
};

export type SDL_SysWMmsg = struct {
	version:   SDL_version,
	subsystem: SDL_SYSWM_TYPE,
	msg: union {
		dummy: int,
	},
};

export type SDL_SysWMinfo = struct {
	version:   SDL_version,
	subsystem: SDL_SYSWM_TYPE,
	info: union {
		dummy: [64]u8,
	},
};

export @symbol("SDL_GetWindowWMInfo") fn GetWindowWMInfo(window: *SDL_Window, info: *SDL_SysWMinfo) SDL_bool;
