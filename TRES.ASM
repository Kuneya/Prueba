title tres.asm Practica de procedimiento
.model small
.stack 100h
.data
name db "Fernando","$"
.code 
main proc
  mov ax, @data
  mov ds, ax
  
  mov dl,'F'
  mov ah, 2
  int 21h

  call salto

  mov dl,'E'
  mov ah,2
  int 21h

  call salto
  
  mov dl,'R'
  int 21h


  mov ah,4ch
  int 21h
main endp
salto proc
  push ax
  push dx
  mov dl, 10
  mov ah, 2
  int 21h
  pop dx
  pop ax
  ret
salto endp
end