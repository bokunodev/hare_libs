export type SpinLock = int;

export @symbol("SDL_AtomicTryLock"                ) fn AtomicTryLock(lock: *SpinLock) Bool;
export @symbol("SDL_AtomicLock"                   ) fn AtomicLock(lock: *SpinLock) void;
export @symbol("SDL_AtomicUnlock"                 ) fn AtomicUnlock(lock: *SpinLock) void;
export @symbol("SDL_MemoryBarrierReleaseFunction" ) fn MemoryBarrierReleaseFunction() void;
export @symbol("SDL_MemoryBarrierAcquireFunction" ) fn MemoryBarrierAcquireFunction() void;

export type atomic_t = struct { value: int };

export @symbol("SDL_AtomicCAS"    ) fn AtomicCAS(a: *atomic_t, oldval: int, newval: int) Bool;
export @symbol("SDL_AtomicSet"    ) fn AtomicSet(a: *atomic_t, v: int) int;
export @symbol("SDL_AtomicGet"    ) fn AtomicGet(a: *atomic_t) int;
export @symbol("SDL_AtomicAdd"    ) fn AtomicAdd(a: *atomic_t, v: int) int;
export @symbol("SDL_AtomicCASPtr" ) fn AtomicCASPtr(a: **opaque, oldval: *opaque, newval: *opaque) Bool;
export @symbol("SDL_AtomicSetPtr" ) fn AtomicSetPtr(a: **opaque, v: *opaque) *opaque;
export @symbol("SDL_AtomicGetPtr" ) fn AtomicGetPtr(a: **opaque) *opaque;
