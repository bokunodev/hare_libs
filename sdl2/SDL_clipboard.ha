use types::c;

export @symbol("SDL_SetClipboardText"        ) fn SetClipboardText(text: const*c::char) int;
export @symbol("SDL_GetClipboardText"        ) fn GetClipboardText() *c::char;
export @symbol("SDL_HasClipboardText"        ) fn HasClipboardText() Bool;
export @symbol("SDL_SetPrimarySelectionText" ) fn SetPrimarySelectionText(text: const*c::char) int;
export @symbol("SDL_GetPrimarySelectionText" ) fn GetPrimarySelectionText() *c::char;
export @symbol("SDL_HasPrimarySelectionText" ) fn HasPrimarySelectionText() Bool;
