145b64334 4180bda20c000004 cmp byte ptr [r13 + 0xca2], 4
145b6433c 740d je 0x145b6434b
145b6433e 8b85e8120000 mov eax, dword ptr [rbp + 0x12e8]
145b64344 410185140c0000 add dword ptr [r13 + 0xc14], eax
145b6434b 488bb510130000 mov rsi, qword ptr [rbp + 0x1310]
145b64352 4885f6 test rsi, rsi
145b64355 7460 je 0x145b643b7
145b64357 488bbd08130000 mov rdi, qword ptr [rbp + 0x1308]
145b6435e 48c1e604 shl rsi, 4
145b64362 4801fe add rsi, rdi
145b64365 eb12 jmp 0x145b64379
145b64367 660f1f840000000000 nop word ptr [rax + rax]
145b64370 4883c710 add rdi, 0x10
145b64374 4839f7 cmp rdi, rsi
145b64377 742c je 0x145b643a5
145b64379 488b07 mov rax, qword ptr [rdi]
145b6437c 493b85980b0000 cmp rax, qword ptr [r13 + 0xb98]
145b64383 74eb je 0x145b64370
145b64385 4180bd8f0c000000 cmp byte ptr [r13 + 0xc8f], 0
145b6438d 75e1 jne 0x145b64370
145b6438f 488b5708 mov rdx, qword ptr [rdi + 8]
145b64393 4c89e9 mov rcx, r13
145b64396 e8c5270500 call 0x145bb6b60
145b6439b 90 nop 
145b6439c 41ff85b8070000 inc dword ptr [r13 + 0x7b8]
145b643a3 ebcb jmp 0x145b64370
145b643a5 488b45b8 mov rax, qword ptr [rbp - 0x48]
145b643a9 488b4810 mov rcx, qword ptr [rax + 0x10]
145b643ad 4885c9 test rcx, rcx
145b643b0 7519 jne 0x145b643cb
145b643b2 e9d6000000 jmp 0x145b6448d
145b643b7 488d8520130000 lea rax, [rbp + 0x1320]
145b643be 488b4810 mov rcx, qword ptr [rax + 0x10]
145b643c2 4885c9 test rcx, rcx
145b643c5 0f84c2000000 je 0x145b6448d
145b643cb 488b5808 mov rbx, qword ptr [rax + 8]
145b643cf 488d0449 lea rax, [rcx + rcx*2]
145b643d3 4c8d34c3 lea r14, [rbx + rax*8]
145b643d7 498db518070000 lea rsi, [r13 + 0x718]
145b643de 498dbd30070000 lea rdi, [r13 + 0x730]
145b643e5 eb30 jmp 0x145b64417
145b643e7 660f1f840000000000 nop word ptr [rax + rax]
145b643f0 498b8538070000 mov rax, qword ptr [r13 + 0x738]
145b643f7 4b8d0c64 lea rcx, [r12 + r12*2]
145b643fb 44893c88 mov dword ptr [rax + rcx*4], r15d
145b643ff 0f13748804 movlps qword ptr [rax + rcx*4 + 4], xmm6
145b64404 49ffc4 inc r12
145b64407 4d89a540070000 mov qword ptr [r13 + 0x740], r12
145b6440e 4883c318 add rbx, 0x18
145b64412 4c39f3 cmp rbx, r14
145b64415 7476 je 0x145b6448d
145b64417 488b03 mov rax, qword ptr [rbx]
145b6441a 493b85980b0000 cmp rax, qword ptr [r13 + 0xb98]
145b64421 74eb je 0x145b6440e
145b64423 4180bd8f0c000000 cmp byte ptr [r13 + 0xc8f], 0
145b6442b 75e1 jne 0x145b6440e
145b6442d f20f10730c movsd xmm6, qword ptr [rbx + 0xc]
145b64432 f30f7e7b08 movq xmm7, qword ptr [rbx + 8]
145b64437 448b7b08 mov r15d, dword ptr [rbx + 8]
145b6443b 4d8ba528070000 mov r12, qword ptr [r13 + 0x728]
145b64442 4d3ba518070000 cmp r12, qword ptr [r13 + 0x718]
145b64449 7509 jne 0x145b64454
145b6444b 4889f1 mov rcx, rsi
145b6444e e81d6a4700 call 0x145fdae70
145b64453 90 nop 
145b64454 498b8520070000 mov rax, qword ptr [r13 + 0x720]
145b6445b 66420fd63ce0 movq qword ptr [rax + r12*8], xmm7
145b64461 49ffc4 inc r12
145b64464 4d89a528070000 mov qword ptr [r13 + 0x728], r12
145b6446b 4d8ba540070000 mov r12, qword ptr [r13 + 0x740]
145b64472 4d3ba530070000 cmp r12, qword ptr [r13 + 0x730]
145b64479 0f8571ffffff jne 0x145b643f0
145b6447f 4889f9 mov rcx, rdi
145b64482 e8d96d4700 call 0x145fdb260
145b64487 90 nop 
145b64488 e963ffffff jmp 0x145b643f0
