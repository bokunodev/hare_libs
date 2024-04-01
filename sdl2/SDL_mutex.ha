export type mutex = opaque;

export @symbol("SDL_CreateMutex"  ) fn CreateMutex() *mutex;
export @symbol("SDL_LockMutex"    ) fn LockMutex(mutex: *mutex) int;
export @symbol("SDL_TryLockMutex" ) fn TryLockMutex(mutex: *mutex) int;
export @symbol("SDL_UnlockMutex"  ) fn UnlockMutex(mutex: *mutex) int;
export @symbol("SDL_DestroyMutex" ) fn DestroyMutex(mutex: *mutex) void;

export type sem = opaque;

export @symbol("SDL_CreateSemaphore"  ) fn CreateSemaphore(initial_value: u32) *sem;
export @symbol("SDL_DestroySemaphore" ) fn DestroySemaphore(sem: *sem) void;
export @symbol("SDL_SemWait"          ) fn SemWait(sem: *sem) int;
export @symbol("SDL_SemTryWait"       ) fn SemTryWait(sem: *sem) int;
export @symbol("SDL_SemWaitTimeout"   ) fn SemWaitTimeout(sem: *sem, timeout: u32) int;
export @symbol("SDL_SemPost"          ) fn SemPost(sem: *sem) int;
export @symbol("SDL_SemValue"         ) fn SemValue(sem: *sem) u32;

export type cond = opaque;

export @symbol("SDL_CreateCond"      ) fn CreateCond() *cond;
export @symbol("SDL_DestroyCond"     ) fn DestroyCond(cond: *cond) void;
export @symbol("SDL_CondSignal"      ) fn CondSignal(cond: *cond) int;
export @symbol("SDL_CondBroadcast"   ) fn CondBroadcast(cond: *cond) int;
export @symbol("SDL_CondWait"        ) fn CondWait(cond: *cond, mutex: *mutex) int;
export @symbol("SDL_CondWaitTimeout" ) fn CondWaitTimeout(cond: *cond, mutex: *mutex, ms: u32) int;
