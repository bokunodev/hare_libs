use types::c;

export type SDL_MessageBoxFlags = enum {
	SDL_MESSAGEBOX_ERROR                 = 0x00000010,
	SDL_MESSAGEBOX_WARNING               = 0x00000020,
	SDL_MESSAGEBOX_INFORMATION           = 0x00000040,
	SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = 0x00000080,
	SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = 0x00000100,
};

export type SDL_MessageBoxButtonFlags = enum {
	SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 0x00000001,
	SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 0x00000002,
};

export type SDL_MessageBoxButtonData = struct {
	flags:    SDL_MessageBoxButtonFlags,
	buttonid: int,
	text:     const*c::char,
};

export type SDL_MessageBoxColor = struct {
	r: u8,
	g: u8,
	b: u8,
};

export type SDL_MessageBoxColorType = enum {
	SDL_MESSAGEBOX_COLOR_BACKGROUND,
	SDL_MESSAGEBOX_COLOR_TEXT,
	SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
	SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
	SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
	SDL_MESSAGEBOX_COLOR_MAX,
};

export type SDL_MessageBoxColorScheme = struct {
	colors: [5]SDL_MessageBoxColor,
};

export type SDL_MessageBoxData = struct {
	flags:       SDL_MessageBoxFlags,
	window:      *SDL_Window,
	title:       const*c::char,
	message:     const*c::char,
	numbuttons:  int,
	buttons:     const*SDL_MessageBoxButtonData,
	colorScheme: const*SDL_MessageBoxColorScheme,
};

export @symbol("SDL_ShowMessageBox"       ) fn ShowMessageBox(messageboxdata: const*SDL_MessageBoxData, buttonid: *int) int;
export @symbol("SDL_ShowSimpleMessageBox" ) fn ShowSimpleMessageBox(flags: SDL_MessageBoxFlags, title: const*c::char, message: const*c::char, window: *SDL_Window) int;
