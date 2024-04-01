use types::c;

export type PixelType = enum {
	PIXELTYPE_UNKNOWN,
	PIXELTYPE_INDEX1,
	PIXELTYPE_INDEX4,
	PIXELTYPE_INDEX8,
	PIXELTYPE_PACKED8,
	PIXELTYPE_PACKED16,
	PIXELTYPE_PACKED32,
	PIXELTYPE_ARRAYU8,
	PIXELTYPE_ARRAYU16,
	PIXELTYPE_ARRAYU32,
	PIXELTYPE_ARRAYF16,
	PIXELTYPE_ARRAYF32,
	PIXELTYPE_INDEX2,
};

export type BitmapOrder = enum {
	BITMAPORDER_NONE,
	BITMAPORDER_4321,
	BITMAPORDER_1234,
};

export type PackedOrder = enum {
	PACKEDORDER_NONE,
	PACKEDORDER_XRGB,
	PACKEDORDER_RGBX,
	PACKEDORDER_ARGB,
	PACKEDORDER_RGBA,
	PACKEDORDER_XBGR,
	PACKEDORDER_BGRX,
	PACKEDORDER_ABGR,
	PACKEDORDER_BGRA
};

export type ArrayOrder = enum {
	ARRAYORDER_NONE,
	ARRAYORDER_RGB,
	ARRAYORDER_RGBA,
	ARRAYORDER_ARGB,
	ARRAYORDER_BGR,
	ARRAYORDER_BGRA,
	ARRAYORDER_ABGR
};

export type PackedLayout = enum {
	PACKEDLAYOUT_NONE,
	PACKEDLAYOUT_332,
	PACKEDLAYOUT_4444,
	PACKEDLAYOUT_1555,
	PACKEDLAYOUT_5551,
	PACKEDLAYOUT_565,
	PACKEDLAYOUT_8888,
	PACKEDLAYOUT_2101010,
	PACKEDLAYOUT_1010102,
};

type pxt = PixelType;
type pkl = PackedLayout;
type bmo = BitmapOrder;
type pko = PackedOrder;

// TODO: replace all bit shifts with values in enum initialization, due to bug [https://todo.sr.ht/~sircmpwn/hare/771]
export type PixelFormatEnum = enum {
	PIXELFORMAT_UNKNOWN =      0,
	PIXELFORMAT_INDEX1LSB =    286261504,
	PIXELFORMAT_INDEX1MSB =    287310080,
	PIXELFORMAT_INDEX2LSB =    470811136,
	PIXELFORMAT_INDEX2MSB =    471859712,
	PIXELFORMAT_INDEX4LSB =    303039488,
	PIXELFORMAT_INDEX4MSB =    304088064,
	PIXELFORMAT_INDEX8 =       318769153,
	PIXELFORMAT_RGB332 =       336660481,
	PIXELFORMAT_XRGB4444 =     353504258,
	PIXELFORMAT_RGB444 =       353504258,
	PIXELFORMAT_XBGR4444 =     357698562,
	PIXELFORMAT_BGR444 =       357698562,
	PIXELFORMAT_XRGB1555 =     353570562,
	PIXELFORMAT_RGB555 =       353570562,
	PIXELFORMAT_XBGR1555 =     357764866,
	PIXELFORMAT_BGR555 =       357764866,
	PIXELFORMAT_ARGB4444 =     355602434,
	PIXELFORMAT_RGBA4444 =     356651010,
	PIXELFORMAT_ABGR4444 =     359796738,
	PIXELFORMAT_BGRA4444 =     360845314,
	PIXELFORMAT_ARGB1555 =     355667970,
	PIXELFORMAT_RGBA5551 =     356782082,
	PIXELFORMAT_ABGR1555 =     359862274,
	PIXELFORMAT_BGRA5551 =     360976386,
	PIXELFORMAT_RGB565 =       353701890,
	PIXELFORMAT_BGR565 =       357896194,
	PIXELFORMAT_RGB24 =        386930691,
	PIXELFORMAT_BGR24 =        390076419,
	PIXELFORMAT_XRGB8888 =     370546692,
	PIXELFORMAT_RGB888 =       370546692,
	PIXELFORMAT_RGBX8888 =     371595268,
	PIXELFORMAT_XBGR8888 =     374740996,
	PIXELFORMAT_BGR888 =       374740996,
	PIXELFORMAT_BGRX8888 =     375789572,
	PIXELFORMAT_ARGB8888 =     372645892,
	PIXELFORMAT_RGBA8888 =     373694468,
	PIXELFORMAT_ABGR8888 =     376840196,
	PIXELFORMAT_BGRA8888 =     377888772,
	PIXELFORMAT_ARGB2101010 =  372711428,
	PIXELFORMAT_RGBA32 =       376840196,
	PIXELFORMAT_ARGB32 =       377888772,
	PIXELFORMAT_BGRA32 =       372645892,
	PIXELFORMAT_ABGR32 =       373694468,
	PIXELFORMAT_RGBX32 =       374740996,
	PIXELFORMAT_XRGB32 =       375789572,
	PIXELFORMAT_BGRX32 =       370546692,
	PIXELFORMAT_XBGR32 =       371595268,
	PIXELFORMAT_YV12 =         842094169,
	PIXELFORMAT_IYUV =         1448433993,
	PIXELFORMAT_YUY2 =         844715353,
	PIXELFORMAT_UYVY =         1498831189,
	PIXELFORMAT_YVYU =         1431918169,
	PIXELFORMAT_NV12 =         842094158,
	PIXELFORMAT_NV21 =         825382478,
	PIXELFORMAT_EXTERNAL_OES = 542328143,
};

