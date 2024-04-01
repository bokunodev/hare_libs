
export type BlitMap = opaque;

export type Surface = struct {
	flags:        u32,
	format:       *PixelFormat,
	w:            int,
	h:            int,
	pitch:        int,
	pixels:       *opaque,
	userdata:     *opaque,
	locked:       int,
	list_blitmap: *opaque,
	clip_rect:    Rect,
	map:          *BlitMap,
	refcount:     int,
};

export type blit = *fn(src: *Surface, srcrect: *Rect, dst: *Surface, dstrect: *Rect) int;

export type YUV_CONVERSION_MODE = enum {
	YUV_CONVERSION_JPEG,
	YUV_CONVERSION_BT601,
	YUV_CONVERSION_BT709,
	YUV_CONVERSION_AUTOMATIC,
};

export @symbol("SDL_CreateRGBSurface"                  ) fn CreateRGBSurface(flags: u32, width: int, height: int, depth: int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) *Surface;
export @symbol("SDL_CreateRGBSurfaceWithFormat"        ) fn CreateRGBSurfaceWithFormat(flags: u32, width: int, height: int, depth: int, format: u32) *Surface;
export @symbol("SDL_CreateRGBSurfaceFrom"              ) fn CreateRGBSurfaceFrom(pixels: *opaque, width: int, height: int, depth: int, pitch: int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) *Surface;
export @symbol("SDL_CreateRGBSurfaceWithFormatFrom"    ) fn CreateRGBSurfaceWithFormatFrom(pixels: *opaque, width: int, height: int, depth: int, pitch: int, format: u32) *Surface;
export @symbol("SDL_FreeSurface"                       ) fn FreeSurface(surface: *Surface) void;
export @symbol("SDL_SetSurfacePalette"                 ) fn SetSurfacePalette(surface: *Surface, palette: *Palette) int;
export @symbol("SDL_LockSurface"                       ) fn LockSurface(surface: *Surface) int;
export @symbol("SDL_UnlockSurface"                     ) fn UnlockSurface(surface: *Surface) void;
export @symbol("SDL_LoadBMP_RW"                        ) fn LoadBMP_RW(src: *RWops, freesrc: int) *Surface;
export @symbol("SDL_SaveBMP_RW"                        ) fn SaveBMP_RW(surface: *Surface, dst: *RWops, freedst: int) int;
export @symbol("SDL_SetSurfaceRLE"                     ) fn SetSurfaceRLE(surface: *Surface, flag: int) int;
export @symbol("SDL_HasSurfaceRLE"                     ) fn HasSurfaceRLE(surface: *Surface) Bool;
export @symbol("SDL_SetColorKey"                       ) fn SetColorKey(surface: *Surface, flag: int, key: u32) int;
export @symbol("SDL_HasColorKey"                       ) fn HasColorKey(surface: *Surface) Bool;
export @symbol("SDL_GetColorKey"                       ) fn GetColorKey(surface: *Surface, key: *u32) int;
export @symbol("SDL_SetSurfaceColorMod"                ) fn SetSurfaceColorMod(surface: *Surface, r: u8, g: u8, b: u8) int;
export @symbol("SDL_GetSurfaceColorMod"                ) fn GetSurfaceColorMod(surface: *Surface, r: *u8, g: *u8, b: *u8) int;
export @symbol("SDL_SetSurfaceAlphaMod"                ) fn SetSurfaceAlphaMod(surface: *Surface, alpha: u8) int;
export @symbol("SDL_GetSurfaceAlphaMod"                ) fn GetSurfaceAlphaMod(surface: *Surface, alpha: *u8) int;
export @symbol("SDL_SetSurfaceBlendMode"               ) fn SetSurfaceBlendMode(surface: *Surface, blendMode: BlendMode) int;
export @symbol("SDL_GetSurfaceBlendMode"               ) fn GetSurfaceBlendMode(surface: *Surface, blendMode: *BlendMode) int;
export @symbol("SDL_SetClipRect"                       ) fn SetClipRect(surface: *Surface, rect: const*Rect) Bool;
export @symbol("SDL_GetClipRect"                       ) fn GetClipRect(surface: *Surface, rect: *Rect) void;
export @symbol("SDL_DuplicateSurface"                  ) fn DuplicateSurface(surface: *Surface) *Surface;
export @symbol("SDL_ConvertSurface"                    ) fn ConvertSurface(src: *Surface, fmt: const*PixelFormat, flags: u32) *Surface;
export @symbol("SDL_ConvertSurfaceFormat"              ) fn ConvertSurfaceFormat(src: *Surface, pixel_format: u32, flags: u32) *Surface;
export @symbol("SDL_ConvertPixels"                     ) fn ConvertPixels(width: int, height: int, src_format: u32, src: const*opaque, src_pitch: int, dst_format: u32, dst: *opaque, dst_pitch: int) int;
export @symbol("SDL_PremultiplyAlpha"                  ) fn PremultiplyAlpha(width: int, height: int, src_format: u32, src: const*opaque, src_pitch: int, dst_format: u32, dst: *opaque, dst_pitch: int) int;
export @symbol("SDL_FillRect"                          ) fn FillRect(dst: *Surface, rect: const*Rect, color: u32) int;
export @symbol("SDL_FillRects"                         ) fn FillRects(dst: *Surface, rects: const*Rect, count: int, color: u32) int;
export @symbol("SDL_UpperBlit"                         ) fn UpperBlit(src: *Surface, srcrect: const*Rect, dst: *Surface, dstrect: *Rect) int;
export @symbol("SDL_LowerBlit"                         ) fn LowerBlit(src: *Surface, srcrect: *Rect, dst: *Surface, dstrect: *Rect) int;
export @symbol("SDL_SoftStretch"                       ) fn SoftStretch(src: *Surface, srcrect: const*Rect, dst: *Surface, dstrect: const*Rect) int;
export @symbol("SDL_SoftStretchLinear"                 ) fn SoftStretchLinear(src: *Surface, srcrect: const*Rect, dst: *Surface, dstrect: const*Rect) int;
export @symbol("SDL_UpperBlitScaled"                   ) fn UpperBlitScaled(src: *Surface, srcrect: const*Rect, dst: *Surface, dstrect: *Rect) int;
export @symbol("SDL_LowerBlitScaled"                   ) fn LowerBlitScaled(src: *Surface, srcrect: *Rect, dst: *Surface, dstrect: *Rect) int;
export @symbol("SDL_SetYUVConversionMode"              ) fn SetYUVConversionMode(mode: YUV_CONVERSION_MODE) void;
export @symbol("SDL_GetYUVConversionMode"              ) fn GetYUVConversionMode() YUV_CONVERSION_MODE;
export @symbol("SDL_GetYUVConversionModeForResolution" ) fn GetYUVConversionModeForResolution(width: int, height: int) YUV_CONVERSION_MODE;
