use types::c;

export @symbol("SDL_GetBasePath") fn GetBasePath() *c::char;
export @symbol("SDL_GetPrefPath") fn GetPrefPath(org: const*c::char, app: const*c::char) *c::char;
