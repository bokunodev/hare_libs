use types::c;

export type Thread = opaque;
export type threadID   = u64;
export type TLSID      = uint;

export type ThreadPriority = enum {
	THREAD_PRIORITY_LOW,
	THREAD_PRIORITY_NORMAL,
	THREAD_PRIORITY_HIGH,
	THREAD_PRIORITY_TIME_CRITICAL,
};

export type ThreadFunction = *fn(data: *opaque) int;

export @symbol("SDL_CreateThread"              ) fn CreateThread(func: ThreadFunction, name: const*c::char, data: *opaque) *Thread;
export @symbol("SDL_CreateThreadWithStackSize" ) fn CreateThreadWithStackSize(func: ThreadFunction, name: const*c::char, stack_size: const size, data: *opaque) *Thread;
export @symbol("SDL_GetThreadName"             ) fn GetThreadName(thread: *Thread) const*c::char;
export @symbol("SDL_ThreadID"                  ) fn ThreadID() threadID;
export @symbol("SDL_GetThreadID"               ) fn GetThreadID(thread: *Thread) threadID;
export @symbol("SDL_SetThreadPriority"         ) fn SetThreadPriority(priority: ThreadPriority) int;
export @symbol("SDL_WaitThread"                ) fn WaitThread(thread: *Thread, status: *int) void;
export @symbol("SDL_DetachThread"              ) fn DetachThread(thread: *Thread) void;
export @symbol("SDL_TLSCreate"                 ) fn TLSCreate() TLSID;
export @symbol("SDL_TLSGet"                    ) fn TLSGet(id: TLSID) *opaque;
export @symbol("SDL_TLSSet"                    ) fn TLSSet(id: TLSID, value: const*opaque, destructor: *fn(*opaque)void) int;
export @symbol("SDL_TLSCleanup"                ) fn TLSCleanup() void;
