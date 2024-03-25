use types::c;

export type SDL_Thread = opaque;
export type SDL_threadID   = u64;
export type SDL_TLSID      = uint;

export type SDL_ThreadPriority = enum {
	SDL_THREAD_PRIORITY_LOW,
	SDL_THREAD_PRIORITY_NORMAL,
	SDL_THREAD_PRIORITY_HIGH,
	SDL_THREAD_PRIORITY_TIME_CRITICAL,
};

export type SDL_ThreadFunction = *fn(data: *opaque) int;

export @symbol("SDL_CreateThread"              ) fn CreateThread(func: SDL_ThreadFunction, name: const*c::char, data: *opaque) *SDL_Thread;
export @symbol("SDL_CreateThreadWithStackSize" ) fn CreateThreadWithStackSize(func: SDL_ThreadFunction, name: const*c::char, stack_size: const size, data: *opaque) *SDL_Thread;
export @symbol("SDL_GetThreadName"             ) fn GetThreadName(thread: *SDL_Thread) const*c::char;
export @symbol("SDL_ThreadID"                  ) fn ThreadID() SDL_threadID;
export @symbol("SDL_GetThreadID"               ) fn GetThreadID(thread: *SDL_Thread) SDL_threadID;
export @symbol("SDL_SetThreadPriority"         ) fn SetThreadPriority(priority: SDL_ThreadPriority) int;
export @symbol("SDL_WaitThread"                ) fn WaitThread(thread: *SDL_Thread, status: *int) void;
export @symbol("SDL_DetachThread"              ) fn DetachThread(thread: *SDL_Thread) void;
export @symbol("SDL_TLSCreate"                 ) fn TLSCreate() SDL_TLSID;
export @symbol("SDL_TLSGet"                    ) fn TLSGet(id: SDL_TLSID) *opaque;
export @symbol("SDL_TLSSet"                    ) fn TLSSet(id: SDL_TLSID, value: const*opaque, destructor: *fn(*opaque)void) int;
export @symbol("SDL_TLSCleanup"                ) fn TLSCleanup() void;
