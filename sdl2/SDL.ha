export type InitFlags = u32;

export def INIT_TIMER: InitFlags          = 0x00000001u;
export def INIT_AUDIO: InitFlags          = 0x00000010u;
export def INIT_VIDEO: InitFlags          = 0x00000020u;
export def INIT_JOYSTICK: InitFlags       = 0x00000200u;
export def INIT_HAPTIC: InitFlags         = 0x00001000u;
export def INIT_GAMECONTROLLER: InitFlags = 0x00002000u;
export def INIT_EVENTS: InitFlags         = 0x00004000u;
export def INIT_SENSOR: InitFlags         = 0x00008000u;
export def INIT_NOPARACHUTE: InitFlags    = 0x00100000u;
export def INIT_EVERYTHING: InitFlags     = (
		INIT_TIMER    | INIT_AUDIO  | INIT_VIDEO          | INIT_EVENTS |
		INIT_JOYSTICK | INIT_HAPTIC | INIT_GAMECONTROLLER | INIT_SENSOR 
	);

export @symbol("SDL_Init"          ) fn Init(flags: InitFlags) int;
export @symbol("SDL_InitSubSystem" ) fn InitSubSystem(flags: InitFlags) int;
export @symbol("SDL_QuitSubSystem" ) fn QuitSubSystem(flags: InitFlags) void;
export @symbol("SDL_WasInit"       ) fn WasInit(flags: InitFlags) u32;
export @symbol("SDL_Quit"          ) fn Quit() void;
