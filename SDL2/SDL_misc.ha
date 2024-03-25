use types::c;

export @symbol("SDL_OpenURL") fn OpenURL(url: const*c::char) int;
