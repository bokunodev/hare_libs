export type Cursor = opaque;

export type SystemCursor = enum {
	SYSTEM_CURSOR_ARROW,
	SYSTEM_CURSOR_IBEAM,
	SYSTEM_CURSOR_WAIT,
	SYSTEM_CURSOR_CROSSHAIR,
	SYSTEM_CURSOR_WAITARROW,
	SYSTEM_CURSOR_SIZENWSE,
	SYSTEM_CURSOR_SIZENESW,
	SYSTEM_CURSOR_SIZEWE,
	SYSTEM_CURSOR_SIZENS,
	SYSTEM_CURSOR_SIZEALL,
	SYSTEM_CURSOR_NO,
	SYSTEM_CURSOR_HAND,
	NUM_SYSTEM_CURSORS,
};

export type MouseWheelDirection = enum {
	MOUSEWHEEL_NORMAL,
	MOUSEWHEEL_FLIPPED,
};

export @symbol("SDL_GetMouseFocus"         ) fn GetMouseFocus() *Window;
export @symbol("SDL_GetMouseState"         ) fn GetMouseState(x: *int, y: *int) u32;
export @symbol("SDL_GetGlobalMouseState"   ) fn GetGlobalMouseState(x: *int, y: *int) u32;
export @symbol("SDL_GetRelativeMouseState" ) fn GetRelativeMouseState(x: *int, y: *int) u32;
export @symbol("SDL_WarpMouseInWindow"     ) fn WarpMouseInWindow(window: *Window, x: int, y: int) void;
export @symbol("SDL_WarpMouseGlobal"       ) fn WarpMouseGlobal(x: int, y: int) int;
export @symbol("SDL_SetRelativeMouseMode"  ) fn SetRelativeMouseMode(enabled: Bool) int;
export @symbol("SDL_CaptureMouse"          ) fn CaptureMouse(enabled: Bool) int;
export @symbol("SDL_GetRelativeMouseMode"  ) fn GetRelativeMouseMode() Bool;
export @symbol("SDL_CreateCursor"          ) fn CreateCursor(data: const*u8, mask: const*u8, w: int, h: int, hot_x: int, hot_y: int) *Cursor;
export @symbol("SDL_CreateColorCursor"     ) fn CreateColorCursor(surface: *Surface, hot_x: int, hot_y: int) *Cursor;
export @symbol("SDL_CreateSystemCursor"    ) fn CreateSystemCursor(id: SystemCursor) *Cursor;
export @symbol("SDL_SetCursor"             ) fn SetCursor(cursor: *Cursor) void;
export @symbol("SDL_GetCursor"             ) fn GetCursor() *Cursor;
export @symbol("SDL_GetDefaultCursor"      ) fn GetDefaultCursor() *Cursor;
export @symbol("SDL_FreeCursor"            ) fn FreeCursor(cursor: *Cursor) void;
export @symbol("SDL_ShowCursor"            ) fn ShowCursor(toggle: int) int;
