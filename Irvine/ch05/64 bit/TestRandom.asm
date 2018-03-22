;4.10.7 reverse a string
ExitProcess proto
.data
	source BYTE "This is the source string",0
	target BYTE SIZEOF source DUP('#')
.code
main proc
	mov rcx, SIZEOF source
	mov rdx, 0
	L1:
		mov al, [source + rcx - 1]
		mov [target + rdx], al
		inc rdx
	LOOP L1
	call ExitProcess
main endp
end