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
CBW
idiv bl   ;al=b*a/d

;a-b*c/d
mov bl,a
sub bl,al  ;bx=a-b*c/d

;a/b
mov al,a
mov cl,b
CBW 
idiv cl   ;al=a/b

;c+2-a/b
mov dl,c
add dl,2
sub dl,al  ;dx=c+2-a/b

;(a-b*c/d)/(c+2-a/b)+5
mov cx,dx
CWD
mov ax,bx
idiv cx	; ax=tot
add ax,5

;z=(a-b*c/d)/(c+2-a/b)+5

mov ax,4C00h
int 21h

code ends
end start
