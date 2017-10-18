	;;
	;; Global descriptor table
	;;
_gdt:
	dw	0x0		; Zero descriptor
	dw	0x0
	dw	0x0
	dw	0x0

	dw	0xffff		; Kernel code descriptor
	dw	0x0000
	dw	0x9a00
	dw	0x00cf

	dw	0xffff		;  Kernel data descriptor
	dw	0x0000
	dw	0x9200
	dw	0x00cf

	dw	0xffff		;  Loader code descriptor
_loader_code_base_0_15:
	dw	0x0000
_loader_code_base_16_23:
	db	0x00
	db	0x9a
	dw	0x0000

	dw	0xffff		;  Loader data descriptor
_loader_data_base_0_15:
	dw	0x0000
_loader_data_base_16_23:
	db	0x00
	db	0x92
	dw	0x0000

error_pmode_already:
	db	0xa, 0xd
	db	'Error: The processor is already in protected mode'
	db	0xa, 0xd, 0
error_file_open_failed:
	db	0xa, 0xd
	db	'Error: Failed to open file (code 0x%a)'
	db	0xa, 0xd, 0
error_file_seek_failed:
	db	0xa, 0xd
	db	'Error: File seek failed (code 0x%a)'
	db	0xa, 0xd, 0
error_file_read_failed:
	db	0xa, 0xd
	db	'Error: File read failed (code 0x%a)'
	db	0xa, 0xd, 0
error_bad_mz:
	db	0xa, 0xd
	db	'Error: Bad DOS EXE magic'
	db	0xa, 0xd, 0

