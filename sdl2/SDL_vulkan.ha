use types::c;

export type VkInstance         = *opaque;
export type VkSurfaceKHR       = *opaque;
export type vulkanInstance = VkInstance;
export type vulkanSurface  = VkSurfaceKHR;

export @symbol("SDL_Vulkan_LoadLibrary"              ) fn Vulkan_LoadLibrary(path: const*c::char) int;
export @symbol("SDL_Vulkan_GetVkGetInstanceProcAddr" ) fn Vulkan_GetVkGetInstanceProcAddr() *opaque;
export @symbol("SDL_Vulkan_UnloadLibrary"            ) fn Vulkan_UnloadLibrary() void;
export @symbol("SDL_Vulkan_GetInstanceExtensions"    ) fn Vulkan_GetInstanceExtensions(window: *Window, pCount: *uint, pNames: const**c::char) Bool;
export @symbol("SDL_Vulkan_CreateSurface"            ) fn Vulkan_CreateSurface(window: *Window, instance: VkInstance, surface: *VkSurfaceKHR) Bool;
export @symbol("SDL_Vulkan_GetDrawableSize"          ) fn Vulkan_GetDrawableSize(window: *Window, w: *int, h: *int) void;
