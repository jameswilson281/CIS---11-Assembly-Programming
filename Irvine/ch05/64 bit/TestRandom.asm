ExitProcess proto
WriteInt64 proto
ReadInt64 proto
Crlf proto

.data
myArray QWORD 5, 1, 4, 2, 8, 10, 26, 13, 6

.code
main proc

  ;print array
  mov rcx, LENGTHOF myArray
  mov rsi, 0
  
  L1:
    mov rax, myArray[rsi]
    call WriteInt64
    add rsi, 8
  LOOP L1
 
  ;bubble sort array
 
  mov rcx, LENGTHOF myArray
  mov rsi, 0
  
  OUTERLOOP:
	mov r15, rcx
	mov rcx, LENGTHOF myArray
	dec rcx
	mov rsi, 0

	INNERLOOP:
		mov r9, myArray[rsi * 8]
		mov r11, rsi
		inc r11
		mov r10, myArray[r11 * 8]
		cmp r9, r10
		jl ENDLOOP
    
		SWAP:
			mov r13, r9
			mov myArray[rsi * 8], r10
			mov myArray[r11 * 8], r13
    
		ENDLOOP:
			inc rsi
    
	LOOP INNERLOOP

	mov rcx, r15
  LOOP OUTERLOOP
  
  ;print array
  mov rcx, LENGTHOF myArray
  mov rsi, 0
  
  call Crlf

  L2:
    mov rax, myArray[rsi]
    call WriteInt64
    add rsi, 8
  LOOP L2
 
 call ReadInt64

 main endp
 end