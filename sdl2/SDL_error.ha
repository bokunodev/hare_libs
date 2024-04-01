use types::c;

export type ErrorCode = enum {
	ENOMEM,
	EFREAD,
	EFWRITE,
	EFSEEK,
	UNSUPPORTED,
	LASTERROR,
};

export @symbol("SDL_SetError"    ) fn SetError(fmt: const*c::char...) int;
export @symbol("SDL_GetError"    ) fn GetError() const*c::char;
export @symbol("SDL_GetErrorMsg" ) fn GetErrorMsg(err_str: *c::char, max_len: int) *c::char;
export @symbol("SDL_ClearError"  ) fn ClearError() void;
export @symbol("SDL_Error"       ) fn Error(code: ErrorCode) int;
