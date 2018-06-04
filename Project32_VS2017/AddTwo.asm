INCLUDE Irvine32.inc
WriteInt64 PROTO
WriteString PROTO
ReadString PROTO
ReadInt64 PROTO
Crlf PROTO 
.data
table BYTE '1'
    DWORD PRINT AND
EntrySize = ($-OprTable)
    BYTE '2'
    DWORD PRINT_OR
    BYTE '3'
    DWORD PRINT_NOT
    BYTE '5'
    DWORD PRINT_XOR
    BYTE '5'
    DWORD EXIT PROG
CountEntries = ($-table) / EntrySize
string1 BYTE "1. x and y", 0dh,0ah,0
string2 BYTE "2. x or y", 0dh,0ah,0
string3 BYTE "3. not x", 0dh,0ah,0
string4 BYTE "4. x xor y", 0dh,0ah,0
string5 BYTE "5. Exit", 0dh,0ah,0
stringEnter BYTE "Enter choice: ",0

stringAnd BYTE "AND operation",0
stringOr BYTE "OR operation",0
stringNot BYTE "NOT operation",0
stringXor BYTE "XOR operation",0
stringThank BYTE "Thank you ",0
.code
PROC
        call Clrscr
        mov edx, OFFSET string1
        callWriteString
        mov edx, OFFSET string2
        call WriteString
        mov edx, OFFSET string3
        call WriteString
        mov edx, OFFSET string4
        call WriteString
        mov edx, OFFSET string5
        call WriteString
        mov edx, OFFSET stringEnter
        call WriteString
        call ReadChar
        call WriteChar
        mov esi, OFFSET table
        mov ecx,CountEntries
        call Crlf

L1:
        cmp al,[esi]
        jne L2
        call NEAR PTR [esi + 1]
        call Crlf
        jmp L3
L2:
        add esi,EntrySize
        loop L1
L3:
        exit
main ENDP

PRINT_AND PROC
        mov edx, OFFSET stringAnd
        call WriteString
        ret
PRINT_AND ENDP

PRINT_OR PROC
        mov edx, OFFSET stringOr
        call WriteString
        ret
PRINT_OR ENDP

PRINT_NOT PROC
        mov edx, OFFSET stringNot
        call WriteString
        ret
PRINT_NOT ENDP

PRINT_XOR PROC
        mov edx, OFFSET stringXor
        call WriteString
        ret
PRINT_XOR ENDP

EXIT_PROG PROC
        mov edx, OFFSET stringThank
        call WriteString
        ret
        EXIT_PROG ENDP
        END main 
