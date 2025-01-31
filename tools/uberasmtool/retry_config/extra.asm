;=====================================
; All these routines are called in 8-bit A/X/Y mode and DBR is already set.
; Don't worry about overwriting registers, they'll be restored afterwards (except for direct page :P).
; All the routines must end with rts.
;=====================================

;=====================================
; This routine will be called when loading the title screen.
; It can be used to reset particular RAM addresses for a new save file (see "docs/sram_info.txt").
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
load_title:
    ; Feel free to put your code here.



    rts

;=====================================
; This routine will be called when the level is reset by the retry system or when entering from the overworld.
; Unlike UberASM level init routine, this won't be executed during regular level transitions.
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
reset:
    ; Feel free to put your code here.
    stz $0F5E|!addr ; matches clear_score_sprites.asm
    rts

;=====================================
; This routine will be executed everytime the player dies.
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
death:
    ; Feel free to put your code here.

    ; Clear score sprites on death to free up tiles for prompt display
    stz $16E1|!addr
    stz $16E2|!addr
    stz $16E3|!addr
    stz $16E4|!addr
    stz $16E5|!addr
    stz $16E6|!addr
    rts

;=====================================
; This routine will be called every time the player touches a midway (vanilla or custom midway object).
; NOTE: on SA-1 roms, this runs on the SA-1 cpu.
;=====================================
midway:
    ; Feel free to put your code here.



    rts

;=====================================
; This routine will be called every time the player gets a checkpoint through a room transition.
; Remember you can check for $13BF and $010B to know in which trans/sub-level you are.
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
room_checkpoint:
    ; Feel free to put your code here.



    rts

;=====================================
; This routine will be called every time the player selects "exit" on the retry prompt.
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
prompt_exit:
    ; Feel free to put your code here.



    rts

;=====================================
; This routine will be called every time the game is saved (before anything gets saved).
; Remember that you can check for the current save file in $010A.
; NOTE: on SA-1 roms, this may run on either cpu depending on what's calling the save routine.
;=====================================
save_file:
    ; Feel free to put your code here.



    rts

;=====================================
; This routine will be called every time an existing save file is loaded (before anything gets loaded).
; Remember that you can check for the current save file in $010A.
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
load_file:
    ; Feel free to put your code here.



    rts

;=====================================
; This routine will be called every time a new save file is loaded (before anything gets reset).
; Remember that you can check for the current save file in $010A.
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
load_new_file:
    ; Feel free to put your code here.



    rts

;=====================================
; This routine will be called during the game over screen.
; This is called after the save file data is loaded from SRAM (only the data put before ".not_game_over" in "tables.asm") but before all the data is saved again to SRAM.
; This can be useful if you want to initialize some addresses for the game over and/or have them saved to SRAM.
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
game_over:
    ; Feel free to put your code here.



    rts

;=====================================
; This routine will be called when Mario enters a door, every frame during the fade out.
; This could be useful since the door animation is the only one that can't be intercepted
; with level ASM or sprite ASM (since it immediately goes to the fading gamemode).
; If you need some level-specific action here, you can check the sublevel number in $010B (16 bit).
; If you need to only run the code for 1 frame, you can check for $0DB0 equal to 0.
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
door_animation:
    ; Feel free to put your code here.



    rts

;=====================================
; This routine will be called at the end of the game loop during gamemodes 7 and 14 (title screen and levels),
; just before Retry draws the prompt and AddmusicK's code runs.
; If you have other patches that hijack $00A2EA, you could try to put their freespace code in this routine to solve the conflict.
; NOTE: this runs at the end of the level frame in each level. If you want to run level-specific code, see "level_end_frame.asm".
; NOTE: on SA-1 roms, this runs on the SNES cpu.
;=====================================
gm14_end:
    ; Feel free to put your code here.



    rts
