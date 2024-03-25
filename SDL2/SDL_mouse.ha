export type SDL_Cursor = opaque;

export type SDL_SystemCursor = enum {
	SDL_SYSTEM_CURSOR_ARROW,
	SDL_SYSTEM_CURSOR_IBEAM,
	SDL_SYSTEM_CURSOR_WAIT,
	SDL_SYSTEM_CURSOR_CROSSHAIR,
	SDL_SYSTEM_CURSOR_WAITARROW,
	SDL_SYSTEM_CURSOR_SIZENWSE,
	SDL_SYSTEM_CURSOR_SIZENESW,
	SDL_SYSTEM_CURSOR_SIZEWE,
	SDL_SYSTEM_CURSOR_SIZENS,
	SDL_SYSTEM_CURSOR_SIZEALL,
	SDL_SYSTEM_CURSOR_NO,
	SDL_SYSTEM_CURSOR_HAND,
	SDL_NUM_SYSTEM_CURSORS,
};

export type SDL_MouseWheelDirection = enum {
	SDL_MOUSEWHEEL_NORMAL,
	SDL_MOUSEWHEEL_FLIPPED,
};

export @symbol("SDL_GetMouseFocus"         ) fn GetMouseFocus() *SDL_Window;
export @symbol("SDL_GetMouseState"         ) fn GetMouseState(x: *int, y: *int) u32;
export @symbol("SDL_GetGlobalMouseState"   ) fn GetGlobalMouseState(x: *int, y: *int) u32;
export @symbol("SDL_GetRelativeMouseState" ) fn GetRelativeMouseState(x: *int, y: *int) u32;
export @symbol("SDL_WarpMouseInWindow"     ) fn WarpMouseInWindow(window: *SDL_Window, x: int, y: int) void;
export @symbol("SDL_WarpMouseGlobal"       ) fn WarpMouseGlobal(x: int, y: int) int;
export @symbol("SDL_SetRelativeMouseMode"  ) fn SetRelativeMouseMode(enabled: SDL_bool) int;
export @symbol("SDL_CaptureMouse"          ) fn CaptureMouse(enabled: SDL_bool) int;
export @symbol("SDL_GetRelativeMouseMode"  ) fn GetRelativeMouseMode() SDL_bool;
export @symbol("SDL_CreateCursor"          ) fn CreateCursor(data: const*u8, mask: const*u8, w: int, h: int, hot_x: int, hot_y: int) *SDL_Cursor;
export @symbol("SDL_CreateColorCursor"     ) fn CreateColorCursor(surface: *SDL_Surface, hot_x: int, hot_y: int) *SDL_Cursor;
export @symbol("SDL_CreateSystemCursor"    ) fn CreateSystemCursor(id: SDL_SystemCursor) *SDL_Cursor;
export @symbol("SDL_SetCursor"             ) fn SetCursor(cursor: *SDL_Cursor) void;
export @symbol("SDL_GetCursor"             ) fn GetCursor() *SDL_Cursor;
export @symbol("SDL_GetDefaultCursor"      ) fn GetDefaultCursor() *SDL_Cursor;
export @symbol("SDL_FreeCursor"            ) fn FreeCursor(cursor: *SDL_Cursor) void;
export @symbol("SDL_ShowCursor"            ) fn ShowCursor(toggle: int) int;
