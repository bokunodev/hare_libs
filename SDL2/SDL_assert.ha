use types::c;

export type SDL_AssertState = enum {
	SDL_ASSERTION_RETRY,
	SDL_ASSERTION_BREAK,
	SDL_ASSERTION_ABORT,
	SDL_ASSERTION_IGNORE,
	SDL_ASSERTION_ALWAYS_IGNORE,
};

export type SDL_AssertData = struct {
	always_ignore: int,
	trigger_count: uint,
	condition:     const*c::char,
	filename:      const*c::char,
	linenum:       int,
	function:      const*c::char,
	next:          const*SDL_AssertData,
};

export type SDL_AssertionHandler = *fn(data: const*SDL_AssertData, userdata: *opaque) *SDL_AssertState;

export @symbol("SDL_ReportAssertion"            ) fn ReportAssertion(*SDL_AssertData , const*c::char , const*c::char , int) SDL_AssertState;
export @symbol("SDL_SetAssertionHandler"        ) fn SetAssertionHandler(handler: SDL_AssertionHandler, userdata: *opaque) void;
export @symbol("SDL_GetDefaultAssertionHandler" ) fn GetDefaultAssertionHandler() SDL_AssertionHandler;
export @symbol("SDL_GetAssertionHandler"        ) fn GetAssertionHandler(puserdata: **opaque) SDL_AssertionHandler;
export @symbol("SDL_GetAssertionReport"         ) fn GetAssertionReport() const*SDL_AssertData;
export @symbol("SDL_ResetAssertionReport"       ) fn ResetAssertionReport() void;
