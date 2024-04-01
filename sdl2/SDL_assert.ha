use types::c;

export type AssertState = enum {
	ASSERTION_RETRY,
	ASSERTION_BREAK,
	ASSERTION_ABORT,
	ASSERTION_IGNORE,
	ASSERTION_ALWAYS_IGNORE,
};

export type AssertData = struct {
	always_ignore: int,
	trigger_count: uint,
	condition:     const*c::char,
	filename:      const*c::char,
	linenum:       int,
	function:      const*c::char,
	next:          const*AssertData,
};

export type AssertionHandler = *fn(data: const*AssertData, userdata: *opaque) *AssertState;

export @symbol("SDL_ReportAssertion"            ) fn ReportAssertion(*AssertData , const*c::char , const*c::char , int) AssertState;
export @symbol("SDL_SetAssertionHandler"        ) fn SetAssertionHandler(handler: AssertionHandler, userdata: *opaque) void;
export @symbol("SDL_GetDefaultAssertionHandler" ) fn GetDefaultAssertionHandler() AssertionHandler;
export @symbol("SDL_GetAssertionHandler"        ) fn GetAssertionHandler(puserdata: **opaque) AssertionHandler;
export @symbol("SDL_GetAssertionReport"         ) fn GetAssertionReport() const*AssertData;
export @symbol("SDL_ResetAssertionReport"       ) fn ResetAssertionReport() void;
