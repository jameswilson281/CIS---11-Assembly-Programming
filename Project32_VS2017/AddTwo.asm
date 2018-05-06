include Irvine32.inc

.data
CaseTable BYTE 'A'			
DWORD AndProcedure			
EntrySize = ($ - CaseTable)
BYTE 'B'
DWORD OrProcedure
BYTE 'C'
DWORD NotProcedure
BYTE 'D'
DWORD XorProcedure

NumberOfEntries = ($ - CaseTable) / EntrySize ; 
prompt BYTE "Enter A for 'x AND y', B for 'x OR y', C for 'NOT x', D for 'x XOR y' other key to exit the program: ",0
msgA BYTE "x AND y",0
msgB BYTE "x OR y",0
msgC BYTE "NOT x",0
msgD BYTE "x XOR y",0
hexVal DWORD ?
andMsg BYTE "Enter two hexadecimal integers to AND them",0
orMsg BYTE "Enter two hexadecimal integers to OR them",0
notMsg BYTE "Enter a hexadecimal integer to NOT it",0
xorMsg BYTE "Enter two hexadecimal integers to XOR them",0

.code
main proc

mov edx, offset prompt			
call WriteString				
call crlf

call ReadChar					
mov ebx, offset CaseTable		
mov ecx, NumberOfEntries		

L1:
	cmp al, [ebx] ; comparison
	jne L2 ; jump if no
	call NEAR PTR [ebx + 1] 
	jmp L3					; exit 

L2:
	add ebx, EntrySize		
	loop L1					

L3:
	exit 

main endp

AndProcedure proc
mov edx, offset andMsg
call WriteString		
call crlf			

call ReadHex			 
mov hexVal, eax			
call ReadHex		
call crlf
ret
AndProcedure endp

OrProcedure proc
mov edx, offset orMSg

call WriteString		
call crlf
ret
OrProcedure endp

NotProcedure proc
mov edx, offset notMSg
call WriteString		
call crlf		

call ReadHex			
NOT eax					
call WriteHex		
call crlf
ret
NotProcedure endp

XorProcedure proc
mov edx, offset xorMsg
call WriteString
call crlf

call ReadHex			
mov hexVal, eax			
call ReadHex		
XOR eax, hexVal			
call crlf
ret
XorProcedure endp
end main