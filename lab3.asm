;4.  Se da un sir de octeti S. Sa se construiasca sirul D astfel: 
;sa se puna mai intai elementele de pe pozitiile pare din S 
;iar apoi elementele de pe pozitiile impare din S. 
;Exemplu:
;S: 1, 2, 3, 4, 5, 6, 7, 8
;D: 1, 3, 5, 7, 2, 4, 6, 8

assume cs:code, ds:data	
data segment
s db 1,2,3,4
len equ $-s 
d db len dup (?)
data ends

code segment
start:
push data
pop ds

mov si,0
mov di,0
mov ax,len
mov dx,0
mov bl,2
div bl
cmp ax,len/2

je len_par

mov cx,len/2+1
repeta_par:
mov al,s[si]
mov d[di], al
add si,2
inc di
loop repeta_par

mov cx,len/2
mov si,1
repeta_impar:
mov al,s[si]
mov d[di],al
inc di
add si,2
loop repeta_impar

jmp final

len_par:
mov cx,len/2
par:
mov al,s[si]
mov d[di], al
add si,2
inc di
loop par

mov cx,len/2
mov si,1
impar:
mov al,s[si]
mov d[di],al
inc di
add si,2
loop impar

final:
mov ax,4C00h
int 21h

code ends
end start

