ExitProcess PROTO
Process_A PROTO
Process_B PROTO
Process_C PROTO
Process_D PROTO
Process_E PROTO
ReadChar PROTO
Crlf PROTO
WriteString PROTO

.data
CaseTable BYTE 'A' 
DWORD Process_A 
EntrySize = ($ - CaseTable)
BYTE 'B'
DWORD Process_B
BYTE 'C'
DWORD Process_C
BYTE 'D'
DWORD Process_D
BYTE 'E'
DWORD Process_E

NumberOfEntries = ($ - CaseTable) / EntrySize
prompt BYTE "Press choose one of the following: ", 0
optionA BYTE "A) ", 0
optionB BYTE "B) ", 0
optionC BYTE "C) ", 0
optionD BYTE "D) ", 0
optionE BYTE "E) ", 0
msgA BYTE "ProcessA", 0
msgB BYTE "ProcessB", 0
msgC BYTE "ProcessC", 0
msgD BYTE "ProcessD", 0
msgE BYTE "ProcessE", 0


.code
main proc
	mov rdx,OFFSET prompt 
	call WriteString
	call Crlf
	mov rdx,OFFSET optionA
	call WriteString
	call Crlf
	mov rdx,OFFSET optionB
	call WriteString
	call Crlf
	mov rdx,OFFSET optionC
	call WriteString
	call Crlf
	mov rdx,OFFSET optionD 
	call WriteString
	call Crlf
	mov rdx,OFFSET optionE 
	call WriteString
	call Crlf

	call ReadChar 
	mov rbx,OFFSET CaseTable 
	mov rcx,NumberOfEntries 

L1:
	cmp al,[rbx] 
	jne L2 
	call NEAR PTR [rbx + 1] 
	call WriteString 
	call Crlf
	jmp L3 

L2:
	add rbx,EntrySize ; point to the next entry
	loop L1 
L3:
	call exitProcess


Process_A PROC
	mov rdx,OFFSET msgA
	ret
Process_A ENDP

Process_B PROC
	mov rdx,OFFSET msgB
	ret
Process_B ENDP

Process_C PROC
	mov rdx,OFFSET msgC
	ret
Process_C ENDP

Process_D PROC
	mov rdx,OFFSET msgD
	ret
Process_D ENDP

Process_E PROC
	mov rdx,OFFSET msgE
	ret
Process_E ENDP

main endp
end