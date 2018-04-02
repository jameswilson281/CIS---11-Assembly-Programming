;5. Boolean Calculator (1)
;Create a program that functions as a simple boolean calculator for 32-bit integers. It should display
;a menu that asks the user to make a selection from the following list:
;1. x AND y
;2. x OR y
;3. NOT x
;4. x XOR y
;5. Exit program
;When the user makes a choice, call a procedure that displays the name of the operation about to
;be performed. You must implement this procedure using the Table-Driven Selection technique,
;shown in Section 6.5.4. (You will implement the operations in Exercise 6.) (The Irvine32 library
;is required for this solution program.)
  INCLUDE Irvine32.inc

  ExitProcess proto,dwExitCode:dword

  .data
  oprTable BYTE '1'
  DWORD Process_1
  EntrySize = ($-oprTable)
  BYTE '2'
  DWORD Process_2
  BYTE '3'
  DWORD Process_3
  BYTE '4'
  DWORD Process_4
  BYTE '5'
  DWORD Process_5
  CountEntries = ($_oprTable)/EntrySize

  str1 BYTE "1. xANDy",0
  str2 BYTE "2. xORy",0
  str3 BYTE "3. NOTx",0
  str4 BYTE "4. xXORy",0
  str5 BYTE "5. Exit program",0
  strCh BYTE "Enter your choice:",0

  strA BYTE "AND operation",0
  strO BYTE "OR operation",0
  strN BYTE "NOT operation",0
  strX BYTE "XOR operation",0

  .code
  main proc
  call Clrscr
  call DisplayMenu

  	invoke ExitProcess,0
  main endp
  end main

  DisplayMenu PROC USES edx
  mov ed x, OFFSET str1
  call WriteString
  call Crlf

  mov ed x, OFFSET str2
  call WriteString
  call Crlf

  mov ed x, OFFSET str3
  call WriteString
  call Crlf

  mov ed x, OFFSET str4
  call WriteString
  call Crlf

  mov ed x, OFFSET str5
  call WriteString
  call Crlf

  mov ed x, OFFSET strCh
  call WriteString
  call ReadChar

  mov esi, OFFSET oprTable
  mov ecx, CountEntries
  call DisplayOpr
  call Crlf
  ret
  DisplayMenu ENDP

;6. Boolean Calculator (2)
;Continue the solution program from Exercise 5 by implementing the following procedures:
;• AND_op: Prompt the user for two hexadecimal integers. AND them together and display the
;result in hexadecimal.
;• OR_op: Prompt the user for two hexadecimal integers. OR them together and display the
;result in hexadecimal.
;• NOT_op: Prompt the user for a hexadecimal integer. NOT the integer and display the result in
;hexadecimal.
;• XOR_op: Prompt the user for two hexadecimal integers. Exclusive-OR them together and
;display the result in hexadecimal.
;(The Irvine32 library is required for this solution program.)
  INCLUDE Irvine32.inc

  ExitProcess proto,dwExitCode:dword

  .data
  oprTable BYTE '1'
  DWORD Process_1
  EntrySize = ($-oprTable)
  BYTE '2'
  DWORD Process_2
  BYTE '3'
  DWORD Process_3
  BYTE '4'
  DWORD Process_4
  BYTE '5'
  DWORD Process_5
  BYTE '6'
  DWORD Process_6
  BYTE '7'
  DWORD Process_7
  BYTE '8'
  DWORD Process_8
  BYTE '9'
  DWORD Process_9
  CountEntries = ($_oprTable)/EntrySize

  str1 BYTE "1. xANDy",0
  str2 BYTE "2. xORy",0
  str3 BYTE "3. NOTx",0
  str4 BYTE "4. xXORy",0
  str5 BYTE "5. AND_op",0
  str6 BYTE "6. OR_op",0
  str7 BYTE "7. NOT_op",0
  str8 BYTE "8. XOR_op",0
  str9 BYTE "9. Exit program",0
  strCh BYTE "Enter your choice:",0

  strA BYTE "AND operation",0
  strO BYTE "OR operation",0
  strN BYTE "NOT operation",0
  strX BYTE "XOR operation",0
  strAop BYTE "AND_op operation",0
  strOop BYTE "OR_op operation",0
  strNop BYTE "NOT_op operation",0
  strXop BYTE "XOR_op operation",0

  .code
  main proc
  call Clrscr
  call DisplayMenu

  	invoke ExitProcess,0
  main endp
  end main

  DisplayMenu PROC USES edx
  mov ed x, OFFSET str1
  call WriteString
  call Crlf

  mov ed x, OFFSET str2
  call WriteString
  call Crlf

  mov ed x, OFFSET str3
  call WriteString
  call Crlf

  mov ed x, OFFSET str4
  call WriteString
  call Crlf

  mov ed x, OFFSET str5
  call WriteString
  call Crlf
  
  mov ed x, OFFSET str6
  call WriteString
  call Crlf
  
  mov ed x, OFFSET str7
  call WriteString
  call Crlf
  
  mov ed x, OFFSET str8
  call WriteString
  call Crlf
  
  mov ed x, OFFSET str9
  call WriteString
  call Crlf

  mov ed x, OFFSET strCh
  call WriteString
  call ReadChar

  mov esi, OFFSET oprTable
  mov ecx, CountEntries
  call DisplayOpr
  call Crlf
  ret
  DisplayMenu ENDP