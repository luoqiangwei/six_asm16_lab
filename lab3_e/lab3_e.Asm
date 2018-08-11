code segment
main:
	mov 	bx, -12
	cmp 	bx, 0000h
	jnz 	$ + 7
	mov 	dx, 'O'
	jmp	$ + 12
	jns	$ + 7
	mov	dx, '-'
	jmp	$ + 5
	mov	dx, '+'
	
	mov	ah, 02h
	int	21h
	
	MOV AH,4CH   
    	INT 21H

code ends
end main