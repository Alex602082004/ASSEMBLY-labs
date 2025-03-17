;4. Se da un sir de litere mari si mici. Sa se afiseze literele mici pe ecran si 
;sa se afiseze numarul acestor litere pe ecran.


assume cs:code, ds:data
data segment
sir db 'AIaprAofDehasmkaAD'
len equ $-sir
d db len dup(0)
cnt db 0
ccnt db 0
zece db 10
data ends

code segment 
start:
push data
pop ds
	
mov si,0
mov di,0
mov cx,len

repeta:
mov al,byte ptr sir[si]
cmp si,len
je final
cmp al,96
ja opus

inc si
jmp repeta


opus:
cmp al,123
jb adauga

inc si
jmp repeta



adauga:
mov d[di],al
inc di
inc si
inc cnt
loop repeta

final:
mov byte ptr d[di],'$'
mov ah,09h
mov dx, offset d
int 21h

mov ah,02h
mov dl,' '
int 21h

mov al,cnt
mov ah,0

cifre:
mov dx,0
mov bx,10
div bx
push dx
inc ccnt
cmp ax,0
je afisare
jne cifre

afisare:
mov cl,ccnt
mov ch,0
iar:
pop dx
add dl,48

mov ah,02h
int 21h
loop iar



mov ax,4C00h
int 21h

code ends
end start