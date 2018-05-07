;Fibonacci 

ExitProcess	proto
WriteInt64	proto
Crlf		proto

.data
nMinus2 qword 0
nMinus1 qword 1
n		qword 0
counter qword 47-1
.code
main proc
	
	mov rcx, counter

	mov rax, nMinus2
	call WriteInt64 
	call Crlf

	mov rax, nMinus1
	call WriteInt64
	call Crlf
	call Fibonacci
	
	
   call ExitProcess
main endp

Fibonacci proc
myLoop:
	mov r9, nMinus2
	add r9, nMinus1
		mov n,r9

		
	mov rax, n
	call WriteInt64
	call Crlf

	mov r9, nMinus1
	mov nMinus2, r9

		
	mov r9, n
	
	mov nMinus1, r9
	loop myLoop
ret
Fibonacci endp
end