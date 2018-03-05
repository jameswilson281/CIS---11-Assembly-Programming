; AddTwoSum_64.asm - Chapter 3 example.

ExitProcess proto
.data
sum qword 0
.code
main proc
   mov  eax,5
   mov  ebx,6   
   ;
   mov  ecx,eax
   mov  eax,ebx
   mov  ebx,ecx
   ;
   call ExitProcess
main endp
end