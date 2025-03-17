;9. Se dau cuvintele A si B. Se cere cuvântul C:

;- bitii 0-4 ai lui C coincid cu bitii 0-4 ai lui A
;- bitii 5-8 ai lui C coincid cu bitii 5-8 ai lui B
;- bitii 9-15 ai lui C coincid cu bitii 9-15 ai lui A


assume cs:code,ds:data
data segment

a dw 1234h
b dw 8765h
c dw ?		; a15 a14 a13 a12 a11 a10 a9 b8 b7 b6 b5 a4 a3 a2 a1 

data ends
code segment
start:
mov ax,data
mov ds,ax

mov ax, a
mov bx, b
and ax,111111100001111b
and bx,000000011110000b
add ax,bx
mov c,ax

mov ax,4C00h
int 21h

code ends
end start
