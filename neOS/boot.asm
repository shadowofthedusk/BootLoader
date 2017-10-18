[ORG 0x7c00]

xor ax, ax ; make it zero
mov ds, ax
mov	di, welcome_msg
call    print_string

hang:
   jmp hang

welcome_msg	db	'Welcome',0

%include "print.asm"

times 510-($-$$) db 0
db 0x55
db 0xAA
