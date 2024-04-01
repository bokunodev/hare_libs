use types::c;

export type LogCategory = enum {
	LOG_CATEGORY_APPLICATION,
	LOG_CATEGORY_ERROR,
	LOG_CATEGORY_ASSERT,
	LOG_CATEGORY_SYSTEM,
	LOG_CATEGORY_AUDIO,
	LOG_CATEGORY_VIDEO,
	LOG_CATEGORY_RENDER,
	LOG_CATEGORY_INPUT,
	LOG_CATEGORY_TEST,
	LOG_CATEGORY_RESERVED1,
	LOG_CATEGORY_RESERVED2,
	LOG_CATEGORY_RESERVED3,
	LOG_CATEGORY_RESERVED4,
	LOG_CATEGORY_RESERVED5,
	LOG_CATEGORY_RESERVED6,
	LOG_CATEGORY_RESERVED7,
	LOG_CATEGORY_RESERVED8,
	LOG_CATEGORY_RESERVED9,
	LOG_CATEGORY_RESERVED10,
	LOG_CATEGORY_CUSTOM,
};

export type LogPriority = enum {
	LOG_PRIORITY_VERBOSE = 1,
	LOG_PRIORITY_DEBUG,
	LOG_PRIORITY_INFO,
	LOG_PRIORITY_WARN,
	LOG_PRIORITY_ERROR,
	LOG_PRIORITY_CRITICAL,
	NUM_LOG_PRIORITIES,
};

export type LogOutputFunction = *fn(userdata: *opaque, category: int, priority: LogPriority, message: const*c::char) void;

export @symbol("SDL_LogSetAllPriority"    ) fn LogSetAllPriority(priority: LogPriority) void;
export @symbol("SDL_LogSetPriority"       ) fn LogSetPriority(category: int, priority: LogPriority) void;
export @symbol("SDL_LogGetPriority"       ) fn LogGetPriority(category: int) LogPriority;
export @symbol("SDL_LogResetPriorities"   ) fn LogResetPriorities() void;
export @symbol("SDL_Log"                  ) fn Log(fmt: const*c::char...) void;
export @symbol("SDL_LogVerbose"           ) fn LogVerbose(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogDebug"             ) fn LogDebug(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogInfo"              ) fn LogInfo(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogWarn"              ) fn LogWarn(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogError"             ) fn LogError(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogCritical"          ) fn LogCritical(category: int,  fmt: const*c::char...) void;
export @symbol("SDL_LogMessage"           ) fn LogMessage(category: int, priority: LogPriority,  fmt: const*c::char...) void;
export @symbol("SDL_LogMessageV"          ) fn LogMessageV(category: int, priority: LogPriority,  fmt: const*c::char, ap: valist) void;
export @symbol("SDL_LogGetOutputFunction" ) fn LogGetOutputFunction(callback: *LogOutputFunction, userdata: **opaque) void;
export @symbol("SDL_LogSetOutputFunction" ) fn LogSetOutputFunction(callback: LogOutputFunction, userdata: *opaque) void;
