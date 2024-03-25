use types::c;

export type SDL_Haptic = opaque;

export type SDL_HapticDirection = struct {
	_type: u8 ,
	dir:   [3]i32,
};

export type SDL_HapticConstant = struct {
	_type:         u16,
	direction:     SDL_HapticDirection,
	length:        u32,
	delay:         u16,
	button:        u16,
	interval:      u16,
	level:         i16,
	attack_length: u16,
	attack_level:  u16,
	fade_length:   u16,
	fade_level:    u16,
};

export type SDL_HapticPeriodic = struct {
	_type:         u16,
	direction:     SDL_HapticDirection,
	length:        u32,
	delay:         u16,
	button:        u16,
	interval:      u16,
	period:        u16,
	magnitude:     i16,
	_offset:       i16,
	phase:         u16,
	attack_length: u16,
	attack_level:  u16,
	fade_length:   u16,
	fade_level:    u16,
};

export type SDL_HapticCondition = struct {
	_type:       u16,
	direction:   SDL_HapticDirection,
	length:      u32,
	delay:       u16,
	button:      u16,
	interval:    u16,
	right_sat:   [3]u16,
	left_sat:    [3]u16,
	right_coeff: [3]i16,
	left_coeff:  [3]i16,
	deadband:    [3]u16,
	center:      [3]i16,
};

export type SDL_HapticRamp = struct {
	_type:         u16,
	direction:     SDL_HapticDirection,
	length:        u32,
	delay:         u16,
	button:        u16,
	interval:      u16,
	start:         i16,
	end:           i16,
	attack_length: u16,
	attack_level:  u16,
	fade_length:   u16,
	fade_level:    u16,
};

export type SDL_HapticLeftRight = struct {
	_type:           u16,
	length:          u32,
	large_magnitude: u16,
	small_magnitude: u16,
};

export type SDL_HapticCustom = struct {
	_type:         u16,
	direction:     SDL_HapticDirection,
	length:        u32,
	delay:         u16,
	button:        u16,
	interval:      u16,
	channels:      u8,
	period:        u16,
	samples:       u16,
	data:          *u16,
	attack_length: u16,
	attack_level:  u16,
	fade_length:   u16,
	fade_level:    u16,
};

export type SDL_HapticEffect = union {
	_type:     u16,
	constant:  SDL_HapticConstant,
	periodic:  SDL_HapticPeriodic,
	condition: SDL_HapticCondition,
	ramp:      SDL_HapticRamp,
	leftright: SDL_HapticLeftRight,
	custom:    SDL_HapticCustom,
};

export @symbol("SDL_NumHaptics"              ) fn NumHaptics() int;
export @symbol("SDL_HapticName"              ) fn HapticName(device_index: int) const*c::char;
export @symbol("SDL_HapticOpen"              ) fn HapticOpen(device_index: int) *SDL_Haptic;
export @symbol("SDL_HapticOpened"            ) fn HapticOpened(device_index: int) int;
export @symbol("SDL_HapticIndex"             ) fn HapticIndex(haptic: *SDL_Haptic) int;
export @symbol("SDL_MouseIsHaptic"           ) fn MouseIsHaptic() int;
export @symbol("SDL_HapticOpenFromMouse"     ) fn HapticOpenFromMouse() *SDL_Haptic;
export @symbol("SDL_JoystickIsHaptic"        ) fn JoystickIsHaptic(joystick: *SDL_Joystick) int;
export @symbol("SDL_HapticOpenFromJoystick"  ) fn HapticOpenFromJoystick(joystick: *SDL_Joystick) *SDL_Haptic;
export @symbol("SDL_HapticClose"             ) fn HapticClose(haptic: *SDL_Haptic) void;
export @symbol("SDL_HapticNumEffects"        ) fn HapticNumEffects(haptic: *SDL_Haptic) int;
export @symbol("SDL_HapticNumEffectsPlaying" ) fn HapticNumEffectsPlaying(haptic: *SDL_Haptic) int;
export @symbol("SDL_HapticQuery"             ) fn HapticQuery(haptic: *SDL_Haptic) uint;
export @symbol("SDL_HapticNumAxes"           ) fn HapticNumAxes(haptic: *SDL_Haptic) int;
export @symbol("SDL_HapticEffectSupported"   ) fn HapticEffectSupported(haptic: *SDL_Haptic, effect: *SDL_HapticEffect) int;
export @symbol("SDL_HapticNewEffect"         ) fn HapticNewEffect(haptic: *SDL_Haptic, effect: *SDL_HapticEffect) int;
export @symbol("SDL_HapticUpdateEffect"      ) fn HapticUpdateEffect(haptic: *SDL_Haptic, effect: int, data: *SDL_HapticEffect) int;
export @symbol("SDL_HapticRunEffect"         ) fn HapticRunEffect(haptic: *SDL_Haptic, effect: int, iterations: u32) int;
export @symbol("SDL_HapticStopEffect"        ) fn HapticStopEffect(haptic: *SDL_Haptic, effect: int) int;
export @symbol("SDL_HapticDestroyEffect"     ) fn HapticDestroyEffect(haptic: *SDL_Haptic, effect: int) void;
export @symbol("SDL_HapticGetEffectStatus"   ) fn HapticGetEffectStatus(haptic: *SDL_Haptic, effect: int) int;
export @symbol("SDL_HapticSetGain"           ) fn HapticSetGain(haptic: *SDL_Haptic, gain: int) int;
export @symbol("SDL_HapticSetAutocenter"     ) fn HapticSetAutocenter(haptic: *SDL_Haptic, autocenter: int) int;
export @symbol("SDL_HapticPause"             ) fn HapticPause(haptic: *SDL_Haptic) int;
export @symbol("SDL_HapticUnpause"           ) fn HapticUnpause(haptic: *SDL_Haptic) int;
export @symbol("SDL_HapticStopAll"           ) fn HapticStopAll(haptic: *SDL_Haptic) int;
export @symbol("SDL_HapticRumbleSupported"   ) fn HapticRumbleSupported(haptic: *SDL_Haptic) int;
export @symbol("SDL_HapticRumbleInit"        ) fn HapticRumbleInit(haptic: *SDL_Haptic) int;
export @symbol("SDL_HapticRumblePlay"        ) fn HapticRumblePlay(haptic: *SDL_Haptic, strength: f32, length: u32) int;
export @symbol("SDL_HapticRumbleStop"        ) fn HapticRumbleStop(haptic: *SDL_Haptic) int;
