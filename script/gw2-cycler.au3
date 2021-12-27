;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://github.com/pandawelch/GW2Launcher-AutoIT-logins/script/gw2cycler.au3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Editable Variables
$loadtime = 13000 ; Time to wait for the game window to load in after the character screen in milliseconds
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#include <AutoItConstants.au3>
#include <Misc.au3>
#include <WinAPISys.au3>
#include <WinAPIvkeysConstants.au3>

Opt("WinTitleMatchMode", 2)

; Check if CTRL is being held - if so then exit
KeyCheck("14")

; Get title substring from input
if $cmdline[0] > 0 Then

   $titletarget=$cmdline[1]

Else

   $titletarget = "Guild Wars 2"

EndIf

; Wait for window
$target  = WinWait("[TITLE:" & $titletarget & "; CLASS:ArenaNet_Dx_Window_Class]","",5)

Sleep(Random (2000,3000))

if $target = 0 Then

   ; Exit error, no window found after 5 seconds
   Exit (1)

EndIf


SendKeepActive($target)
; Activate window and enter character, wait the loadtime duration

Send("{Enter}")

SendKeepActive("")

; Wait a random amount of time
Sleep($loadtime + Random (1,3000))


; Check if CAPSLOCK is enabled - if so then exit
if (_WinAPI_GetKeyState($VK_CAPITAL)) Then

   Exit (2)

EndIf 

; Check if CTRL is being held - if so then exit
KeyCheck("14")

; Close the window
WinClose($target)
Exit (0)

Func KeyCheck($key)
   if (_IsPressed("$key")) Then

      Exit (2)

   EndIf
EndFunc