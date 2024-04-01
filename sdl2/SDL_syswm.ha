
export type SYSWM_TYPE = enum {
	SYSWM_UNKNOWN,
	SYSWM_WINDOWS,
	SYSWM_X11,
	SYSWM_DIRECTFB,
	SYSWM_COCOA,
	SYSWM_UIKIT,
	SYSWM_WAYLAND,
	SYSWM_MIR,
	SYSWM_WINRT,
	SYSWM_ANDROID,
	SYSWM_VIVANTE,
	SYSWM_OS2,
	SYSWM_HAIKU,
	SYSWM_KMSDRM,
	SYSWM_RISCOS,
};

export type SysWMmsg = struct {
	version:   version,
	subsystem: SYSWM_TYPE,
	msg: union {
		dummy: int,
	},
};

export type SysWMinfo = struct {
	version:   version,
	subsystem: SYSWM_TYPE,
	info: union {
		dummy: [64]u8,
	},
};

export @symbol("SDL_GetWindowWMInfo") fn GetWindowWMInfo(window: *Window, info: *SysWMinfo) Bool;
