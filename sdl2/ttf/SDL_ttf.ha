use sdl2;
use types::c;

export @symbol("TTF_GetFreeTypeVersion") GetFreeTypeVersion(major: *int, minor: *int, patch: *int) void;
export @symbol("TTF_GetHarfBuzzVersion") GetHarfBuzzVersion(major: *int, minor: *int, patch: *int) void;

export def UNICODE_BOM_NATIVE  = 0xFEFF;
export def UNICODE_BOM_SWAPPED = 0xFFFE;

export @symbol("TTF_ByteSwappedUNICODE") ByteSwappedUNICODE(swapped: sdl2::Bool) void;

export type Font = opaque;

export @symbol("TTF_Init")               Init() int;
export @symbol("TTF_OpenFont")           OpenFont(file: *c::char, ptsize: int) *Font;
export @symbol("TTF_OpenFontIndex")      OpenFontIndex(file: *c::char, ptsize: int, index: i64) *Font;
export @symbol("TTF_OpenFontRW")         OpenFontRW(src: *sdl2::RWops, freesrc: int, ptsize: int) *Font;
export @symbol("TTF_OpenFontIndexRW")    OpenFontIndexRW(src: *sdl2::RWops, freesrc: int, ptsize: int, index: i64) *Font;
export @symbol("TTF_OpenFontDPI")        OpenFontDPI(file: *c::char, ptsize: int, hdpi: uint, vdpi: uint) *Font;
export @symbol("TTF_OpenFontIndexDPI")   OpenFontIndexDPI(file: *c::char, ptsize: int, index: i64, hdpi: uint, vdpi: uint) *Font;
export @symbol("TTF_OpenFontDPIRW")      OpenFontDPIRW(src: *sdl2::RWops, freesrc: int, ptsize: int, hdpi: uint, vdpi: uint) *Font;
export @symbol("TTF_OpenFontIndexDPIRW") OpenFontIndexDPIRW(src: *sdl2::RWops, freesrc: int, ptsize: int, index: i64, hdpi: uint, vdpi: uint) *Font;
export @symbol("TTF_SetFontSize")        SetFontSize(font: *Font, ptsize: int) int;
export @symbol("TTF_SetFontSizeDPI")     SetFontSizeDPI(font: *Font, ptsize: int, hdpi: uint, vdpi: uint) int;

export def STYLE_NORMAL        = 0x00;
export def STYLE_BOLD          = 0x01;
export def STYLE_ITALIC        = 0x02;
export def STYLE_UNDERLINE     = 0x04;
export def STYLE_STRIKETHROUGH = 0x08;

export @symbol("TTF_GetFontStyle")   GetFontStyle(font: *Font) int;
export @symbol("TTF_SetFontStyle")   SetFontStyle(font: *Font, style: int) void;
export @symbol("TTF_GetFontOutline") GetFontOutline(font: *Font) int;
export @symbol("TTF_SetFontOutline") SetFontOutline(font: *Font, outline: int) void;

export def HINTING_NORMAL         = 0;
export def HINTING_LIGHT          = 1;
export def HINTING_MONO           = 2;
export def HINTING_NONE           = 3;
export def HINTING_LIGHT_SUBPIXEL = 4;

export @symbol("TTF_GetFontHinting") GetFontHinting(font: *Font) int;
export @symbol("TTF_SetFontHinting") SetFontHinting(font: *Font, hinting: int) void;

export def WRAPPED_ALIGN_LEFT   = 0;
export def WRAPPED_ALIGN_CENTER = 1;
export def WRAPPED_ALIGN_RIGHT  = 2;

