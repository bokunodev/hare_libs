use types::c;

export type Keysym = struct {
	scancode: Scancode,
	sym:      Keycode,
	mod:      u16,
	unused:   u32,
};

export @symbol("SDL_GetKeyboardFocus"         ) fn GetKeyboardFocus() *Window;
export @symbol("SDL_GetKeyboardState"         ) fn GetKeyboardState(numkeys: *int) const *u8;
export @symbol("SDL_ResetKeyboard"            ) fn ResetKeyboard() void;
export @symbol("SDL_GetModState"              ) fn GetModState() Keymod;
export @symbol("SDL_SetModState"              ) fn SetModState(modstate: Keymod) void;
export @symbol("SDL_GetKeyFromScancode"       ) fn GetKeyFromScancode(scancode: Scancode) Keycode;
export @symbol("SDL_GetScancodeFromKey"       ) fn GetScancodeFromKey(key: Keycode) Scancode;
export @symbol("SDL_GetScancodeName"          ) fn GetScancodeName(scancode: Scancode) const*c::char;
export @symbol("SDL_GetScancodeFromName"      ) fn GetScancodeFromName(name: const*c::char) Scancode;
export @symbol("SDL_GetKeyName"               ) fn GetKeyName(key: Keycode) const*c::char;
export @symbol("SDL_GetKeyFromName"           ) fn GetKeyFromName(name: const*c::char) Keycode;
export @symbol("SDL_StartTextInput"           ) fn StartTextInput() void;
export @symbol("SDL_IsTextInputActive"        ) fn IsTextInputActive() Bool;
export @symbol("SDL_StopTextInput"            ) fn StopTextInput() void;
export @symbol("SDL_ClearComposition"         ) fn ClearComposition() void;
export @symbol("SDL_IsTextInputShown"         ) fn IsTextInputShown() Bool;
export @symbol("SDL_SetTextInputRect"         ) fn SetTextInputRect(rect: const*Rect) void;
export @symbol("SDL_HasScreenKeyboardSupport" ) fn HasScreenKeyboardSupport() Bool;
export @symbol("SDL_IsScreenKeyboardShown"    ) fn IsScreenKeyboardShown(window: *Window) Bool;
