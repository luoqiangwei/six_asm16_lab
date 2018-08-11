code	segment
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
	
	mov 	ah,4CH   
    	int 	21H
main:
	; 处理前的数据缓冲区 ds:9000h
	mov	dx, 9000h
	mov	di, dx
	mov	al, 04h
	mov	ah, 0h
	mov	[di], al
	mov	[di+50], ah	;ds:9050h 计数缓存 
	mov	cx, 0ah
	; 输入数据并处理
lops:
	mov	dx, 9000h
	mov	ah, 0ah
	int	21h
	push	cx		;在检查前保存cx的值	;------
	mov	cx, 03h
	mov	al, 00h		;统计有效字符
	; 长度统计
	mov	si, dx
	add	si, 2
lnps:	
	mov	ah, [si]
	inc	si
	cmp	ah, 0dh
	jz	lnpe	
	cmp	ah, 00h
	jz	lnpe
	inc	al
lnpe:
	loop	lnps
	; 数据检查
	mov	cl, al
	mov	si, dx
	add	si, 2
lcps:
	mov	ah, [si]
	inc	si
	cmp	cl, 03h		;如果数据长度为3，判断第一位是否为1，若不是直接判断为错误
	jnz	down
	cmp	ah, 031h
	jnz	error
	mov	ah, [si]
	inc	si
	cmp	ah, 30h
	jnz	error
	mov	ah, [si]
	cmp	ah, 30h
	jnz	error
	dec 	si
down:
	cmp	ah, 030h
	js	error
	cmp	ah, 03ah
	jns	error
	loop	lcps
	
	; 数据换算（由ASCII码转成16进制）
	mov	cl, al
	mov	bx, 000ah
	mov	dx, 9000h
	mov	si, dx
	mov	dx, 00h
	add	si, 2	
lups:
	mov	ah, 00h
	mov	al, [si]
	sub	al, 30h
	push	cx		;再次备份cx		;---
lmps:
	cmp	cx, 1h
	jz	lmpe
	mul	bl
	loop	lmps
lmpe:
	add	dx, ax
	pop	cx					;---
	inc	si
	loop	lups
	
	mov	ax, dx
	mov	dx, 1000h
	mov	si, dx
	mov	dh, 00h
	mov	dl, [di+50] 
	add	si, dx
	inc	dl
	mov	[di+50], dl
	mov	[si], ax
	
	pop	cx		;执行后还原cx的值	------
	sub	cx, 01h
	cmp	cx, 00h 	;因为太远而无法使用 loop 循环
	jnz	lops
	
	; 排序	有分数为0时失效...
	mov	dx, 9050h
	mov	di, dx
	mov	ah, 01h
	mov	[di], ah
	
	mov	dx, 2000h 	;初始化 S
	mov	di, dx
	mov	ax, 0000h	;设定为 最大值学号的存储器
	mov	bx, 0000h	;设定为 bh 最大值的存储器  bl 为临时文件
	mov	cx, 000ah	;初始化 E
oops:
	push 	cx
	mov	dx, 1000h
	mov	si, dx
	
	mov	cx, 000ah
;-----------------------------------------------
sces:
	mov	bl, [si]
	inc	si
	cmp	bh, bl
	js	change
	jmp	scee
change:
	mov	bh, bl		;保存最大分数
	mov	ax, 0ah		;保存最大分数的学号
	sub	ax, cx
scee:
	loop	sces
;-----------------------------------------------
	
	;---------------
	mov	dx, 9050h
	mov	di, dx
	mov	bh, 00h
	mov	bl, [di]
	push	di
	mov	dx, 2000h
	mov	di, dx
	add	di, ax
	mov	[di], bl
	inc	bl
	pop	di
	mov	[di], bl
	;---------------
	mov	dx, 1000h	;保存名次
	mov	si, dx
	add	si, ax
	mov	ah, 0ffh
	mov	[si], ah
	
	pop	cx
	loop 	oops
	
	mov	ah, 4ch
	int	21h
code	ends
end	main