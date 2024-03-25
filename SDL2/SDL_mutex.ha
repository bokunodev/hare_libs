export type SDL_mutex = opaque;

export @symbol("SDL_CreateMutex"  ) fn CreateMutex() *SDL_mutex;
export @symbol("SDL_LockMutex"    ) fn LockMutex(mutex: *SDL_mutex) int;
export @symbol("SDL_TryLockMutex" ) fn TryLockMutex(mutex: *SDL_mutex) int;
export @symbol("SDL_UnlockMutex"  ) fn UnlockMutex(mutex: *SDL_mutex) int;
export @symbol("SDL_DestroyMutex" ) fn DestroyMutex(mutex: *SDL_mutex) void;

export type SDL_sem = opaque;

export @symbol("SDL_CreateSemaphore"  ) fn CreateSemaphore(initial_value: u32) *SDL_sem;
export @symbol("SDL_DestroySemaphore" ) fn DestroySemaphore(sem: *SDL_sem) void;
export @symbol("SDL_SemWait"          ) fn SemWait(sem: *SDL_sem) int;
export @symbol("SDL_SemTryWait"       ) fn SemTryWait(sem: *SDL_sem) int;
export @symbol("SDL_SemWaitTimeout"   ) fn SemWaitTimeout(sem: *SDL_sem, timeout: u32) int;
export @symbol("SDL_SemPost"          ) fn SemPost(sem: *SDL_sem) int;
export @symbol("SDL_SemValue"         ) fn SemValue(sem: *SDL_sem) u32;

export type SDL_cond = opaque;

export @symbol("SDL_CreateCond"      ) fn CreateCond() *SDL_cond;
export @symbol("SDL_DestroyCond"     ) fn DestroyCond(cond: *SDL_cond) void;
export @symbol("SDL_CondSignal"      ) fn CondSignal(cond: *SDL_cond) int;
export @symbol("SDL_CondBroadcast"   ) fn CondBroadcast(cond: *SDL_cond) int;
export @symbol("SDL_CondWait"        ) fn CondWait(cond: *SDL_cond, mutex: *SDL_mutex) int;
export @symbol("SDL_CondWaitTimeout" ) fn CondWaitTimeout(cond: *SDL_cond, mutex: *SDL_mutex, ms: u32) int;
