use types::c;

export type SDL_PixelType = enum {
	SDL_PIXELTYPE_UNKNOWN,
	SDL_PIXELTYPE_INDEX1,
	SDL_PIXELTYPE_INDEX4,
	SDL_PIXELTYPE_INDEX8,
	SDL_PIXELTYPE_PACKED8,
	SDL_PIXELTYPE_PACKED16,
	SDL_PIXELTYPE_PACKED32,
	SDL_PIXELTYPE_ARRAYU8,
	SDL_PIXELTYPE_ARRAYU16,
	SDL_PIXELTYPE_ARRAYU32,
	SDL_PIXELTYPE_ARRAYF16,
	SDL_PIXELTYPE_ARRAYF32,
	SDL_PIXELTYPE_INDEX2,
};

export type SDL_BitmapOrder = enum {
	SDL_BITMAPORDER_NONE,
	SDL_BITMAPORDER_4321,
	SDL_BITMAPORDER_1234,
};

export type SDL_PackedOrder = enum {
	SDL_PACKEDORDER_NONE,
	SDL_PACKEDORDER_XRGB,
	SDL_PACKEDORDER_RGBX,
	SDL_PACKEDORDER_ARGB,
	SDL_PACKEDORDER_RGBA,
	SDL_PACKEDORDER_XBGR,
	SDL_PACKEDORDER_BGRX,
	SDL_PACKEDORDER_ABGR,
	SDL_PACKEDORDER_BGRA
};

export type SDL_ArrayOrder = enum {
	SDL_ARRAYORDER_NONE,
	SDL_ARRAYORDER_RGB,
	SDL_ARRAYORDER_RGBA,
	SDL_ARRAYORDER_ARGB,
	SDL_ARRAYORDER_BGR,
	SDL_ARRAYORDER_BGRA,
	SDL_ARRAYORDER_ABGR
};

export type SDL_PackedLayout = enum {
	SDL_PACKEDLAYOUT_NONE,
	SDL_PACKEDLAYOUT_332,
	SDL_PACKEDLAYOUT_4444,
	SDL_PACKEDLAYOUT_1555,
	SDL_PACKEDLAYOUT_5551,
	SDL_PACKEDLAYOUT_565,
	SDL_PACKEDLAYOUT_8888,
	SDL_PACKEDLAYOUT_2101010,
	SDL_PACKEDLAYOUT_1010102,
};

type pxt = SDL_PixelType;
type pkl = SDL_PackedLayout;
type bmo = SDL_BitmapOrder;
type pko = SDL_PackedOrder;

// TODO: replace all bit shifts with values in enum initialization, due to bug [https://todo.sr.ht/~sircmpwn/hare/771]
export type SDL_PixelFormatEnum = enum {
	SDL_PIXELFORMAT_UNKNOWN =      0,
	SDL_PIXELFORMAT_INDEX1LSB =    286261504,
	SDL_PIXELFORMAT_INDEX1MSB =    287310080,
	SDL_PIXELFORMAT_INDEX2LSB =    470811136,
	SDL_PIXELFORMAT_INDEX2MSB =    471859712,
	SDL_PIXELFORMAT_INDEX4LSB =    303039488,
	SDL_PIXELFORMAT_INDEX4MSB =    304088064,
	SDL_PIXELFORMAT_INDEX8 =       318769153,
	SDL_PIXELFORMAT_RGB332 =       336660481,
	SDL_PIXELFORMAT_XRGB4444 =     353504258,
	SDL_PIXELFORMAT_RGB444 =       353504258,
	SDL_PIXELFORMAT_XBGR4444 =     357698562,
	SDL_PIXELFORMAT_BGR444 =       357698562,
	SDL_PIXELFORMAT_XRGB1555 =     353570562,
	SDL_PIXELFORMAT_RGB555 =       353570562,
	SDL_PIXELFORMAT_XBGR1555 =     357764866,
	SDL_PIXELFORMAT_BGR555 =       357764866,
	SDL_PIXELFORMAT_ARGB4444 =     355602434,
	SDL_PIXELFORMAT_RGBA4444 =     356651010,
	SDL_PIXELFORMAT_ABGR4444 =     359796738,
	SDL_PIXELFORMAT_BGRA4444 =     360845314,
	SDL_PIXELFORMAT_ARGB1555 =     355667970,
	SDL_PIXELFORMAT_RGBA5551 =     356782082,
	SDL_PIXELFORMAT_ABGR1555 =     359862274,
	SDL_PIXELFORMAT_BGRA5551 =     360976386,
	SDL_PIXELFORMAT_RGB565 =       353701890,
	SDL_PIXELFORMAT_BGR565 =       357896194,
	SDL_PIXELFORMAT_RGB24 =        386930691,
	SDL_PIXELFORMAT_BGR24 =        390076419,
	SDL_PIXELFORMAT_XRGB8888 =     370546692,
	SDL_PIXELFORMAT_RGB888 =       370546692,
	SDL_PIXELFORMAT_RGBX8888 =     371595268,
	SDL_PIXELFORMAT_XBGR8888 =     374740996,
	SDL_PIXELFORMAT_BGR888 =       374740996,
	SDL_PIXELFORMAT_BGRX8888 =     375789572,
	SDL_PIXELFORMAT_ARGB8888 =     372645892,
	SDL_PIXELFORMAT_RGBA8888 =     373694468,
	SDL_PIXELFORMAT_ABGR8888 =     376840196,
	SDL_PIXELFORMAT_BGRA8888 =     377888772,
	SDL_PIXELFORMAT_ARGB2101010 =  372711428,
	SDL_PIXELFORMAT_RGBA32 =       376840196,
	SDL_PIXELFORMAT_ARGB32 =       377888772,
	SDL_PIXELFORMAT_BGRA32 =       372645892,
	SDL_PIXELFORMAT_ABGR32 =       373694468,
	SDL_PIXELFORMAT_RGBX32 =       374740996,
	SDL_PIXELFORMAT_XRGB32 =       375789572,
	SDL_PIXELFORMAT_BGRX32 =       370546692,
	SDL_PIXELFORMAT_XBGR32 =       371595268,
	SDL_PIXELFORMAT_YV12 =         842094169,
	SDL_PIXELFORMAT_IYUV =         1448433993,
	SDL_PIXELFORMAT_YUY2 =         844715353,
	SDL_PIXELFORMAT_UYVY =         1498831189,
	SDL_PIXELFORMAT_YVYU =         1431918169,
	SDL_PIXELFORMAT_NV12 =         842094158,
	SDL_PIXELFORMAT_NV21 =         825382478,
	SDL_PIXELFORMAT_EXTERNAL_OES = 542328143,
};

