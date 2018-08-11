data segment
	aa	db '1$'
	bb	db '0$'
	cc	db '-1$'
data ends

code segment
error:
	mov	ax, 9000h
	mov	di, ax
	mov	al, 'E'
	mov	[di], al
	mov	al, 'R'
	mov	[di+1], al
	mov	al, 'R'
	mov	[di+2], al
	mov	al, 'O'
	mov	[di+3], al
	mov	al, 'R'
	mov	[di+4], al
	mov	al, '!'
	mov	[di+5], al
	mov	al, '$'
	mov	[di+6], al
	
	mov	dx, 9000h
	
	mov	ah, 09h
	int	21h
	
	MOV AH,4CH   
    	INT 21H

main:
	mov	dx, 8000h	;开始创建缓冲区
	mov	di, dx
	mov	al, 07h
	mov	[di], al
	
	mov	ah, 0ah
	int	21h
	
	mov	dx, 0ah		;换行
	mov	ah, 02h
	int	21h
	;---------------------------------------------------
	mov	al, [di+2]
	cmp	al, 2dh
	jz	try
	sub	al, 30h
	cmp	al, 0ah
	js	try
	jmp	error
	;---------------------------------------------------
try:
	mov	ax, 8003h
	mov	di, ax
	mov	cx, 05h
lops:
	mov	al, [di]
	inc	di
	cmp	al, 00h
	jz	lope
	sub	al, 30h
	cmp	al, 0ah
	js	lope
	jmp	error
lope:
	loop	lops
tre:
	mov	ax, 8000h
	mov	di, ax
	mov	al, [di+2]
	mov	dx, data
	mov	ds, dx
	cmp	al, 30h
	jnz	$ + 8
	lea	dx, bb
	jmp	$ + 16
	cmp	al, 2dh
	jnz	$ + 8
	lea	dx, cc
	jmp	$ + 6
	lea	dx, aa
	
	mov	ah, 09h
	int	21h
	
	MOV AH,4CH   
    	INT 21H

code ends
end main