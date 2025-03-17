;6. Se dau doua cuvinte A si B. 
;Sa se obtina un octet C care are pe bitii 0-4 bitii 11-15 ai cuvântului A,
; iar pe bitii 5-7 bitii 2-4 ai cuvântului B.



assume cs:code,ds:data
data segment
a dw 1234h		; a15 a14 a13 a12 a11 a10 a9 a8 a7 a6 a5 a4 a3 a2 a1 a0
b dw 8765h		; b15 b14 b13 b12 b11 b10 b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
c db ?			; b4 b3 b2 a15 a14 a13 a12 a11

data ends
code segment
start:
mov ax,data
mov ds,ax	

mov ax,a
mov bx,b
ror ah,3
and ah,00011111b
add c,ah
rol bl,3
and bl,11100000b
add c,bl

mov ax,4C00h
int 21h

code ends
end start