export @symbol("TTF_GetFontWrappedAlign")           GetFontWrappedAlign(font: *Font) int;
export @symbol("TTF_SetFontWrappedAlign")           SetFontWrappedAlign(font: *Font, align: int) void;
export @symbol("TTF_FontHeight")                    FontHeight(font: *Font) int;
export @symbol("TTF_FontAscent")                    FontAscent(font: *Font) int;
export @symbol("TTF_FontDescent")                   FontDescent(font: *Font) int;
export @symbol("TTF_FontLineSkip")                  FontLineSkip(font: *Font) int;
export @symbol("TTF_GetFontKerning")                GetFontKerning(font: *Font) int;
export @symbol("TTF_SetFontKerning")                SetFontKerning(font: *Font, allowed: int) void;
export @symbol("TTF_FontFaces")                     FontFaces(font: *Font) i64;
export @symbol("TTF_FontFaceIsFixedWidth")          FontFaceIsFixedWidth(font: *Font) int;
export @symbol("TTF_FontFaceFamilyName")            FontFaceFamilyName(font: *Font) *c::char;
export @symbol("TTF_FontFaceStyleName")             FontFaceStyleName(font: *Font) *c::char;
export @symbol("TTF_GlyphIsProvided")               GlyphIsProvided(font: *Font, ch: u16) int;
export @symbol("TTF_GlyphIsProvided32")             GlyphIsProvided32(font: *Font, ch: u32) int;
export @symbol("TTF_GlyphMetrics")                  GlyphMetrics(font: *Font, ch: u16, minx: *int, maxx: *int, miny: *int, maxy: *int, advance: *int) int;
export @symbol("TTF_GlyphMetrics32")                GlyphMetrics32(font: *Font, ch: u32, minx: *int, maxx: *int, miny: *int, maxy: *int, advance: *int) int;
export @symbol("TTF_SizeText")                      SizeText(font: *Font,  text: *c::char, w: *int, h: *int) int;
export @symbol("TTF_SizeUTF8")                      SizeUTF8(font: *Font,  text: *c::char, w: *int, h: *int) int;
export @symbol("TTF_SizeUNICODE")                   SizeUNICODE(font: *Font,  text: *u16, w: *int, h: *int) int;
export @symbol("TTF_MeasureText")                   MeasureText(font: *Font,  text: *c::char, measure_width: int, extent: *int, count: *int) int;
export @symbol("TTF_MeasureUTF8")                   MeasureUTF8(font: *Font,  text: *c::char, measure_width: int, extent: *int, count: *int) int;
export @symbol("TTF_MeasureUNICODE")                MeasureUNICODE(font: *Font,  text: *u16, measure_width: int, extent: *int, count: *int) int;
export @symbol("TTF_RenderText_Solid")              RenderText_Solid(font: *Font, text: *c::char, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderUTF8_Solid")              RenderUTF8_Solid(font: *Font, text: *c::char, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderUNICODE_Solid")           RenderUNICODE_Solid(font: *Font, text: *u16, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderText_Solid_Wrapped")      RenderText_Solid_Wrapped(font: *Font, text: *c::char, fg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderUTF8_Solid_Wrapped")      RenderUTF8_Solid_Wrapped(font: *Font, text: *c::char, fg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderUNICODE_Solid_Wrapped")   RenderUNICODE_Solid_Wrapped(font: *Font, text: *u16, fg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderGlyph_Solid")             RenderGlyph_Solid(font: *Font, ch: u16, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderGlyph32_Solid")           RenderGlyph32_Solid(font: *Font, ch: u32, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderText_Shaded")             RenderText_Shaded(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderUTF8_Shaded")             RenderUTF8_Shaded(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderUNICODE_Shaded")          RenderUNICODE_Shaded(font: *Font, text: *u16, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderText_Shaded_Wrapped")     RenderText_Shaded_Wrapped(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderUTF8_Shaded_Wrapped")     RenderUTF8_Shaded_Wrapped(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderUNICODE_Shaded_Wrapped")  RenderUNICODE_Shaded_Wrapped(font: *Font, text: *u16, fg: sdl2::Color, bg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderGlyph_Shaded")            RenderGlyph_Shaded(font: *Font, ch: u16, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderGlyph32_Shaded")          RenderGlyph32_Shaded(font: *Font, ch: u32, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderText_Blended")            RenderText_Blended(font: *Font, text: *c::char, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderUTF8_Blended")            RenderUTF8_Blended(font: *Font, text: *c::char, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderUNICODE_Blended")         RenderUNICODE_Blended(font: *Font, text: *u16, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderText_Blended_Wrapped")    RenderText_Blended_Wrapped(font: *Font, text: *c::char, fg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderUTF8_Blended_Wrapped")    RenderUTF8_Blended_Wrapped(font: *Font, text: *c::char, fg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderUNICODE_Blended_Wrapped") RenderUNICODE_Blended_Wrapped(font: *Font, text: *u16, fg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderGlyph_Blended")           RenderGlyph_Blended(font: *Font, ch: u16, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderGlyph32_Blended")         RenderGlyph32_Blended(font: *Font, ch: u32, fg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderText_LCD")                RenderText_LCD(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderUTF8_LCD")                RenderUTF8_LCD(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderUNICODE_LCD")             RenderUNICODE_LCD(font: *Font, text: *u16, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderText_LCD_Wrapped")        RenderText_LCD_Wrapped(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderUTF8_LCD_Wrapped")        RenderUTF8_LCD_Wrapped(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderUNICODE_LCD_Wrapped")     RenderUNICODE_LCD_Wrapped(font: *Font, text: *u16, fg: sdl2::Color, bg: sdl2::Color, wrapLength: u32) *sdl2::Surface;
export @symbol("TTF_RenderGlyph_LCD")               RenderGlyph_LCD(font: *Font, ch: u16, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;
export @symbol("TTF_RenderGlyph32_LCD")             RenderGlyph32_LCD(font: *Font, ch: u32, fg: sdl2::Color, bg: sdl2::Color) *sdl2::Surface;

export fn RenderText(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color)    RenderText_Shaded(font, text, fg, bg);
export fn RenderUTF8(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color)    RenderUTF8_Shaded(font, text, fg, bg);
export fn RenderUNICODE(font: *Font, text: *c::char, fg: sdl2::Color, bg: sdl2::Color) RenderUNICODE_Shaded(font, text, fg, bg);

export @symbol("TTF_CloseFont")                  CloseFont(font: *Font) void;
export @symbol("TTF_Quit")                       Quit() void;
export @symbol("TTF_WasInit")                    WasInit() int;
export @symbol("TTF_GetFontKerningSizeGlyphs")   GetFontKerningSizeGlyphs(font: *Font, previous_ch: u16, ch: u16) int;
export @symbol("TTF_GetFontKerningSizeGlyphs32") GetFontKerningSizeGlyphs32(font: *Font, previous_ch: u32, ch: u32) int;
export @symbol("TTF_SetFontSDF")                 SetFontSDF(font: *Font, on_off: sdl2::Bool) int;
export @symbol("TTF_GetFontSDF")                 GetFontSDF(font: *Font) sdl2::Bool;

export type Direction = enum {
	DIRECTION_LTR = 0,
	DIRECTION_RTL,
	DIRECTION_TTB,
	DIRECTION_BTT
};

export @symbol("TTF_SetFontDirection")  SetFontDirection(font: *Font, direction: Direction) int;
export @symbol("TTF_SetFontScriptName") SetFontScriptName(font: *Font,  script: *c::char) int;
