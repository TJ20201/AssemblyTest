; Format: [c]x[0000-9999]
;   [M] Message

; nasm main.asm -fbin -o [directory]/main.com

org 100h
section .text

   mov ax, 13h ;
   int 0x10 ;

   mov dx, Mx0000 ; Begin setup message
   mov ah, 09H ;
   int 0x21 ;
   int 0x20 ; Finish setup message

   mov dx, Mx0001 ; Begin sending header message
   mov ah, 09H ;
   int 0x21 ;
   int 0x20 ; Finish sending header message

   ; ------------------------------------ ;



   ; ------------------------------------ ;

   mov dx, Mx9999 ; Begin sending footer message
   mov ah, 09H ;
   int 0x21 ;
   int 0x20 ; Finish sending footer message

section .data
   ; Define Messages
   Mx0000 db `\033[37m`,0AH ;
   Mx0001 db `-         TJ20201/AssemblyTest         - \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n`,0AH ;
   Mx9999 db `-            [ Exiting... ]            -\n\033[0m$` ;
