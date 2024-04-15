export type InitFlags = enum {
	INIT_FLAC    = 0x00000001,
	INIT_MOD     = 0x00000002,
	INIT_MP3     = 0x00000008,
	INIT_OGG     = 0x00000010,
	INIT_MID     = 0x00000020,
	INIT_OPUS    = 0x00000040,
	INIT_WAVPACK = 0x00000080
};

export @symbol("Mix_Init") fn Init(flags: InitFlags) int;
export @symbol("Mix_Quit") fn Quit() void;

def AUDIO_U16LSB = 0x0010; // Unsigned 16-bit samples
def AUDIO_S16LSB = 0x8010; //   Signed 16-bit samples

export def AUDIO_U16SYS = AUDIO_U16LSB;
export def AUDIO_S16SYS = AUDIO_S16LSB;

export def CHANNELS            = 8;
export def DEFAULT_FREQUENCY   = 44100;
export def DEFAULT_FORMAT      = AUDIO_S16SYS;
export def DEFAULT_CHANNELS    = 2;

export type Chunk = struct{
	allocated: int,
	abuf:      *u8,
	alen:      u32,
	volume:    u8,
};

export type Fading = enum {
	NO_FADING,
	FADING_OUT,
	FADING_IN
};

export type MusicType = enum {
	MUS_NONE,
	MUS_CMD,
	MUS_WAV,
	MUS_MOD,
	MUS_MID,
	MUS_OGG,
	MUS_MP3,
	MUS_MP3_MAD_UNUSED,
	MUS_FLAC,
	MUS_MODPLUG_UNUSED,
	MUS_OPUS,
	MUS_WAVPACK,
	MUS_GME
};

export type Music = opaque;

export @symbol("Mix_OpenAudio")            fn OpenAudio(frequency: int, format: u16, channels: int, chunksize: int) int;
export @symbol("Mix_OpenAudioDevice")      fn OpenAudioDevice(frequency: int, format: u16, channels: int, chunksize: int,  *char device, allowed_changes: int) int;
export @symbol("Mix_PauseAudio")           fn PauseAudio(pause_on: int) void;
export @symbol("Mix_QuerySpec")            fn QuerySpec(frequency: *int, format: *u16, channels: *int) int;
export @symbol("Mix_AllocateChannels")     fn AllocateChannels(numchans: int) int;
export @symbol("Mix_LoadWAV_RW")           fn LoadWAV_RW(src: *SDL_RWops, freesrc: int) *Chunk;
export @symbol("Mix_LoadWAV")              fn LoadWAV(file: *char) *Chunk;
export @symbol("Mix_LoadMUS")              fn LoadMUS(file: *char) *Music;
export @symbol("Mix_LoadMUS_RW")           fn LoadMUS_RW(src: *SDL_RWops, freesrc: int) *Music;
export @symbol("Mix_LoadMUSType_RW")       fn LoadMUSType_RW(src: *SDL_RWops, _type: MusicType, freesrc: int) *Music;
export @symbol("Mix_QuickLoad_WAV")        fn QuickLoad_WAV(mem: *u8) *Chunk;
export @symbol("Mix_QuickLoad_RAW")        fn QuickLoad_RAW(mem: *u8, _len: u32) *Chunk;
export @symbol("Mix_FreeChunk")            fn FreeChunk(chunk: *Chunk) void;
export @symbol("Mix_FreeMusic")            fn FreeMusic(music: *Music) void;
export @symbol("Mix_GetNumChunkDecoders")  fn GetNumChunkDecoders() int;
export @symbol("Mix_GetChunkDecoder")      fn GetChunkDecoder(index: int) *char;
export @symbol("Mix_HasChunkDecoder")      fn HasChunkDecoder(name: *char) SDL_bool;
export @symbol("Mix_GetNumMusicDecoders")  fn GetNumMusicDecoders() int;
export @symbol("Mix_GetMusicDecoder")      fn GetMusicDecoder(index: int) *char;
export @symbol("Mix_HasMusicDecoder")      fn HasMusicDecoder(name: *char) SDL_bool;
export @symbol("Mix_GetMusicType")         fn GetMusicType(music: *Music) MusicType;
export @symbol("Mix_GetMusicTitle")        fn GetMusicTitle(music: *Music) *char;
export @symbol("Mix_GetMusicTitleTag")     fn GetMusicTitleTag(music: *Music) *char;
export @symbol("Mix_GetMusicArtistTag")    fn GetMusicArtistTag(music: *Music) *char;
export @symbol("Mix_GetMusicAlbumTag")     fn GetMusicAlbumTag(music: *Music) *char;
export @symbol("Mix_GetMusicCopyrightTag") fn GetMusicCopyrightTag(music: *Music) *char;
export @symbol("Mix_SetPostMix")           fn SetPostMix(mix_func: *fn(udata: *opaque, stream: *u8, _len: int) void, arg: *opaque) void;
export @symbol("Mix_HookMusic")            fn HookMusic(mix_func: *fn(udata: *opaque, stream: *u8, _len: int) void, arg: *opaque) void;
export @symbol("Mix_HookMusicFinished")    fn HookMusicFinished(music_finished: *fn() void) void;
export @symbol("Mix_GetMusicHookData")     fn GetMusicHookData() *void;
export @symbol("Mix_ChannelFinished")      fn ChannelFinished(channel_finished: *fn(channel: int) void) void;

