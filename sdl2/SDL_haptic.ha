use types::c;

export type Haptic = opaque;

export type HapticDirection = struct {
	_type: u8 ,
	dir:   [3]i32,
};

export type HapticConstant = struct {
	_type:         u16,
	direction:     HapticDirection,
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

export type HapticPeriodic = struct {
	_type:         u16,
	direction:     HapticDirection,
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

export type HapticCondition = struct {
	_type:       u16,
	direction:   HapticDirection,
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

export type HapticRamp = struct {
	_type:         u16,
	direction:     HapticDirection,
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

export type HapticLeftRight = struct {
	_type:           u16,
	length:          u32,
	large_magnitude: u16,
	small_magnitude: u16,
};

export type HapticCustom = struct {
	_type:         u16,
	direction:     HapticDirection,
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

export type HapticEffect = union {
	_type:     u16,
	constant:  HapticConstant,
	periodic:  HapticPeriodic,
	condition: HapticCondition,
	ramp:      HapticRamp,
	leftright: HapticLeftRight,
	custom:    HapticCustom,
};

export @symbol("SDL_NumHaptics"              ) fn NumHaptics() int;
export @symbol("SDL_HapticName"              ) fn HapticName(device_index: int) const*c::char;
export @symbol("SDL_HapticOpen"              ) fn HapticOpen(device_index: int) *Haptic;
export @symbol("SDL_HapticOpened"            ) fn HapticOpened(device_index: int) int;
export @symbol("SDL_HapticIndex"             ) fn HapticIndex(haptic: *Haptic) int;
export @symbol("SDL_MouseIsHaptic"           ) fn MouseIsHaptic() int;
export @symbol("SDL_HapticOpenFromMouse"     ) fn HapticOpenFromMouse() *Haptic;
export @symbol("SDL_JoystickIsHaptic"        ) fn JoystickIsHaptic(joystick: *Joystick) int;
export @symbol("SDL_HapticOpenFromJoystick"  ) fn HapticOpenFromJoystick(joystick: *Joystick) *Haptic;
export @symbol("SDL_HapticClose"             ) fn HapticClose(haptic: *Haptic) void;
export @symbol("SDL_HapticNumEffects"        ) fn HapticNumEffects(haptic: *Haptic) int;
export @symbol("SDL_HapticNumEffectsPlaying" ) fn HapticNumEffectsPlaying(haptic: *Haptic) int;
export @symbol("SDL_HapticQuery"             ) fn HapticQuery(haptic: *Haptic) uint;
export @symbol("SDL_HapticNumAxes"           ) fn HapticNumAxes(haptic: *Haptic) int;
export @symbol("SDL_HapticEffectSupported"   ) fn HapticEffectSupported(haptic: *Haptic, effect: *HapticEffect) int;
export @symbol("SDL_HapticNewEffect"         ) fn HapticNewEffect(haptic: *Haptic, effect: *HapticEffect) int;
export @symbol("SDL_HapticUpdateEffect"      ) fn HapticUpdateEffect(haptic: *Haptic, effect: int, data: *HapticEffect) int;
export @symbol("SDL_HapticRunEffect"         ) fn HapticRunEffect(haptic: *Haptic, effect: int, iterations: u32) int;
export @symbol("SDL_HapticStopEffect"        ) fn HapticStopEffect(haptic: *Haptic, effect: int) int;
export @symbol("SDL_HapticDestroyEffect"     ) fn HapticDestroyEffect(haptic: *Haptic, effect: int) void;
export @symbol("SDL_HapticGetEffectStatus"   ) fn HapticGetEffectStatus(haptic: *Haptic, effect: int) int;
export @symbol("SDL_HapticSetGain"           ) fn HapticSetGain(haptic: *Haptic, gain: int) int;
export @symbol("SDL_HapticSetAutocenter"     ) fn HapticSetAutocenter(haptic: *Haptic, autocenter: int) int;
export @symbol("SDL_HapticPause"             ) fn HapticPause(haptic: *Haptic) int;
export @symbol("SDL_HapticUnpause"           ) fn HapticUnpause(haptic: *Haptic) int;
export @symbol("SDL_HapticStopAll"           ) fn HapticStopAll(haptic: *Haptic) int;
export @symbol("SDL_HapticRumbleSupported"   ) fn HapticRumbleSupported(haptic: *Haptic) int;
export @symbol("SDL_HapticRumbleInit"        ) fn HapticRumbleInit(haptic: *Haptic) int;
export @symbol("SDL_HapticRumblePlay"        ) fn HapticRumblePlay(haptic: *Haptic, strength: f32, length: u32) int;
export @symbol("SDL_HapticRumbleStop"        ) fn HapticRumbleStop(haptic: *Haptic) int;
