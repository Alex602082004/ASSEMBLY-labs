;3. Sa se înlocuiasca primii trei biti ai cuvântului B cu ultimii trei biti ai octetului A.

assume cs:code,ds:data
data segment

a db 7
b db 5 		;b7 b6 b5 b4 b3 a7 a6 a5

data ends
code segment
start:
mov ax,data
mov ds,ax

mov al,0
mov ah,0

mov al, a
mov bl, b
and bl,11111000b
ror al,5
and al,00000111b
add bl,al
mov b,bl

mov ax,4C00h
int 21h

code ends
end start