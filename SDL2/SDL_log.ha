use types::c;

export type SDL_LogCategory = enum {
	SDL_LOG_CATEGORY_APPLICATION,
	SDL_LOG_CATEGORY_ERROR,
	SDL_LOG_CATEGORY_ASSERT,
	SDL_LOG_CATEGORY_SYSTEM,
	SDL_LOG_CATEGORY_AUDIO,
	SDL_LOG_CATEGORY_VIDEO,
	SDL_LOG_CATEGORY_RENDER,
	SDL_LOG_CATEGORY_INPUT,
	SDL_LOG_CATEGORY_TEST,
	SDL_LOG_CATEGORY_RESERVED1,
	SDL_LOG_CATEGORY_RESERVED2,
	SDL_LOG_CATEGORY_RESERVED3,
	SDL_LOG_CATEGORY_RESERVED4,
	SDL_LOG_CATEGORY_RESERVED5,
	SDL_LOG_CATEGORY_RESERVED6,
	SDL_LOG_CATEGORY_RESERVED7,
	SDL_LOG_CATEGORY_RESERVED8,
	SDL_LOG_CATEGORY_RESERVED9,
	SDL_LOG_CATEGORY_RESERVED10,
	SDL_LOG_CATEGORY_CUSTOM,
};

export type SDL_LogPriority = enum {
	SDL_LOG_PRIORITY_VERBOSE = 1,
	SDL_LOG_PRIORITY_DEBUG,
	SDL_LOG_PRIORITY_INFO,
	SDL_LOG_PRIORITY_WARN,
	SDL_LOG_PRIORITY_ERROR,
	SDL_LOG_PRIORITY_CRITICAL,
	SDL_NUM_LOG_PRIORITIES,
};

export type SDL_LogOutputFunction = *fn(userdata: *opaque, category: int, priority: SDL_LogPriority, message: const*c::char) void;

export @symbol("SDL_LogSetAllPriority"    ) fn LogSetAllPriority(priority: SDL_LogPriority) void;
export @symbol("SDL_LogSetPriority"       ) fn LogSetPriority(category: int, priority: SDL_LogPriority) void;
export @symbol("SDL_LogGetPriority"       ) fn LogGetPriority(category: int) SDL_LogPriority;
export @symbol("SDL_LogResetPriorities"   ) fn LogResetPriorities() void;
export @symbol("SDL_Log"                  ) fn Log(fmt: const*c::char...) void;
export @symbol("SDL_LogVerbose"           ) fn LogVerbose(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogDebug"             ) fn LogDebug(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogInfo"              ) fn LogInfo(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogWarn"              ) fn LogWarn(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogError"             ) fn LogError(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogCritical"          ) fn LogCritical(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogMessage"           ) fn LogMessage(category: int, priority: SDL_LogPriority,  fmt: const*c::char...) void;
export @symbol("SDL_LogMessageV"          ) fn LogMessageV(category: int, priority: SDL_LogPriority,  fmt: const*c::char, ap: valist) void;
export @symbol("SDL_LogGetOutputFunction" ) fn LogGetOutputFunction(callback: *SDL_LogOutputFunction, userdata: **opaque) void;
export @symbol("SDL_LogSetOutputFunction" ) fn LogSetOutputFunction(callback: SDL_LogOutputFunction, userdata: *opaque) void;
