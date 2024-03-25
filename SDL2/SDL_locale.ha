use types::c;

export type SDL_Locale = struct {
	language: const*c::char,
	country:  const*c::char,
};

export @symbol("SDL_GetPreferredLocales") fn GetPreferredLocales() *SDL_Locale;
