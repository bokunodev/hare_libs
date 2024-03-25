use types::c;

export type SDL_HintPriority = enum {
	SDL_HINT_DEFAULT,
	SDL_HINT_NORMAL,
	SDL_HINT_OVERRIDE,
};

export @symbol("SDL_SetHintWithPriority" ) fn SetHintWithPriority(name: const*c::char, value: const*c::char, priority: SDL_HintPriority) SDL_bool;
export @symbol("SDL_SetHint"             ) fn SetHint(name: const*c::char, value: const*c::char) SDL_bool;
export @symbol("SDL_ResetHint"           ) fn ResetHint(name: const*c::char) SDL_bool;
export @symbol("SDL_ResetHints"          ) fn ResetHints() void;
export @symbol("SDL_GetHint"             ) fn GetHint(name: const*c::char) const*c::char;
export @symbol("SDL_GetHintBoolean"      ) fn GetHintBoolean(name: const*c::char, default_value: SDL_bool) SDL_bool;

export type SDL_HintCallback = *fn(userdata: *opaque, name: const*c::char, oldValue: const*c::char, newValue: const*c::char) void;

export @symbol("SDL_AddHintCallback" ) fn AddHintCallback(name: const*c::char, callback: SDL_HintCallback, userdata: *opaque) void;
export @symbol("SDL_DelHintCallback" ) fn DelHintCallback(name: const*c::char, callback: SDL_HintCallback, userdata: *opaque) void;
export @symbol("SDL_ClearHints"      ) fn ClearHints() void;
