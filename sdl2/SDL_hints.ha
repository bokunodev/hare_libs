use types::c;

export type HintPriority = enum {
	HINT_DEFAULT,
	HINT_NORMAL,
	HINT_OVERRIDE,
};

export @symbol("SDL_SetHintWithPriority" ) fn SetHintWithPriority(name: const*c::char, value: const*c::char, priority: HintPriority) Bool;
export @symbol("SDL_SetHint"             ) fn SetHint(name: const*c::char, value: const*c::char) Bool;
export @symbol("SDL_ResetHint"           ) fn ResetHint(name: const*c::char) Bool;
export @symbol("SDL_ResetHints"          ) fn ResetHints() void;
export @symbol("SDL_GetHint"             ) fn GetHint(name: const*c::char) const*c::char;
export @symbol("SDL_GetHintBoolean"      ) fn GetHintBoolean(name: const*c::char, default_value: Bool) Bool;

export type HintCallback = *fn(userdata: *opaque, name: const*c::char, oldValue: const*c::char, newValue: const*c::char) void;

export @symbol("SDL_AddHintCallback" ) fn AddHintCallback(name: const*c::char, callback: HintCallback, userdata: *opaque) void;
export @symbol("SDL_DelHintCallback" ) fn DelHintCallback(name: const*c::char, callback: HintCallback, userdata: *opaque) void;
export @symbol("SDL_ClearHints"      ) fn ClearHints() void;
