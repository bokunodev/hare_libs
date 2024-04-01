use types::c;

export type Locale = struct {
	language: const*c::char,
	country:  const*c::char,
};

export @symbol("SDL_GetPreferredLocales") fn GetPreferredLocales() *Locale;
