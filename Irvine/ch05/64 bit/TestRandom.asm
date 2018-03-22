; 5.9 Question 7 (Not really)
; Asks how many random numbers to display and then displays.
ExitProcess 		proto
ReadInt64		proto
WriteString		proto
Random64		proto
Crlf			proto
WriteInt64		proto
.data
	myRand QWORD 0
	askForInput BYTE "How many random numbers do you want to display?",0
.code
main proc
	call Fib
	call ReadInt64
	call  ExitProcess
main endp

Fib proc USES rax rbx rcx rdx	;sets the loop counter from value in rax
	mov rcx,rax
	mov rax,1
	mov rbx,0
	mov rdx,0
L1:
	ADD rax,rbx					;fib number stored in rax
	ADD rax,rdx					;rbx is previous number
	;call WriteInt64		
	MOV rdx,rbx					;rdx is 2nd previous number
	MOV rbx,rax
	mov rax,0
	call WriteInt64
	loop L1
	
Fib endp
end