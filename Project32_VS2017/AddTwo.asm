INCLUDE Irvine32.inc
.data
rows BYTE ?
cols BYTE ?
RandomRow BYTE ?
RandomCol BYTE ?
.code
main proc

call GetMaxXY
mov rows,al
mov cols, dl

mov ecx, 100
L1:

movzx eax,rows
call RandomRange
mov RandomRow,al

movzx eax, cols
call RandomRange
mov RandomCol, al
			;AndPro
mov dh,RandomRow 	
mov dl,RandomCol 	
call Gotoxy

mov al, 'A'			;character to be displayed.
call WriteChar
call crlf

 

mov eax,100				
	call Delay		;Delays program by 100 ms
	LOOP L1
	


	invoke ExitProcess,0
main endp
end main