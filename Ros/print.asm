;
; Print string in DS:DI
;
print_string:
	push	ebp
	mov	bp, sp
	push	eax
	push	edx
	push	edi

	mov	ax, 0x0200
.loop:
	mov	dl, [di]
	cmp	dl, 0
	je	.end_loop
	cmp	dl, '%'
	jne	.print_char
	inc	di
	mov	dl, [di]
	cmp	dl, 'a'
	jne	.not_ax
	push	eax
	mov	eax, [ss:bp - 4]
	call	print_ax
	pop	eax
	jmp	.next_char

.not_ax:
	cmp	dl, 'A'
	jne	.not_eax
	push	eax
	mov	eax, [ss:bp - 4]
	call	print_eax
	pop	eax
	jmp	.next_char

.not_eax:
	cmp	dl, 'c'
	jne	.not_cx
	push	ax
	mov	ax, cx
	call	print_ax
	pop	ax
	jmp	.next_char

.not_cx:

.print_char:
	int	0x21

.next_char:
	inc	di
	jmp	.loop

.end_loop:
	pop	edi
	pop	edx
	pop	eax
	pop	ebp
	ret

;
; print_ax - print the number in the ax register
;

print_ax:
	push	ax
	push	bx
	push	cx
	push	dx

	mov	bx, ax
	mov	ax, 0x0200
	mov	cx, 4
.loop:
	mov	dx, bx
	shr	dx, 12
	and	dl, 0x0f
	cmp	dl, 0x0a
	jge	.hex_val
	add	dl, '0'
	jmp	.not_hex

.hex_val:
	add	dl, 'a' - 10

.not_hex:
	int	0x21
	shl	bx, 4
	dec	cx
	jnz	.loop

	pop	dx
	pop	cx
	pop	bx
	pop	ax
	ret

print_eax:
	push	eax
	push	ebx
	push	ecx
	push	edx

	mov	ebx, eax
	mov	ax, 0x0200
	mov	cx, 8
.loop:
	mov	edx, ebx
	shr	edx, 28
	and	dl, 0x0f
	cmp	dl, 0x0a
	jge	.hex_val
	add	dl, '0'
	jmp	.not_hex

.hex_val:
	add	dl, 'a' - 10

.not_hex:
	int	0x21
	shl	ebx, 4
	dec	cx
	jnz	.loop

	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
	ret
