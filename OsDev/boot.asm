[ORG 0x7c00]
   xor ax, ax  ;make it zero
   mov ds, ax

   mov si, msg
   call bios_print

hang:
   jmp hang

msg   db 'Hello World', 13, 10, 0

bios_print:
   lodsb
   or al, al  ;zero=end of str
   jz done    ;get out
   mov ah, 0x0E
   int 0x10
   jmp bios_print
done:
   ret

   times 510-($-$$) db 0
   db 0x55
   db 0xAA
