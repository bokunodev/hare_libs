export type SDL_InitFlags = u32;

export def SDL_INIT_TIMER: SDL_InitFlags          = 0x00000001u;
export def SDL_INIT_AUDIO: SDL_InitFlags          = 0x00000010u;
export def SDL_INIT_VIDEO: SDL_InitFlags          = 0x00000020u;
export def SDL_INIT_JOYSTICK: SDL_InitFlags       = 0x00000200u;
export def SDL_INIT_HAPTIC: SDL_InitFlags         = 0x00001000u;
export def SDL_INIT_GAMECONTROLLER: SDL_InitFlags = 0x00002000u;
export def SDL_INIT_EVENTS: SDL_InitFlags         = 0x00004000u;
export def SDL_INIT_SENSOR: SDL_InitFlags         = 0x00008000u;
export def SDL_INIT_NOPARACHUTE: SDL_InitFlags    = 0x00100000u;
export def SDL_INIT_EVERYTHING: SDL_InitFlags     = (
		SDL_INIT_TIMER    | SDL_INIT_AUDIO  | SDL_INIT_VIDEO          | SDL_INIT_EVENTS |
		SDL_INIT_JOYSTICK | SDL_INIT_HAPTIC | SDL_INIT_GAMECONTROLLER | SDL_INIT_SENSOR 
	);


export @symbol("SDL_Init"          ) fn Init(flags: SDL_InitFlags) int;
export @symbol("SDL_InitSubSystem" ) fn InitSubSystem(flags: SDL_InitFlags) int;
export @symbol("SDL_QuitSubSystem" ) fn QuitSubSystem(flags: SDL_InitFlags) void;
export @symbol("SDL_WasInit"       ) fn WasInit(flags: SDL_InitFlags) u32;
export @symbol("SDL_Quit"          ) fn Quit() void;
