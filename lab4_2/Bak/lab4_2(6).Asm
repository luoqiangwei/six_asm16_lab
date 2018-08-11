code	segment
suce:
	mov	ax, 9000h
	mov	di, ax
	mov	al, 'S'
	mov	[di], al
	mov	al, 'U'
	mov	[di+1], al
	mov	al, 'C'
	mov	[di+2], al
	mov	al, 'C'
	mov	[di+3], al
	mov	al, 'E'
	mov	[di+4], al
	mov	al, 'S'
	mov	[di+5], al
	mov	al, 'S'
	mov	[di+6], al
	mov	al, '!'
	mov	[di+7], al
	mov	al, '$'
	mov	[di+8], al
	
	mov	dx, 9000h
	
	mov	ah, 09h
	int	21h
	
	MOV	AH,4CH   
    	INT 	21H
fail:
	mov	ax, 9000h
	mov	di, ax
	mov	al, 'F'
	mov	[di], al
	mov	al, 'A'
	mov	[di+1], al
	mov	al, 'I'
	mov	[di+2], al
	mov	al, 'L'
	mov	[di+3], al
	mov	al, '!'
	mov	[di+4], al
	mov	al, '$'
	mov	[di+5], al
	
	mov	dx, 9000h
	
	mov	ah, 09h
	int	21h
	
	MOV 	AH,4CH   
    	INT 	21H
main:
	;获取系统时间
	mov	ah, 2ch
	int	21h
	
	;设定显示的字符的位置
	mov	dx, 8000h
	mov	di, dx
	
	;十六进制改成十进制
	mov	ax, 0h
	mov	al, cl
	mov	bx, 0ah
	div	bl
	shl	al, 1
	shl	al, 1
	shl	al, 1
	shl	al, 1
	or	al, ah
	mov	cl, al
	
	mov	ax, 0h
	mov	al, ch
	mov	bx, 0ah
	div	bl
	shl	al, 1
	shl	al, 1
	shl	al, 1
	shl	al, 1
	or	al, ah
	mov	ch, al
	
	;设定显示的字符
	mov	al, ch
	shr	al, 1
	shr	al, 1
	shr	al, 1
	shr	al, 1
	add	al, 30h
	mov	[di], al
	
	mov	al, ch
	shl	al, 1
	shl	al, 1
	shl	al, 1
	shl	al, 1
	shr	al, 1
	shr	al, 1
	shr	al, 1
	shr	al, 1
	add	al, 30h
	mov	[di+1], al
	
	mov	al, ':'
	mov	[di+2], al
	
	mov	al, cl
	shr	al, 1
	shr	al, 1
	shr	al, 1
	shr	al, 1
	add	al, 30h
	mov	[di+3], al
	
	mov	al, cl
	shl	al, 1
	shl	al, 1
	shl	al, 1
	shl	al, 1
	shr	al, 1
	shr	al, 1
	shr	al, 1
	shr	al, 1
	add	al, 30h
	mov	[di+4], al
	
	mov	al, 0ah
	mov	[di+5], al
	
	;显示提示
	mov	al, 's'
	mov	[di+6], al
	mov	al, 'e'
	mov	[di+7], al
	mov	al, 't'
	mov	[di+8], al
	mov	al, ' '
	mov	[di+9], al
	mov	al, 't'
	mov	[di+10], al
	mov	al, 'i'
	mov	[di+11], al
	mov	al, 'm'
	mov	[di+12], al
	mov	al, 'e'
	mov	[di+13], al
	mov	al, ':'
	mov	[di+14], al
	
	mov	al, '$'
	mov	[di+15], al
	
	;打印字符
	mov	ah, 09h
	int	21h
	
	mov	dx, 8000h
	mov	di, dx
	mov	al, 06h
	mov	[di], al
	
	mov	ah, 0ah
	int	21h
	
	mov	bh, [di+2]
	sub	bh, 30h
	mov	bl, [di+3]
	sub	bl, 30h
	
	mov	ax, 00h
	mov	al, bh
	mov	dx, 0fh
	mul	dl
	add	al, bl
	mov	ch, al
	
	mov	bh, [di+5]
	sub	bh, 30h
	mov	bl, [di+6]
	sub	bl, 30h
	
	mov	ax, 00h
	mov	al, bh
	mov	dx, 0fh
	mul	dl
	add	al, bl
	mov	cl, al
	
	mov	ah, 2dh
		
	
	MOV 	AH,4CH   
    	INT 	21H
code	ends
end	main