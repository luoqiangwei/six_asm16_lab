data segment
	fail1	db 0ah, 'Open file failed$'
	fail2	db 0ah, 'Read file failed$'
	file	db '1.txt', 0h
	tip2	db 0ah,'Read file success$'
data ends

code segment
faila:
	lea	dx, fail1
	mov	ah, 09h
	int	21h
	
	mov	ah, 4ch
	int	21h
	
failb:
	lea	dx, fail2
	mov	ah, 09h
	int	21h
	
	mov	ah, 4ch
	int	21h
	
main:
	mov	dx, data
	mov	ds, dx
	
	lea	dx, file
	mov	al, 00h
	mov	ah, 03dh
	int	21h
	jc	faila
	mov	bx, ax		;�����ļ����
	
	mov	dx, 9000h
	mov	cx, 0fdh
	mov	ah, 3fh		
	int	21h
	
	jc	failb
	lea	dx, tip2
	mov	ah, 09h
	int	21h
	
	mov	dx, 9000h
	mov	di, dx
lops
	mov	cl, [di]
	cmp	cl, 00h
	jz	lope
	
	jmp	lops
	
lope:	
	mov	ah, 3eh
	int	21h
	
	mov	ah, 4ch
	int	21h
code ends
end main
