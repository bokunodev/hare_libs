use types::c;

export type SDL_Keysym = struct {
	scancode: SDL_Scancode,
	sym:      SDL_Keycode,
	mod:      u16,
	unused:   u32,
};

export @symbol("SDL_GetKeyboardFocus"         ) fn GetKeyboardFocus() *SDL_Window;
export @symbol("SDL_GetKeyboardState"         ) fn GetKeyboardState(numkeys: *int) const *u8;
export @symbol("SDL_ResetKeyboard"            ) fn ResetKeyboard() void;
export @symbol("SDL_GetModState"              ) fn GetModState() SDL_Keymod;
export @symbol("SDL_SetModState"              ) fn SetModState(modstate: SDL_Keymod) void;
export @symbol("SDL_GetKeyFromScancode"       ) fn GetKeyFromScancode(scancode: SDL_Scancode) SDL_Keycode;
export @symbol("SDL_GetScancodeFromKey"       ) fn GetScancodeFromKey(key: SDL_Keycode) SDL_Scancode;
export @symbol("SDL_GetScancodeName"          ) fn GetScancodeName(scancode: SDL_Scancode) const*c::char;
export @symbol("SDL_GetScancodeFromName"      ) fn GetScancodeFromName(name: const*c::char) SDL_Scancode;
export @symbol("SDL_GetKeyName"               ) fn GetKeyName(key: SDL_Keycode) const*c::char;
export @symbol("SDL_GetKeyFromName"           ) fn GetKeyFromName(name: const*c::char) SDL_Keycode;
export @symbol("SDL_StartTextInput"           ) fn StartTextInput() void;
export @symbol("SDL_IsTextInputActive"        ) fn IsTextInputActive() SDL_bool;
export @symbol("SDL_StopTextInput"            ) fn StopTextInput() void;
export @symbol("SDL_ClearComposition"         ) fn ClearComposition() void;
export @symbol("SDL_IsTextInputShown"         ) fn IsTextInputShown() SDL_bool;
export @symbol("SDL_SetTextInputRect"         ) fn SetTextInputRect(rect: const*SDL_Rect) void;
export @symbol("SDL_HasScreenKeyboardSupport" ) fn HasScreenKeyboardSupport() SDL_bool;
export @symbol("SDL_IsScreenKeyboardShown"    ) fn IsScreenKeyboardShown(window: *SDL_Window) SDL_bool;
