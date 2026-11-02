145b7c260 push r15
145b7c262 push r14
145b7c264 push r12
145b7c266 push rsi
145b7c267 push rdi
145b7c268 push rbx
145b7c269 sub rsp, 0x28
145b7c26d mov rsi, rdx
145b7c270 mov rbx, rcx
145b7c273 mov rdx, qword ptr [rcx + 8]
145b7c277 mov r14, qword ptr [rcx + 0x10]
145b7c27b mov r15, qword ptr [rsi]
145b7c27e mov rdi, qword ptr [rsi + 0x10]
145b7c282 mov rax, r15
145b7c285 sub rax, rdi
145b7c288 cmp rax, 3
145b7c28c jbe 0x145b7c3fd
145b7c292 mov r12, qword ptr [rsi + 8]
145b7c296 mov dword ptr [r12 + rdi], r14d
145b7c29a add rdi, 4
145b7c29e mov qword ptr [rsi + 0x10], rdi
145b7c2a2 mov rax, r15
145b7c2a5 sub rax, rdi
145b7c2a8 cmp r14, rax
145b7c2ab ja 0x145b7c420
145b7c2b1 test r14, r14
145b7c2b4 je 0x145b7c2c2
145b7c2b6 lea rcx, [r12 + rdi]
145b7c2ba mov r8, r14
145b7c2bd call 0x145d145fb
145b7c2c2 add rdi, r14
145b7c2c5 mov qword ptr [rsi + 0x10], rdi
145b7c2c9 mov r14, qword ptr [rbx + 0x60]
145b7c2cd sub r15, rdi
145b7c2d0 cmp r15, 7
145b7c2d4 jbe 0x145b7c444
145b7c2da mov qword ptr [r12 + rdi], r14
145b7c2de add rdi, 8
145b7c2e2 mov qword ptr [rsi + 0x10], rdi
145b7c2e6 mov rdx, qword ptr [rbx + 0x20]
145b7c2ea mov r15, qword ptr [rbx + 0x28]
145b7c2ee mov r12, qword ptr [rsi]
145b7c2f1 mov rax, r12
145b7c2f4 sub rax, rdi
145b7c2f7 cmp rax, 3
145b7c2fb jbe 0x145b7c462
145b7c301 mov r14, qword ptr [rsi + 8]
145b7c305 mov dword ptr [r14 + rdi], r15d
145b7c309 add rdi, 4
145b7c30d mov qword ptr [rsi + 0x10], rdi
145b7c311 mov rax, r12
145b7c314 sub rax, rdi
145b7c317 cmp r15, rax
145b7c31a ja 0x145b7c485
145b7c320 test r15, r15
145b7c323 je 0x145b7c331
145b7c325 lea rcx, [r14 + rdi]
145b7c329 mov r8, r15
145b7c32c call 0x145d145fb
145b7c331 add rdi, r15
145b7c334 mov qword ptr [rsi + 0x10], rdi
145b7c338 mov rdx, qword ptr [rbx + 0x38]
145b7c33c mov r15, qword ptr [rbx + 0x40]
145b7c340 mov rax, r12
145b7c343 sub rax, rdi
145b7c346 cmp rax, 3
145b7c34a jbe 0x145b7c4a9
145b7c350 mov dword ptr [r14 + rdi], r15d
145b7c354 add rdi, 4
145b7c358 mov qword ptr [rsi + 0x10], rdi
145b7c35c sub r12, rdi
145b7c35f cmp r15, r12
145b7c362 ja 0x145b7c4d0
145b7c368 test r15, r15
145b7c36b je 0x145b7c37b
145b7c36d add r14, rdi
145b7c370 mov rcx, r14
145b7c373 mov r8, r15
145b7c376 call 0x145d145fb
145b7c37b add rdi, r15
145b7c37e mov qword ptr [rsi + 0x10], rdi
145b7c382 mov r14, qword ptr [rbx + 0x68]
145b7c386 mov rax, qword ptr [rsi]
145b7c389 mov rcx, rax
145b7c38c sub rcx, rdi
145b7c38f cmp rcx, 7
145b7c393 jbe 0x145b7c4f1
145b7c399 mov rcx, qword ptr [rsi + 8]
145b7c39d mov qword ptr [rcx + rdi], r14
145b7c3a1 add rdi, 8
145b7c3a5 mov qword ptr [rsi + 0x10], rdi
145b7c3a9 mov rdx, qword ptr [rbx + 0x50]
145b7c3ad mov rbx, qword ptr [rbx + 0x58]
145b7c3b1 mov r8, rax
145b7c3b4 sub r8, rdi
145b7c3b7 cmp r8, 3
145b7c3bb jbe 0x145b7c50e
145b7c3c1 mov dword ptr [rcx + rdi], ebx
145b7c3c4 add rdi, 4
145b7c3c8 mov qword ptr [rsi + 0x10], rdi
145b7c3cc sub rax, rdi
145b7c3cf cmp rbx, rax
145b7c3d2 ja 0x145b7c535
145b7c3d8 test rbx, rbx
145b7c3db je 0x145b7c3e8
145b7c3dd add rcx, rdi
145b7c3e0 mov r8, rbx
145b7c3e3 call 0x145d145fb
145b7c3e8 add rdi, rbx
145b7c3eb mov qword ptr [rsi + 0x10], rdi
145b7c3ef add rsp, 0x28
145b7c3f3 pop rbx
145b7c3f4 pop rdi
145b7c3f5 pop rsi
145b7c3f6 pop r12
145b7c3f8 pop r14
145b7c3fa pop r15
145b7c3fc ret
145b7c3fd mov r8d, 4
145b7c403 mov rcx, rsi
145b7c406 mov r15, rdx
145b7c409 mov rdx, rdi
145b7c40c call 0x145e9e020
145b7c411 mov rdx, r15
145b7c414 mov r15, qword ptr [rsi]
145b7c417 mov rdi, qword ptr [rsi + 0x10]
145b7c41b jmp 0x145b7c292
145b7c420 mov rcx, rsi
145b7c423 mov r15, rdx
145b7c426 mov rdx, rdi
145b7c429 mov r8, r14
145b7c42c call 0x145e9e020
145b7c431 mov rdx, r15
145b7c434 mov rdi, qword ptr [rsi + 0x10]
145b7c438 mov r15, qword ptr [rsi]
145b7c43b mov r12, qword ptr [rsi + 8]
145b7c43f jmp 0x145b7c2b6
145b7c444 mov r8d, 8
145b7c44a mov rcx, rsi
145b7c44d mov rdx, rdi
145b7c450 call 0x145e9e020
145b7c455 mov r12, qword ptr [rsi + 8]
145b7c459 mov rdi, qword ptr [rsi + 0x10]
145b7c45d jmp 0x145b7c2da
145b7c462 mov r8d, 4
145b7c468 mov rcx, rsi
145b7c46b mov r14, rdx
145b7c46e mov rdx, rdi
145b7c471 call 0x145e9e020
145b7c476 mov rdx, r14
145b7c479 mov r12, qword ptr [rsi]
145b7c47c mov rdi, qword ptr [rsi + 0x10]
145b7c480 jmp 0x145b7c301
145b7c485 mov rcx, rsi
145b7c488 mov r14, rdx
145b7c48b mov rdx, rdi
145b7c48e mov r8, r15
145b7c491 call 0x145e9e020
145b7c496 mov rdx, r14
145b7c499 mov rdi, qword ptr [rsi + 0x10]
145b7c49d mov r12, qword ptr [rsi]
145b7c4a0 mov r14, qword ptr [rsi + 8]
145b7c4a4 jmp 0x145b7c325
145b7c4a9 mov r8d, 4
145b7c4af mov rcx, rsi
145b7c4b2 mov r14, rdx
145b7c4b5 mov rdx, rdi
145b7c4b8 call 0x145e9e020
145b7c4bd mov rdx, r14
145b7c4c0 mov rdi, qword ptr [rsi + 0x10]
145b7c4c4 mov r12, qword ptr [rsi]
145b7c4c7 mov r14, qword ptr [rsi + 8]
145b7c4cb jmp 0x145b7c350
145b7c4d0 mov rcx, rsi
145b7c4d3 mov r14, rdx
145b7c4d6 mov rdx, rdi
145b7c4d9 mov r8, r15
145b7c4dc call 0x145e9e020
145b7c4e1 mov rdx, r14
145b7c4e4 mov r14, qword ptr [rsi + 8]
145b7c4e8 mov rdi, qword ptr [rsi + 0x10]
145b7c4ec jmp 0x145b7c36d
145b7c4f1 mov r8d, 8
145b7c4f7 mov rcx, rsi
145b7c4fa mov rdx, rdi
145b7c4fd call 0x145e9e020
145b7c502 mov rax, qword ptr [rsi]
145b7c505 mov rdi, qword ptr [rsi + 0x10]
145b7c509 jmp 0x145b7c399
145b7c50e mov r8d, 4
145b7c514 mov rcx, rsi
145b7c517 mov r14, rdx
145b7c51a mov rdx, rdi
145b7c51d call 0x145e9e020
145b7c522 mov rdx, r14
145b7c525 mov rdi, qword ptr [rsi + 0x10]
145b7c529 mov rax, qword ptr [rsi]
145b7c52c mov rcx, qword ptr [rsi + 8]
145b7c530 jmp 0x145b7c3c1
145b7c535 mov rcx, rsi
145b7c538 mov r14, rdx
145b7c53b mov rdx, rdi
145b7c53e mov r8, rbx
145b7c541 call 0x145e9e020
145b7c546 mov rdx, r14
145b7c549 mov rcx, qword ptr [rsi + 8]
145b7c54d mov rdi, qword ptr [rsi + 0x10]
145b7c551 jmp 0x145b7c3dd
