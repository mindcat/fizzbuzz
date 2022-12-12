; FizzBuzz in assembly language

section .data

fizz db "Fizz", 0
buzz db "Buzz", 0
fizzbuzz db "FizzBuzz", 0

section .bss

num resb 4

section .text

global _start

_start:

; Initialize the counter to 1
mov dword [num], 1

; Loop until the counter is greater than 100
loop:
cmp dword [num], 100
jg done

; Print the current number, Fizz, Buzz, or FizzBuzz
mov eax, [num]

xor edx, edx
div 3
cmp edx, 0
je fizz

xor edx, edx
div 5
cmp edx, 0
je buzz

jmp print_num

fizz:
xor edx, edx
div 5
cmp edx, 0
je fizzbuzz

mov edx, fizz_len
mov ecx, fizz
mov ebx, 1
mov eax, 4
int 0x80

jmp next

buzz:
mov edx, buzz_len
mov ecx, buzz
mov ebx, 1
mov eax, 4
int 0x80

jmp next

fizzbuzz:
mov edx, fizzbuzz_len
mov ecx, fizzbuzz
mov ebx, 1
mov eax, 4
int 0x80

jmp next

print_num:
; Convert the number to a string
; and print it to the console

; Increment the counter
next:
inc dword [num]

; Loop
jmp loop

; Exit
done:
mov eax, 1
xor ebx, ebx
int 0x80