export type SDL_Color = struct {
	r: u8,
	g: u8,
	b: u8,
	a: u8,
};

export type SDL_Palette = struct {
	ncolors:  int,
	colors:   *SDL_Color,
	version:  u32,
	refcount: int,
};

export type SDL_PixelFormat = struct {
	format:        u32,
	palette:       *SDL_Palette,
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
	next:          *SDL_PixelFormat,
};

export @symbol("SDL_GetPixelFormatName"     ) fn GetPixelFormatName(format: u32) const*c::char;
export @symbol("SDL_PixelFormatEnumToMasks" ) fn PixelFormatEnumToMasks(format: u32, bpp: *int, Rmask: *u32, Gmask: *u32, Bmask: *u32, Amask: *u32) SDL_bool;
export @symbol("SDL_MasksToPixelFormatEnum" ) fn MasksToPixelFormatEnum(bpp: int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) u32;
export @symbol("SDL_AllocFormat"            ) fn AllocFormat(pixel_format: u32) *SDL_PixelFormat;
export @symbol("SDL_FreeFormat"             ) fn FreeFormat(format: *SDL_PixelFormat) void;
export @symbol("SDL_AllocPalette"           ) fn AllocPalette(ncolors: int) *SDL_Palette;
export @symbol("SDL_SetPixelFormatPalette"  ) fn SetPixelFormatPalette(format: *SDL_PixelFormat, palette: *SDL_Palette) int;
export @symbol("SDL_SetPaletteColors"       ) fn SetPaletteColors(palette: *SDL_Palette, colors: const*SDL_Color, firstcolor: int, ncolors: int) int;
export @symbol("SDL_FreePalette"            ) fn FreePalette(palette: *SDL_Palette) void;
export @symbol("SDL_MapRGB"                 ) fn MapRGB(format: const*SDL_PixelFormat, r: u8, g: u8, b: u8) u32;
export @symbol("SDL_MapRGBA"                ) fn MapRGBA(format: const*SDL_PixelFormat, r: u8, g: u8, b: u8, a: u8) u32;
export @symbol("SDL_GetRGB"                 ) fn GetRGB(pixel: u32, format: const*SDL_PixelFormat, r: *u8, g: *u8, b: *u8) void;
export @symbol("SDL_GetRGBA"                ) fn GetRGBA(pixel: u32, format: const*SDL_PixelFormat, r: *u8, g: *u8, b: *u8, a: *u8) void;
export @symbol("SDL_CalculateGammaRamp"     ) fn CalculateGammaRamp(gamma: f32, ramp: *u16) void;
