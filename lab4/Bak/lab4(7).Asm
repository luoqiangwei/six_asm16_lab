code	segment
main:

	mov	ah, 06h
	mov	al, 0
	mov	bh, 0f0h
	mov	ch, 0
	mov	cl, 0
	mov	dh, 9
	mov	dl, 19
	int 	10h
	
	mov	bh, 0
	mov	dh, 9
	mov	dl, 0
	mov	ah, 02h
	int	10h
	
	mov	dx, 8000h
	mov	di, dx
	mov	al, 19
	mov	[di], al
	mov	cx, 10
input:
	mov	ah, 0ah
	int	21h
	
	mov	ah, 06h
	mov	al, 1
	mov	ch, 0
	mov	cl, 0
	mov	dh, 9
	mov	dl, 19
	mov	bh, 0f0h
	int 	10h
	
	loop	input	
	
	mov 	ah,4ch
        int 	21h 
code	ends
end	main