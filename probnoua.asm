;4. Se da un numar n (0<n<256) in segmentul de date. Sa se genereze 
;si sa se afiseze pe ecran secventa 3, 6, 9, ..., 3n-3, 3n.


assume cs:code, ds:data
data segment
n db 6
cnt db ?
aux dw 0
i dw ?
data ends

code segment 
start:
push data
pop ds

mov al,n
mov cnt,al
mov ax,3
mov i,3
numara:

determinare_cifre:
mov dx,0
mov bx,10
div bx
push dx
add aux,1
cmp ax,0
je afiseaza_cif
jne determinare_cifre

afiseaza_cif:
mov cx,aux
mov aux,0

repeta:
pop dx
add dl,48
mov ah,02h
int 21h

mov dl,','
mov ah,02h
int 21h

mov dl,' '
mov ah,02h
int 21h
loop repeta



add i,3
mov ax,i
sub cnt,1
cmp cnt,0
jne numara

mov ax,4C00h
int 21h

code ends
end start