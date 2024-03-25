
export type SDL_MetalView = *opaque;

export @symbol("SDL_Metal_CreateView"      ) fn Metal_CreateView(window: *SDL_Window) SDL_MetalView;
export @symbol("SDL_Metal_DestroyView"     ) fn Metal_DestroyView(view: SDL_MetalView) void;
export @symbol("SDL_Metal_GetLayer"        ) fn Metal_GetLayer(view: SDL_MetalView) *opaque;
export @symbol("SDL_Metal_GetDrawableSize" ) fn Metal_GetDrawableSize(window: *SDL_Window, w: *int, h: *int) void;
