data segment
	fail1	db 0ah, 'File build failed$'
	fail2	db 0ah, 'Write file failed$'
	file	db 'test.txt', 0h
	tip	db 'Please enter character information:$'
	tip2	db 0ah,'Write file success$'
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
	lea	dx, tip
	mov	ah, 09h
	int	21h
	
	mov	dx, 9000h
	mov	di, dx;
	mov	al, 0FFH
	mov	[di], al
	mov	ah, 0ah
	int	21h
	
	lea	dx, file
	mov	cx, 00h
	mov	ah, 03ch
	int	21h
	jc	faila
	mov	bx, ax		;±£´æÎÄ¼þ¾ä±ú
	
	mov	dx, 9002h
	mov	di, dx
	mov	cx, 0fdh
	mov	ah, 40h
	int	21h
	
	jc	failb
	lea	dx, tip2
	mov	ah, 09h
	int	21h
	
	mov	ah, 3eh
	int	21h
	
	mov	ah, 4ch
	int	21h
code ends
end main
