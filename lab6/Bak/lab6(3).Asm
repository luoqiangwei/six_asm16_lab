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
	; ����ǰ�����ݻ����� ds:9000h
	mov	dx, 9000h
	mov	di, dx
	mov	al, 04h
	mov	ah, 0h
	mov	[di], al
	mov	[di+50], ah	;ds:9050h �������� 
	mov	cx, 0ah
	; �������ݲ�����
lops:
	mov	dx, 9000h
	mov	ah, 0ah
	int	21h
	push	cx		;�ڼ��ǰ����cx��ֵ	;------
	mov	cx, 03h
	mov	al, 00h		;ͳ����Ч�ַ�
	; ����ͳ��
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
	; ���ݼ��
	mov	cl, al
	mov	si, dx
	add	si, 2
lcps:
	mov	ah, [si]
	inc	si
	cmp	cl, 03h		;������ݳ���Ϊ3���жϵ�һλ�Ƿ�Ϊ1��������ֱ���ж�Ϊ����
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
	
	; ���ݻ��㣨��ASCII��ת��16���ƣ�
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
	push	cx		;�ٴα���cx		;---
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
	
	pop	cx		;ִ�к�ԭcx��ֵ	------
	sub	cx, 01h
	cmp	cx, 00h 	;��Ϊ̫Զ���޷�ʹ�� loop ѭ��
	jnz	lops
	
	; ����	�з���Ϊ0ʱʧЧ...
	mov	dx, 9050h
	mov	di, dx
	mov	ah, 01h
	mov	[di], ah
	
	mov	dx, 2000h 	;��ʼ�� S
	mov	di, dx
	mov	ax, 0000h	;�趨Ϊ ���ֵѧ�ŵĴ洢��
	mov	bx, 0000h	;�趨Ϊ bh ���ֵ�Ĵ洢��  bl Ϊ��ʱ�ļ�
	mov	cx, 000ah	;��ʼ�� E
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
	mov	bh, bl		;����������
	mov	ax, 0ah		;������������ѧ��
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
	mov	dx, 1000h	;��������
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