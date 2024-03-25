use types::c;

export @symbol("SDL_CreateShapedWindow" ) fn CreateShapedWindow(title: const*c::char, x: uint, y: uint, w: uint, h: uint,flags: SDL_WindowFlags) *SDL_Window;
export @symbol("SDL_IsShapedWindow"     ) fn IsShapedWindow(window: const*SDL_Window) SDL_bool;

export type WindowShapeMode = enum {
	ShapeModeDefault, 
	ShapeModeBinarizeAlpha, 
	ShapeModeReverseBinarizeAlpha, 
	ShapeModeColorKey
};

export type SDL_WindowShapeParams = union {
	binarizationCutoff: u8,
	colorKey:           SDL_Color,
};

export type SDL_WindowShapeMode = struct {
	mode:       WindowShapeMode,
	parameters: SDL_WindowShapeParams,
};

export @symbol("SDL_SetWindowShape"      ) fn SetWindowShape(window: *SDL_Window,shape: *SDL_Surface,shape_mode: *SDL_WindowShapeMode) int;
export @symbol("SDL_GetShapedWindowMode" ) fn GetShapedWindowMode(window: *SDL_Window,shape_mode: *SDL_WindowShapeMode) int;
