use types::c;

export type SDL_main_func = *fn(argc: int, argv: const**c::char) int;

export @symbol("SDL_main"         ) fn main(argc: int, argv: const**c::char) int;
export @symbol("SDL_SetMainReady" ) fn SetMainReady() void;
