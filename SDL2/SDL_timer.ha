
export @symbol("SDL_GetTicks"                ) fn GetTicks() u32;
export @symbol("SDL_GetTicks64"              ) fn GetTicks64() u64;
export @symbol("SDL_GetPerformanceCounter"   ) fn GetPerformanceCounter() u64;
export @symbol("SDL_GetPerformanceFrequency" ) fn GetPerformanceFrequency() u64;
export @symbol("SDL_Delay"                   ) fn Delay(ms: u32) void;

export type SDL_TimerCallback = *fn(interval: u32, param: *opaque) u32;
export type SDL_TimerID       = int;

export @symbol("SDL_AddTimer"    ) fn AddTimer(interval: u32, callback: SDL_TimerCallback, param: *opaque) SDL_TimerID;
export @symbol("SDL_RemoveTimer" ) fn RemoveTimer(id: SDL_TimerID) SDL_bool;
