org  0x100               ; Вказуємо, що це програма .COM

section .data
    a db 9              
    b db 6              
    c db 2              
    resultMsg db 'Result: $'  ; Визначення рядка для виведення результату

section .text
_start:
    ; Обчислення: b - c + a
    mov al, [b]          ; b
    sub al, [c]          ; b - c
    add al, [a]          ; b - c + a

    ; Перетворюємо число на десятки та одиниці
    mov bl, 10
    xor ah, ah         
    div bl             

    ; Виведення "Result: "
    mov ah, 09h
    lea dx, [resultMsg]
    int 21h

    ; Виводимо першу цифру
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    ; Виводимо другу цифру
    mov al, ah         
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    ; Завершення програми
    mov ax, 4c00h
    int 21h
