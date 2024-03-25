use types::c;

export @symbol("SDL_LoadObject"   ) fn LoadObject(sofile: const*c::char) *opaque;
export @symbol("SDL_LoadFunction" ) fn LoadFunction(handle: *opaque, name: const*c::char) *opaque;
export @symbol("SDL_UnloadObject" ) fn UnloadObject(handle: *opaque) void;
