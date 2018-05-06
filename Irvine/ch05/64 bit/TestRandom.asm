WriteInt64 PROTO
ExitProcess PROTO
Crlf PROTO
.data
MyArray QWORD 1d,2d,3d,4d,5d,6d

.code
main proc
	mov rcx, 6
	mov rbx, 0
	mov r12, 8
L1:
	mov rax, rbx
	mul r12
	mov r11, rax
	mov rax, MyArray[r11]
	call WriteInt64
	inc rbx
loop L1
	
	call Crlf

	mov rcx, 3
	mov rbx, 0
L2:
	mov rax, rbx
	mul r12
	mov r11, rax					      ;r11 is first index offset
	mov rbp, r11
	add rbp, 8					        ;rbp is the second index offset

	;swapping
	mov r14, MyArray[r11]				;store the first value in r14
	mov r15, MyArray[rbp]				;store the second value in r15
	mov MyArray[r11], r15
	mov MyArray[rbp], r14

	add rbx, 2			
loop L2
	
	mov rcx, 6
	mov rbx, 0
L3:
	mov rax, rbx
	mul r12
	mov r11, rax
	mov rax, MyArray[r11]
	call WriteInt64
	inc rbx
loop L3
	call ExitProcess
main endp

end