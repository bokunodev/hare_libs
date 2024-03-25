export type SDL_SpinLock = int;

export @symbol("SDL_AtomicTryLock"                ) fn AtomicTryLock(lock: *SDL_SpinLock) SDL_bool;
export @symbol("SDL_AtomicLock"                   ) fn AtomicLock(lock: *SDL_SpinLock) void;
export @symbol("SDL_AtomicUnlock"                 ) fn AtomicUnlock(lock: *SDL_SpinLock) void;
export @symbol("SDL_MemoryBarrierReleaseFunction" ) fn MemoryBarrierReleaseFunction() void;
export @symbol("SDL_MemoryBarrierAcquireFunction" ) fn MemoryBarrierAcquireFunction() void;

export type SDL_atomic_t = struct { value: int };

export @symbol("SDL_AtomicCAS"    ) fn AtomicCAS(a: *SDL_atomic_t, oldval: int, newval: int) SDL_bool;
export @symbol("SDL_AtomicSet"    ) fn AtomicSet(a: *SDL_atomic_t, v: int) int;
export @symbol("SDL_AtomicGet"    ) fn AtomicGet(a: *SDL_atomic_t) int;
export @symbol("SDL_AtomicAdd"    ) fn AtomicAdd(a: *SDL_atomic_t, v: int) int;
export @symbol("SDL_AtomicCASPtr" ) fn AtomicCASPtr(a: **opaque, oldval: *opaque, newval: *opaque) SDL_bool;
export @symbol("SDL_AtomicSetPtr" ) fn AtomicSetPtr(a: **opaque, v: *opaque) *opaque;
export @symbol("SDL_AtomicGetPtr" ) fn AtomicGetPtr(a: **opaque) *opaque;
