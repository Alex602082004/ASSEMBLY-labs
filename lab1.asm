;6. z=(a-(b*c/d))/(c+2-(a/b))+5

assume cs:code,ds:data
data segment
a db -1
b db -1
c db 1
d db 1
z db ?		;z=5
data ends
code segment
start:
mov ax,data
mov ds,ax

;b*c/d
mov al,b
mov bl,c
mul bl
mov bl,d
mov ah,0
div bl   ;al=b*a/d

;a-b*c/d
mov bl,a
sub bl,al
sbb bh,0  ;bx=a-b*c/d

;a/b
mov al,a
mov cl,b
mov ah,0 
div cl   ;al=a/b

;c+2-a/b
mov dl,c
add dl,2
sub dl,al
sbb dh,0  ;dx=c+2-a/b

;(a-b*c/d)/(c+2-a/b)+5
mov cx,dx
mov dx,0
mov ax,bx
div cx	; ax=tot
add ax,5
adc dl,0

;z=(a-b*c/d)/(c+2-a/b)+5

mov ax,4C00h
int 21h

code ends
end start
