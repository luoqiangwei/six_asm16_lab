code segment
main:
	mov 	bx, 0
	cmp 	bx, 0000h
	jnz 	$ + 7
	mov 	dx, 'O'
	jmp	$ + 12
	jns	$ + 7
	mov	ax, -1h
	jmp	$ + 5
	mov	ax, 1
	
	cmp	al, 0ffh
	jnz	$ + 6
	mov	dl, '-'
	jmp	$ + 7
	mov	dl, al
	add	dl, 30h
	mov	ah, 02h
	int	21h
	
	MOV AH,4CH   
    	INT 21H

code ends
end main