ExitProcess	proto
WriteInt64	proto
Crlf		proto
.data
nMinus2 QWORD 0
nMinus1 QWORD 1
n		QWORD 0
count   QWORD 47-1
.code
main proc
	;set loop counter
	mov rcx, count

	;print n-2
	mov rax, nMinus2
	call WriteInt64 
	call Crlf

	;print n-1
	mov rax, nMinus1
	call WriteInt64
	call Crlf
	call FibGen
	;start loop
	
   call ExitProcess
main endp

FibGen PROC
	L1:
		;set n = nMinus2 + nMinus1; 1+1
		mov r9, nMinus2
		add r9, nMinus1
		mov n,r9

		;print n
		mov rax, n
		call WriteInt64
		call Crlf

		;nMinus2 = nMinus1
		mov r9, nMinus1
		mov nMinus2, r9

		;nMinus1 = n
		mov r9, n
		mov nMinus1, r9
		LOOP L1 
ret
FibGen endp
end