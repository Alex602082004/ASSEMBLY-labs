;citire sir worduri
;afisare suma numerelor prime
;nimic afisare nu


assume cs:code, ds:data
data segment
sir dw 20,?,20 dup (?)
cnt dw 0
sum dw 0
aux db 2
cont db 1
zece db 10
data ends

code segment 
start:
push data
pop ds

mov ah,0Ah
mov dx,offset sir
int 21h

mov dl, 0Ah
mov ah, 02h
int 21h

mov si,2
mov ax,0
mov cx,0
verificaspace:
cmp byte ptr sir[si],13
je final
cmp byte ptr sir[si],' '
je skip
repeta:
mov bl, byte ptr sir[si]
sub bl,48

formare:
add al,bl
cmp byte ptr sir[si+1],' '
jne urm
inc si
jmp verificaspace
urm:
mul zece
inc si	
jmp verificaspace

skip: ;nr in ax
CBW
mov aux,2
mov cont,1
mov bl, cont
mov bh,0
mov cx,bx
mov bx,ax

prim:
mov cl,cont
mov ch,0
cmp bx,cx
je suma
mov ax,bx
div cont
cmp ah,0
je scade
inc cont
jmp prim

scade:
sub aux,1
inc cont
jmp prim

suma:
cmp aux,0
je aduna
mov aux,2
inc si
jmp verificaspace

aduna:
add sum, bx
inc si
jmp verificaspace

final:
mov ax,sum
determinare_cifre:
mov dx,0
mov bx,10
div bx
push dx
add cnt,1
cmp ax,0
je afiseaza_cif
jne determinare_cifre

afiseaza_cif:
mov cx,cnt
repeta1:
pop dx
add dl,48
mov ah,02h
int 21h
loop repeta1


mov ax,4C00h
int 21h

code ends
end start