export def CHANNEL_POST = -2;

export type EffectFunc_cb = *fn(chan: int, stream: *opaque, _len: int, udata: *opaque) void;
export type EffectDone_cb = *fn(chan: int, udata: *opaque) void;

export @symbol("Mix_RegisterEffect") fn RegisterEffect(chan: int, f: EffectFunc_cb, d: EffectDone_cb, arg: *opaque) int;
export @symbol("Mix_UnregisterEffect") fn UnregisterEffect(channel: int, f: EffectFunc_cb) int;
export @symbol("Mix_UnregisterAllEffects") fn UnregisterAllEffects(channel: int) int;

export def EFFECTSMAXSPEED = "EFFECTSMAXSPEED";

export @symbol("Mix_SetPanning")             fn SetPanning(channel: int, left: u8, right: u8) int;
export @symbol("Mix_SetPosition")            fn SetPosition(channel: int, angle: i16, distance: u8) int;
export @symbol("Mix_SetDistance")            fn SetDistance(channel: int, distance: u8) int;
export @symbol("Mix_SetReverseStereo")       fn SetReverseStereo(channel: int, flip: int) int;
export @symbol("Mix_ReserveChannels")        fn ReserveChannels(num: int) int;
export @symbol("Mix_GroupChannel")           fn GroupChannel(which: int, tag: int) int;
export @symbol("Mix_GroupChannels")          fn GroupChannels(from: int, to: int, tag: int) int;
export @symbol("Mix_GroupAvailable")         fn GroupAvailable(tag: int) int;
export @symbol("Mix_GroupCount")             fn GroupCount(tag: int) int;
export @symbol("Mix_GroupOldest")            fn GroupOldest(tag: int) int;
export @symbol("Mix_GroupNewer")             fn GroupNewer(tag: int) int;
export @symbol("Mix_PlayChannel")            fn PlayChannel(channel: int, chunk: *Chunk, loops: int) int;
export @symbol("Mix_PlayChannelTimed")       fn PlayChannelTimed(channel: int, chunk: *Chunk, loops: int, ticks: int) int;
export @symbol("Mix_PlayMusic")              fn PlayMusic(music: *Music, loops: int) int;
export @symbol("Mix_FadeInMusic")            fn FadeInMusic(music: *Music, loops: int, ms: int) int;
export @symbol("Mix_FadeInMusicPos")         fn FadeInMusicPos(music: *Music, loops: int, ms: int, position: double) int;
export @symbol("Mix_FadeInChannel")          fn FadeInChannel(channel: int, chunk: *Chunk, loops: int, ms: int) int;
export @symbol("Mix_FadeInChannelTimed")     fn FadeInChannelTimed(channel: int, chunk: *Chunk, loops: int, ms: int, ticks: int) int;
export @symbol("Mix_Volume")                 fn Volume(channel: int, volume: int) int;
export @symbol("Mix_VolumeChunk")            fn VolumeChunk(chunk: *Chunk, volume: int) int;
export @symbol("Mix_VolumeMusic")            fn VolumeMusic(volume: int) int;
export @symbol("Mix_GetMusicVolume")         fn GetMusicVolume(music: *Music) int;
export @symbol("Mix_MasterVolume")           fn MasterVolume(volume: int) int;
export @symbol("Mix_HaltChannel")            fn HaltChannel(channel: int) int;
export @symbol("Mix_HaltGroup")              fn HaltGroup(tag: int) int;
export @symbol("Mix_HaltMusic")              fn HaltMusic() int;
export @symbol("Mix_ExpireChannel")          fn ExpireChannel(channel: int, ticks: int) int;
export @symbol("Mix_FadeOutChannel")         fn FadeOutChannel(which: int, ms: int) int;
export @symbol("Mix_FadeOutGroup")           fn FadeOutGroup(tag: int, ms: int) int;
export @symbol("Mix_FadeOutMusic")           fn FadeOutMusic(ms: int) int;
export @symbol("Mix_FadingMusic")            fn FadingMusic() Fading;
export @symbol("Mix_FadingChannel")          fn FadingChannel(which: int) Fading;
export @symbol("Mix_Pause")                  fn Pause(channel: int) void;
export @symbol("Mix_Resume")                 fn Resume(channel: int) void;
export @symbol("Mix_Paused")                 fn Paused(channel: int) int;
export @symbol("Mix_PauseMusic")             fn PauseMusic() void;
export @symbol("Mix_ResumeMusic")            fn ResumeMusic() void;
export @symbol("Mix_RewindMusic")            fn RewindMusic() void;
export @symbol("Mix_PausedMusic")            fn PausedMusic() int;
export @symbol("Mix_ModMusicJumpToOrder")    fn ModMusicJumpToOrder(order: int) int;
export @symbol("Mix_StartTrack")             fn StartTrack(music: *Music, track: int) int;
export @symbol("Mix_GetNumTracks")           fn GetNumTracks(music: *Music) int;
export @symbol("Mix_SetMusicPosition")       fn SetMusicPosition(position: double) int;
export @symbol("Mix_GetMusicPosition")       fn GetMusicPosition(music: *Music) double;
export @symbol("Mix_MusicDuration")          fn MusicDuration(music: *Music) double;
export @symbol("Mix_GetMusicLoopStartTime")  fn GetMusicLoopStartTime(music: *Music) double;
export @symbol("Mix_GetMusicLoopEndTime")    fn GetMusicLoopEndTime(music: *Music) double;
export @symbol("Mix_GetMusicLoopLengthTime") fn GetMusicLoopLengthTime(music: *Music) double;
export @symbol("Mix_Playing")                fn Playing(channel: int) int;
export @symbol("Mix_PlayingMusic")           fn PlayingMusic() int;
export @symbol("Mix_SetMusicCMD")            fn SetMusicCMD(command: *char) int;
export @symbol("Mix_SetSynchroValue")        fn SetSynchroValue(value: int) int;
export @symbol("Mix_GetSynchroValue")        fn GetSynchroValue() int;
export @symbol("Mix_SetSoundFonts")          fn SetSoundFonts(paths: *char) int;
export @symbol("Mix_GetSoundFonts")          fn GetSoundFonts() *char;
export @symbol("Mix_EachSoundFont")          fn EachSoundFont(function: *fn(*char, *opaque) int, data: *opaque)  int;
export @symbol("Mix_SetTimidityCfg")         fn SetTimidityCfg(path: *char) int;
export @symbol("Mix_GetTimidityCfg")         fn GetTimidityCfg() *char;
export @symbol("Mix_GetChunk")               fn GetChunk(channel: int) *Chunk;
export @symbol("Mix_CloseAudio")             fn CloseAudio() void;
