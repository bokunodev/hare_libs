use types::c;

export type RWops = struct {
	_size: *fn(context: *RWops) i64,
	seek:  *fn(context: *RWops, _offset: i64, whence: int) i64,
	read:  *fn(context: *RWops, ptr: *opaque, _size: size, maxnum: size) size,
	write: *fn(context: *RWops, ptr: const*opaque, _size: size, num: size) size,
	close: *fn(context: *RWops) int,

	_type: u32,
	hidden: union {
		mem: struct {
			base: *u8,
			here: *u8,
			stop: *u8,
		},
		unknown: struct {
			data1: *opaque,
			data2: *opaque,
		},
	},
};

export @symbol("SDL_RWFromFile"     ) fn RWFromFile(file: const*c::char, mode: const*c::char) *RWops;
export @symbol("SDL_RWFromFP"       ) fn RWFromFP(fp: *opaque, autoclose: Bool) *RWops;
export @symbol("SDL_RWFromMem"      ) fn RWFromMem(mem: *opaque, _size: int) *RWops;
export @symbol("SDL_RWFromConstMem" ) fn RWFromConstMem(mem: const*opaque, _size: int) *RWops;
export @symbol("SDL_AllocRW"        ) fn AllocRW() *RWops;
export @symbol("SDL_FreeRW"         ) fn FreeRW(area: *RWops) void;
export @symbol("SDL_RWsize"         ) fn RWsize(context: *RWops) i64;
export @symbol("SDL_RWseek"         ) fn RWseek(context: *RWops, _offset: i64, whence: int) i64;
export @symbol("SDL_RWtell"         ) fn RWtell(context: *RWops) i64;
export @symbol("SDL_RWread"         ) fn RWread(context: *RWops, ptr: *opaque, _size: size, maxnum: size) size;
export @symbol("SDL_RWwrite"        ) fn RWwrite(context: *RWops, ptr: const*opaque, _size: size, num: size) size;
export @symbol("SDL_RWclose"        ) fn RWclose(context: *RWops) int;
export @symbol("SDL_LoadFile_RW"    ) fn LoadFile_RW(src: *RWops, data_size: *size, freesrc: int) *opaque;
export @symbol("SDL_LoadFile"       ) fn LoadFile(file: const*c::char, data_size: *size) *opaque;
export @symbol("SDL_ReadU8"         ) fn ReadU8(src: *RWops) u8;
export @symbol("SDL_ReadLE16"       ) fn ReadLE16(src: *RWops) u16;
export @symbol("SDL_ReadBE16"       ) fn ReadBE16(src: *RWops) u16;
export @symbol("SDL_ReadLE32"       ) fn ReadLE32(src: *RWops) u32;
export @symbol("SDL_ReadBE32"       ) fn ReadBE32(src: *RWops) u32;
export @symbol("SDL_ReadLE64"       ) fn ReadLE64(src: *RWops) u64;
export @symbol("SDL_ReadBE64"       ) fn ReadBE64(src: *RWops) u64;
export @symbol("SDL_WriteU8"        ) fn WriteU8(dst: *RWops, value: u8) size;
export @symbol("SDL_WriteLE16"      ) fn WriteLE16(dst: *RWops, value: u16) size;
export @symbol("SDL_WriteBE16"      ) fn WriteBE16(dst: *RWops, value: u16) size;
export @symbol("SDL_WriteLE32"      ) fn WriteLE32(dst: *RWops, value: u32) size;
export @symbol("SDL_WriteBE32"      ) fn WriteBE32(dst: *RWops, value: u32) size;
export @symbol("SDL_WriteLE64"      ) fn WriteLE64(dst: *RWops, value: u64) size;
export @symbol("SDL_WriteBE64"      ) fn WriteBE64(dst: *RWops, value: u64) size;
