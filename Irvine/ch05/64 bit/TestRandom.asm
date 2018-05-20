; Andres Arevalo
; CIS-11

ExitProcess Proto
WriteInt64 Proto
ReadInt64 Proto
Crlf Proto

.data
Array QWORD 10,3,3,9,5,4,2,0,1

.code
main PROC

; print the ARRAY
mov rcx, lengthof Array
mov rsi, 0
Myloop:
	mov rax, Array[rsi * 8]
	call WriteInt64
	inc rsi
loop Myloop

call Crlf
call ReadInt64

; bubble sort
mov rcx, lengthof Array

OuterLoop:
mov r15, rcx ; save outerlooop counter
mov rcx, Lengthof Array
dec rcx
mov rsi, 0
	innerLoop:
	mov r9, Array[rsi * 8]
	mov r11, rsi
	inc r11
	mov r10, Array[r11 * 8]
	cmp r9, r10
	jle ENDLOOP

	SWAP:
		mov r13, r9
		mov Array[rsi * 8], r10
		mov Array[(rsi * 8) + 8], r13

	ENDLOOP:
	inc rsi
	Loop innerLoop
mov rcx, r15
Loop OuterLoop

mov rcx, lengthof Array
mov rsi, 0
finaloop:
	mov rax, Array[rsi * 8]
	call WriteInt64
	inc rsi
loop finaloop

call ReadInt64

call ExitProcess
main endp
end