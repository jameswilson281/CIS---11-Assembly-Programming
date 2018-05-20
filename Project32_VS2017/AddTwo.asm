; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
array DWORD 40,60,80,70
count DWORD ? ; for inner loop
indx DWORD 1 ; for storing index
.code
main proc
	mov ebx, OFFSET array
	mov ecx, LENGTHOF array

print1:
	mov eax,[ebx]
	call WriteInt
	add ebx, TYPE array
	loop print1

	mov ecx, LENGTHOF array
	mov esi, 0
	dec ecx

outer_loop:

	mov count, ecx

	; n - i - 1
	mov ecx,LENGTHOF array 
	sub ecx,indx
	sub ecx,1

inner_loop:
	mov eax,array[esi * TYPE array]
	cmp eax,array[esi * TYPE array + TYPE array]
	jle inner_end ; swap if false

	xchg eax,array[esi * TYPE array + type array]
	mov array[esi * TYPE array],eax

inner_end:
	loop inner_loop

; inner_loop end

	inc esi
	mov indx,esi
	mov ecx,count

	loop outer_loop
; outer_loop end

	mov esi, OFFSET array
	mov ecx, LENGTHOF array
print2:
	mov eax, [esi]
	call WriteInt
	add esi, TYPE array
	loop print2


	invoke ExitProcess,0
main endp
end main