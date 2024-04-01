use types::c;

export @symbol("SDL_CreateShapedWindow" ) fn CreateShapedWindow(title: const*c::char, x: uint, y: uint, w: uint, h: uint,flags: WindowFlags) *Window;
export @symbol("SDL_IsShapedWindow"     ) fn IsShapedWindow(window: const*Window) Bool;

export type WindowShapeMode = enum {
	ShapeModeDefault, 
	ShapeModeBinarizeAlpha, 
	ShapeModeReverseBinarizeAlpha, 
	ShapeModeColorKey
};

export type WindowShapeParams = union {
	binarizationCutoff: u8,
	colorKey:           Color,
};

export type WindowShape = struct {
	mode:       WindowShapeMode,
	parameters: WindowShapeParams,
};

export @symbol("SDL_SetWindowShape"      ) fn SetWindowShape(window: *Window, shape: *Surface, shape_mode: *WindowShape) int;
export @symbol("SDL_GetShapedWindowMode" ) fn GetShapedWindowMode(window: *Window, shape_mode: *WindowShape) int;
