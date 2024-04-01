
export type MetalView = *opaque;

export @symbol("SDL_Metal_CreateView"      ) fn Metal_CreateView(window: *Window) MetalView;
export @symbol("SDL_Metal_DestroyView"     ) fn Metal_DestroyView(view: MetalView) void;
export @symbol("SDL_Metal_GetLayer"        ) fn Metal_GetLayer(view: MetalView) *opaque;
export @symbol("SDL_Metal_GetDrawableSize" ) fn Metal_GetDrawableSize(window: *Window, w: *int, h: *int) void;
