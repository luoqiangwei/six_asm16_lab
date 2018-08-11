code segment
main:
	mov	ax, 2000
	mov	ds, ax
	not	ax
	xor	ax, ax
	dec	ax
	inc	ax
	mov	bx, 2030
	mov	si, bx
	mov	[si], bl
	mov	word ptr[si], 10fh
	mov	di, si
	mov	[di+50], bh
	mov	bh, [si]
	mov	bl, [di+50]
	mov	sp, 5000
	push	ax
	push	bx
	pop	ax
	popf
	neg	bx
	xchg	bx, ax
	adc	di, 2050
	adc	sp, di
	adc	ax, 1500
	sub	ax, bx
	shl	ah, 1
	rcl	ax, 1
	shr	bh, 1
	rcr	bl, 1
	mov	cl, 4
	mov	dx, 80f0h
	rol	dx, cl
code ends
end main