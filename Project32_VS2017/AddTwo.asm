;Random A screen

include Irvine32.inc
.data
rows BYTE 0
columns BYTE 0
RandomRow BYTE 0
RandomColumn BYTE 0

.code
main proc

call GetMaxXY 
mov rows,al
mov columns, dl
mov ecx, 100

myLoop:
movzx eax,rows
call RandomRange
mov RandomRow,al

movzx eax, columns
call RandomRange
mov RandomColumn, al

mov dh,RandomRow 
mov dl,RandomColumn 
call Gotoxy

mov al, 'A'			
call WriteChar
call crlf

mov eax,100				
call Delay
	
	loop myLoop

invoke ExitProcess,0
main endp
end main