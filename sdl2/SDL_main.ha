use types::c;

export type main_func = *fn(argc: int, argv: const**c::char) int;

export @symbol("SDL_main"         ) fn main(argc: int, argv: const**c::char) int;
export @symbol("SDL_SetMainReady" ) fn SetMainReady() void;
