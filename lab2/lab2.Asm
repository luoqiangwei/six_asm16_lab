code segment
main:	;���ڴ� 10000H ��ʼ������ 00H~0FH~00H 31����
	mov	ax, 1000h
	mov	ds, ax
	
	mov	al, 00h
	mov	cx, 0fh
	mov	[di], al
	inc	di
	inc	al
	loop	$ - 5
	
	mov	cx, 10h
	mov	[di], al
	inc	di
	dec	al
	loop	$ - 5
	
	
;	mov	ax, 1000h
;	mov	ds, ax
;	mov	si, 0
;	mov	cl, 0fh
;	xor	ax, ax
;ppe1:
;	mov	[si], al
;	inc	si
;	inc	al
;	dec	cl
;	jnz	ppe1
;	mov	cx, 10h	
;ppe2:
;	mov	[si], al
;	inc	si
;	dec	al
;	loop	ppe2
;	int	20h 

	;�� 10000H �����ݿ�ת�Ƶ� 15050H
	mov	cx, 20h
	mov	di, 5050h
	mov	al, [si]
	mov	[di], al
	inc	si
	inc	di
	loop	$ - 8
	
;	mov	ax, 1000h
;	mov	ds, ax
;	mov	si, 0
;	mov	dl, 5050h
;	mov	cx, 1fh
;ppea:	
;	mov	al, [si]
;	mov	[di], al
;	inc	si
;	inc	di
;	loop	ppea
;	int	20h

	;ʹ�� MOVSB �����ݿ�ת�Ƶ� 15150H
	mov	ax, 1000h
	mov	es, ax
	mov	si, 0000h
	mov	di, 5150h
	mov	cx, 20h
	movsb
	loop	$ - 1
	
	;ʹ�� REP MOVSB �����ݿ�ת�Ƶ� 15250H
	mov	si, 0000h
	mov	di, 5250h
	mov	cx, 20h
	rep movsb
	
	;ʹ�ô������ļ���������ʽ�������ݿ�ת�Ƶ� 25050H
	std
	mov	ax, 2000h
	mov	es, ax
	mov	cx, 0020h
	mov	si, 0020h
	mov	di, 5070h
	rep movsb

	MOV AH,4CH   
    	INT 21H
code ends
end main