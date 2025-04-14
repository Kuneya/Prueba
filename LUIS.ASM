title luis.asm
.model small
.stack 100h
.data
nombre db 'Luis','$'
fila db ?    ; defino fila como un byte que para empezar
             ;no s‚ que tiene
columna db ?
.code 
main proc
  mov ax,@data
  mov ds, ax
  
  mov fila,12   ;a fila le doy el valor de 12
  mov columna, 38
  mov bx, offset nombre
  mov si, 0

ciclo:
  call cursor
  mov al, [bx+si]
  cmp al,'$'
  je salir
  call retardo
  call imprime
  inc si
  inc fila   ;incremento en 1 a fila
  inc columna
  jmp ciclo

salir:
  mov ah,4ch
  int 21h

main endp
cursor proc
  push ax
  push bx
  push dx
  mov bh,0
  mov dh,fila
  mov dl,columna
  mov ah,2
  int 10h
  pop dx
  pop bx
  pop ax
  ret
cursor endp
retardo proc
  push cx
  push bx
  
  mov cx, 000Dh
otro1:
  mov bx, 0ffffh
otro:
  dec bx
  cmp bx, 0000h
  jnz otro
  dec cx
  cmp cx,0
  jnz otro1
  pop bx
  pop cx
  ret
retardo endp
imprime proc
  push bx
  push ax
  push cx
  mov bl, 0c7h
  mov bh,0
  mov cx,1
  mov ah,9
  int 10h
  pop cx
  pop ax
  pop bx
  ret   
imprime endp
end