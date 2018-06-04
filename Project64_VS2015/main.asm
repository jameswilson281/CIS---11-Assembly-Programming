Exit process Proto
Crlf       proto
WriteInt64    proto
.data
my array QWORD 5, 1, 4, 2, 8

.code 
main proc


;print array

mov rcx, LENGTHOF  myArray
mov rsi, 0




LOOOP:
mov rax, myArray[rsi * 8] ;call write64 prints out the value in rax
call WriteInt64
inc rsi

LOOP LOOOP
call Crlf

mov rcx,LENGTHOF myArray
OUTERLOOP:
	mov r15,rcx
	mov rcx,LENGTHOF myArray
	dec rcx
	mov rsi, 0


	INNERLOOP:
		mov r9 , myArray[rsi * 8]
		mov r11, rsi
		inc r11
		mov r10, myArray[r11 * 8]
		cmp r9, r10
		jle ENDLOOP ;if r9 is less than or equal to 10 it jumps


	SWAP:
			mov r13, r9
			mov myArray[r11 * 8], r10
			mov myArray[r11 * 8], r13
		
		END LOOP:
		inc rsi
	LOOP INNERLOOP
	mov rcx,r15
LOOP OUTERLOOP




call ExitProcess
main endp
endp