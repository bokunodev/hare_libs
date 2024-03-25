
export type SDL_GestureID = i64;

export @symbol("SDL_RecordGesture"          ) fn RecordGesture(touchId: SDL_TouchID) int;
export @symbol("SDL_SaveAllDollarTemplates" ) fn SaveAllDollarTemplates(dst: *SDL_RWops) int;
export @symbol("SDL_SaveDollarTemplate"     ) fn SaveDollarTemplate(gestureId: SDL_GestureID,dst: *SDL_RWops) int;
export @symbol("SDL_LoadDollarTemplates"    ) fn LoadDollarTemplates(touchId: SDL_TouchID, src: *SDL_RWops) int;
