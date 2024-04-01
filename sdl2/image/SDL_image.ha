use types::c;
use sdl2;

export type InitFlags = enum {
	INIT_JPG  = 0x00000001,
	INIT_PNG  = 0x00000002,
	INIT_TIF  = 0x00000004,
	INIT_WEBP = 0x00000008,
	INIT_JXL  = 0x00000010,
	INIT_AVIF = 0x00000020,
};

export def INIT_EVERYTHING = (
		InitFlags::INIT_JPG | InitFlags::INIT_PNG  |
		InitFlags::INIT_TIF | InitFlags::INIT_WEBP |
		InitFlags::INIT_JXL | InitFlags::INIT_AVIF
	);

export type Animation = struct {
	w:      int,
	h:      int,
	count:  int,
	frames: const**sdl2::Surface,
	delays: *int,
};

export @symbol("IMG_Linked_Version"           ) fn Linked_Version() const*sdl2::version;
export @symbol("IMG_Init"                     ) fn Init(flags: InitFlags) int;
export @symbol("IMG_Quit"                     ) fn Quit() void;
export @symbol("IMG_LoadTyped_RW"             ) fn LoadTyped_RW(src: *sdl2::RWops, freesrc: int, _type: const*c::char) *sdl2::Surface;
export @symbol("IMG_Load"                     ) fn Load(file: const*c::char) *sdl2::Surface;
export @symbol("IMG_Load_RW"                  ) fn Load_RW(src: *sdl2::RWops, freesrc: int) *sdl2::Surface;
export @symbol("IMG_LoadTexture"              ) fn LoadTexture(renderer: *sdl2::Renderer, file: const*c::char) *sdl2::Texture;
export @symbol("IMG_LoadTexture_RW"           ) fn LoadTexture_RW(renderer: *sdl2::Renderer, src: *sdl2::RWops, freesrc: int) *sdl2::Texture;
export @symbol("IMG_LoadTextureTyped_RW"      ) fn LoadTextureTyped_RW(renderer: *sdl2::Renderer, src: *sdl2::RWops, freesrc: int, _type: const*c::char) *sdl2::Texture;
export @symbol("IMG_isAVIF"                   ) fn IsAVIF(src: *sdl2::RWops) int;
export @symbol("IMG_isICO"                    ) fn IsICO(src: *sdl2::RWops) int;
export @symbol("IMG_isCUR"                    ) fn IsCUR(src: *sdl2::RWops) int;
export @symbol("IMG_isBMP"                    ) fn IsBMP(src: *sdl2::RWops) int;
export @symbol("IMG_isGIF"                    ) fn IsGIF(src: *sdl2::RWops) int;
export @symbol("IMG_isJPG"                    ) fn IsJPG(src: *sdl2::RWops) int;
export @symbol("IMG_isJXL"                    ) fn IsJXL(src: *sdl2::RWops) int;
export @symbol("IMG_isLBM"                    ) fn IsLBM(src: *sdl2::RWops) int;
export @symbol("IMG_isPCX"                    ) fn IsPCX(src: *sdl2::RWops) int;
export @symbol("IMG_isPNG"                    ) fn IsPNG(src: *sdl2::RWops) int;
export @symbol("IMG_isPNM"                    ) fn IsPNM(src: *sdl2::RWops) int;
export @symbol("IMG_isSVG"                    ) fn IsSVG(src: *sdl2::RWops) int;
export @symbol("IMG_isQOI"                    ) fn IsQOI(src: *sdl2::RWops) int;
export @symbol("IMG_isTIF"                    ) fn IsTIF(src: *sdl2::RWops) int;
export @symbol("IMG_isXCF"                    ) fn IsXCF(src: *sdl2::RWops) int;
export @symbol("IMG_isXPM"                    ) fn IsXPM(src: *sdl2::RWops) int;
export @symbol("IMG_isXV"                     ) fn IsXV(src: *sdl2::RWops) int;
export @symbol("IMG_isWEBP"                   ) fn IsWEBP(src: *sdl2::RWops) int;
export @symbol("IMG_LoadAVIF_RW"              ) fn LoadAVIF_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadICO_RW"               ) fn LoadICO_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadCUR_RW"               ) fn LoadCUR_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadBMP_RW"               ) fn LoadBMP_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadGIF_RW"               ) fn LoadGIF_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadJPG_RW"               ) fn LoadJPG_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadJXL_RW"               ) fn LoadJXL_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadLBM_RW"               ) fn LoadLBM_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadPCX_RW"               ) fn LoadPCX_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadPNG_RW"               ) fn LoadPNG_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadPNM_RW"               ) fn LoadPNM_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadSVG_RW"               ) fn LoadSVG_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadQOI_RW"               ) fn LoadQOI_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadTGA_RW"               ) fn LoadTGA_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadTIF_RW"               ) fn LoadTIF_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadXCF_RW"               ) fn LoadXCF_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadXPM_RW"               ) fn LoadXPM_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadXV_RW"                ) fn LoadXV_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadWEBP_RW"              ) fn LoadWEBP_RW(src: *sdl2::RWops) *sdl2::Surface;
export @symbol("IMG_LoadSizedSVG_RW"          ) fn LoadSizedSVG_RW(src: *sdl2::RWops, width: int, height: int) *sdl2::Surface;
export @symbol("IMG_ReadXPMFromArray"         ) fn ReadXPMFromArray(xpm: const**c::char) *sdl2::Surface;
export @symbol("IMG_ReadXPMFromArrayToRGB888" ) fn ReadXPMFromArrayToRGB888(xpm: const**c::char) *sdl2::Surface;
export @symbol("IMG_SavePNG"                  ) fn SavePNG(surface: *sdl2::Surface, file: const*c::char) int;
export @symbol("IMG_SavePNG_RW"               ) fn SavePNG_RW(surface: *sdl2::Surface, dst: *sdl2::RWops, freedst: int) int;
export @symbol("IMG_SaveJPG"                  ) fn SaveJPG(surface: *sdl2::Surface, file: const*c::char, quality: int) int;
export @symbol("IMG_SaveJPG_RW"               ) fn SaveJPG_RW(surface: *sdl2::Surface, dst: *sdl2::RWops, freedst: int, quality: int) int;
export @symbol("IMG_LoadAnimation"            ) fn LoadAnimation(file: const*c::char) *Animation;
export @symbol("IMG_LoadAnimation_RW"         ) fn LoadAnimation_RW(src: *sdl2::RWops, freesrc: int) *Animation;
export @symbol("IMG_LoadAnimationTyped_RW"    ) fn LoadAnimationTyped_RW(src: *sdl2::RWops, freesrc: int, _type: const*c::char) *Animation;
export @symbol("IMG_FreeAnimation"            ) fn FreeAnimation(anim: *Animation) void;
export @symbol("IMG_LoadGIFAnimation_RW"      ) fn LoadGIFAnimation_RW(src: *sdl2::RWops) *Animation;
export @symbol("IMG_LoadWEBPAnimation_RW"     ) fn LoadWEBPAnimation_RW(src: *sdl2::RWops) *Animation;
