data segment
	grades		db 56,69,84,82,73,88,99,63,100,80
	s5		db 0
	s6		db 0
	s7		db 0
	s8		db 0
	s9		db 0
	s10		db 0
	result		db ' s5:',0,' s6:',0,' s7:',0,' s8:',0,' s9:',0,' s0:',0,'$'
data ends

code segment
main:
	mov	dx, data
	mov	ds, dx
	lea	dx, grades
	mov	di, dx
	mov	cx, 0ah

lops:
	mov	al, [di]
	inc	di
	cmp	al, 60
	jns	t6
	lea	bx, s5
	mov	si, bx
	mov	ah, [si]
	inc	ah
	mov	[si], ah
	jmp	lope
t6:
	cmp	al, 70
	jns	t7
	lea	bx, s6
	mov	si, bx
	mov	ah, [si]
	inc	ah
	mov	[si], ah
	jmp	lope
t7:
	cmp	al, 80
	jns	t8
	lea	bx, s7
	mov	si, bx
	mov	ah, [si]
	inc	ah
	mov	[si], ah
	jmp	lope
t8:
	cmp	al, 90
	jns	t9
	lea	bx, s8
	mov	si, bx
	mov	ah, [si]
	inc	ah
	mov	[si], ah
	jmp	lope
t9:
	cmp	al, 100
	jns	t10
	lea	bx, s9
	mov	si, bx
	mov	ah, [si]
	inc	ah
	mov	[si], ah
	jmp	lope
t10:
	lea	bx, s10
	mov	si, bx
	mov	ah, [si]
	inc	ah
	mov	[si], ah
lope:
	loop	lops
	
	lea	dx, result
	mov	di, dx
	lea	dx, s5
	mov	si, dx
	mov	bx, 04h
	mov	cx, 0ah
lop1s:
	mov	ah, [si]
	inc	si
	add	di, bx
	add	ah, 30h
	mov	[di], ah
	loop	lop1s	
	
	lea	dx, result
	mov	ah, 09h
	int	21h
	
	mov	ah, 4ch
	int	21h
code ends
end main
