use types::c;

export @symbol("SDL_GetPlatform") fn GetPlatform() const*c::char;
