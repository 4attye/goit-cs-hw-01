org  0x100               ; Вказуємо, що це програма .COM
section .data
    b db 6              
    c db 2             
    a db 4               
    resultMsg db 'Result: $' ; Визначення рядка для виведення результату

section .text
_start:
    mov al, [b]          
    sub al, [c]        
    add al, [a]         

    ; Перетворення результату в ASCII символ (для однозначних чисел)
    add al, 30h          ; Перетворюємо число в ASCII символ

    ; Виведення результату
    mov ah, 09h          ; Функція DOS для виведення рядка
    lea dx, resultMsg    ; Встановлюємо DX на адресу resultMsg
    int 21h              ; Виклик DOS-переривання

    ; Виведення числа
    mov dl, al           ; Поміщаємо результат в dl для виводу
    mov ah, 02h          ; Функція DOS для виводу символу
    int 21h              ; Виклик DOS-переривання

    ; Завершення програми
    mov ax, 4c00h        ; Функція DOS для завершення програми
    int 21h  