use types::c;

export type MessageBoxFlags = enum {
	MESSAGEBOX_ERROR                 = 0x00000010,
	MESSAGEBOX_WARNING               = 0x00000020,
	MESSAGEBOX_INFORMATION           = 0x00000040,
	MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = 0x00000080,
	MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = 0x00000100,
};

export type MessageBoxButtonFlags = enum {
	MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 0x00000001,
	MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 0x00000002,
};

export type MessageBoxButtonData = struct {
	flags:    MessageBoxButtonFlags,
	buttonid: int,
	text:     const*c::char,
};

export type MessageBoxColor = struct {
	r: u8,
	g: u8,
	b: u8,
};

export type MessageBoxColorType = enum {
	MESSAGEBOX_COLOR_BACKGROUND,
	MESSAGEBOX_COLOR_TEXT,
	MESSAGEBOX_COLOR_BUTTON_BORDER,
	MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
	MESSAGEBOX_COLOR_BUTTON_SELECTED,
	MESSAGEBOX_COLOR_MAX,
};

export type MessageBoxColorScheme = struct {
	colors: [5]MessageBoxColor,
};

export type MessageBoxData = struct {
	flags:       MessageBoxFlags,
	window:      *Window,
	title:       const*c::char,
	message:     const*c::char,
	numbuttons:  int,
	buttons:     const*MessageBoxButtonData,
	colorScheme: const*MessageBoxColorScheme,
};

export @symbol("SDL_ShowMessageBox"       ) fn ShowMessageBox(messageboxdata: const*MessageBoxData, buttonid: *int) int;
export @symbol("SDL_ShowSimpleMessageBox" ) fn ShowSimpleMessageBox(flags: MessageBoxFlags, title: const*c::char, message: const*c::char, window: *Window) int;
