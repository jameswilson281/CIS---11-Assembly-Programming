; Fibonachi

ExitProcess proto
WriteString proto
WriteInt64 proto
ReadInt64 proto
Crlf proto
XYAND proto
XYOR proto
NOTX proto
XXORY proto
.data
	dispX BYTE "Enter a value for X: ",0
	dispY BYTE "Enter a value for Y: ",0
	disp0 BYTE "Your results are: ",0
	disp1 BYTE "1. x AND y",0
	disp2 BYTE "2. x OR y",0
	disp3 BYTE "3. NOT x",0
	disp4 BYTE "4. x XOR y",0
	disp5 BYTE "5. Exit program",0
	answer BYTE 0
	X BYTE 0
	Y BYTE 0
	result BYTE 2
.code
main proc
	mov rdx, OFFSET [dispX]
	call WriteString
	call Crlf
	call ReadInt64
	mov X, al
	mov rdx, OFFSET [dispY]
	call WriteString
	call Crlf
	call ReadInt64
	mov Y, al
	
	mov rdx, OFFSET [disp1]
	call WriteString
	call Crlf
	mov rdx, OFFSET [disp2]
	call WriteString
	call Crlf
	mov rdx, OFFSET [disp3]
	call WriteString
	call Crlf
	mov rdx, OFFSET [disp4]
	call WriteString
	call Crlf
	mov rdx, OFFSET [disp5]
	call WriteString
	call Crlf
	LOOP1:
	call ReadInt64
	call Crlf
	mov answer, al

	cmp al,1
	je op1
	cmp al,2
	je op2
	cmp al,3
	je op3
	cmp al,4
	je op4
	cmp al,5
	je Exit
	Loop LOOP1
	op1: call XYAND
		call Crlf
	jmp LOOP1
	op2: call XYOR
		call Crlf
	jmp LOOP1
	op3: call NOTX
		call Crlf
	jmp LOOP1
	op4: call XXORY
		call Crlf
	jmp LOOP1
	Exit: call ReadInt64
	call ExitProcess
main endp



XYAND proc 
	mov bl,X
	and bl,Y
	mov result, bl
	mov rdx, 0
	mov rdx, offset [disp0]
	call WriteString
	mov al, result
	call WriteInt64
ret
XYAND endp

XYOR proc
	mov bl,X
	or bl,Y
	mov result, bl
	mov rdx, 0
	mov rdx, offset [disp0]
	call WriteString
	mov al, result
	call WriteInt64
ret
XYOR endp

NOTX proc
	mov bl,X
	not bl
	mov result, bl
	mov rdx, 0
	mov rdx, offset [disp0]
	call WriteString
	mov al, result
	call WriteInt64
ret
NOTX endp

XXORY proc 
	mov bl,X
	xor bl,Y
	mov result, bl
	mov rdx, 0
	mov rdx, offset [disp0]
	call WriteString
	mov al, result
	call WriteInt64
ret
XXORY endp
end




;1. x AND y
;2. x OR y
;3. NOT x
;4. x XOR y
;5. Exit program