export type Color = struct {
	r: u8,
	g: u8,
	b: u8,
	a: u8,
};

export type Palette = struct {
	ncolors:  int,
	colors:   *Color,
	version:  u32,
	refcount: int,
};

export type PixelFormat = struct {
	format:        u32,
	palette:       *Palette,
	BitsPerPixel:  u8,
	BytesPerPixel: u8,
	padding:       [2]u8,
	Rmask:         u32,
	Gmask:         u32,
	Bmask:         u32,
	Amask:         u32,
	Rloss:         u8,
	Gloss:         u8,
	Bloss:         u8,
	Aloss:         u8,
	Rshift:        u8,
	Gshift:        u8,
	Bshift:        u8,
	Ashift:        u8,
	refcount:      int,
	next:          *PixelFormat,
};

export @symbol("SDL_GetPixelFormatName"     ) fn GetPixelFormatName(format: u32) const*c::char;
export @symbol("SDL_PixelFormatEnumToMasks" ) fn PixelFormatEnumToMasks(format: u32, bpp: *int, Rmask: *u32, Gmask: *u32, Bmask: *u32, Amask: *u32) Bool;
export @symbol("SDL_MasksToPixelFormatEnum" ) fn MasksToPixelFormatEnum(bpp: int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) u32;
export @symbol("SDL_AllocFormat"            ) fn AllocFormat(pixel_format: u32) *PixelFormat;
export @symbol("SDL_FreeFormat"             ) fn FreeFormat(format: *PixelFormat) void;
export @symbol("SDL_AllocPalette"           ) fn AllocPalette(ncolors: int) *Palette;
export @symbol("SDL_SetPixelFormatPalette"  ) fn SetPixelFormatPalette(format: *PixelFormat, palette: *Palette) int;
export @symbol("SDL_SetPaletteColors"       ) fn SetPaletteColors(palette: *Palette, colors: const*Color, firstcolor: int, ncolors: int) int;
export @symbol("SDL_FreePalette"            ) fn FreePalette(palette: *Palette) void;
export @symbol("SDL_MapRGB"                 ) fn MapRGB(format: const*PixelFormat, r: u8, g: u8, b: u8) u32;
export @symbol("SDL_MapRGBA"                ) fn MapRGBA(format: const*PixelFormat, r: u8, g: u8, b: u8, a: u8) u32;
export @symbol("SDL_GetRGB"                 ) fn GetRGB(pixel: u32, format: const*PixelFormat, r: *u8, g: *u8, b: *u8) void;
export @symbol("SDL_GetRGBA"                ) fn GetRGBA(pixel: u32, format: const*PixelFormat, r: *u8, g: *u8, b: *u8, a: *u8) void;
export @symbol("SDL_CalculateGammaRamp"     ) fn CalculateGammaRamp(gamma: f32, ramp: *u16) void;
