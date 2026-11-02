140285760 4157 push r15
140285762 4156 push r14
140285764 4155 push r13
140285766 4154 push r12
140285768 56 push rsi
140285769 57 push rdi
14028576a 55 push rbp
14028576b 53 push rbx
14028576c 4881ec88020000 sub rsp, 0x288
140285773 4c89c7 mov rdi, r8
140285776 4889d6 mov rsi, rdx
140285779 4889cb mov rbx, rcx
14028577c 4c8ba424f0020000 mov r12, qword ptr [rsp + 0x2f0]
140285784 4c898c24c0000000 mov qword ptr [rsp + 0xc0], r9
14028578c 4c89a424c8000000 mov qword ptr [rsp + 0xc8], r12
140285794 4d85e4 test r12, r12
140285797 7454 je 0x1402857ed
140285799 4d89ce mov r14, r9
14028579c 4531ed xor r13d, r13d
14028579f 4c8d3d46b6b605 lea r15, [rip + 0x5b6b646]
1402857a6 488b2de3aadd07 mov rbp, qword ptr [rip + 0x7ddaae3]
1402857ad eb11 jmp 0x1402857c0
1402857af 90 nop
1402857b0 0fb64001 movzx eax, byte ptr [rax + 1]
1402857b4 4901c5 add r13, rax
1402857b7 4983c620 add r14, 0x20
1402857bb 49ffcc dec r12
1402857be 7430 je 0x1402857f0
1402857c0 ba03000000 mov edx, 3
1402857c5 4c89f9 mov rcx, r15
1402857c8 4d89f0 mov r8, r14
1402857cb e810558602 call 0x142aeace0
1402857d0 4885c0 test rax, rax
1402857d3 7503 jne 0x1402857d8
1402857d5 4889e8 mov rax, rbp
1402857d8 803801 cmp byte ptr [rax], 1
1402857db 74d3 je 0x1402857b0
1402857dd 31c0 xor eax, eax
1402857df 4901c5 add r13, rax
1402857e2 4983c620 add r14, 0x20
1402857e6 49ffcc dec r12
1402857e9 75d5 jne 0x1402857c0
1402857eb eb03 jmp 0x1402857f0
1402857ed 4531ed xor r13d, r13d
1402857f0 4c896c2438 mov qword ptr [rsp + 0x38], r13
1402857f5 488d05ecbdb605 lea rax, [rip + 0x5b6bdec]
1402857fc 4889842458020000 mov qword ptr [rsp + 0x258], rax
140285804 48c784246002000001000000 mov qword ptr [rsp + 0x260], 1
140285810 488d442438 lea rax, [rsp + 0x38]
140285815 4889842468020000 mov qword ptr [rsp + 0x268], rax
14028581d 488d05b4beb605 lea rax, [rip + 0x5b6beb4]
140285824 4889842470020000 mov qword ptr [rsp + 0x270], rax
14028582c 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140285835 488d15bcbeb605 lea rdx, [rip + 0x5b6bebc]
14028583c 488d4c2440 lea rcx, [rsp + 0x40]
140285841 4c8d8c2458020000 lea r9, [rsp + 0x258]
140285849 41b80c000000 mov r8d, 0xc
14028584f e85c6c6605 call 0x1458ec4b0
140285854 803e01 cmp byte ptr [rsi], 1
140285857 751a jne 0x140285873
140285859 8b4601 mov eax, dword ptr [rsi + 1]
14028585c 8b4e04 mov ecx, dword ptr [rsi + 4]
14028585f 894c2433 mov dword ptr [rsp + 0x33], ecx
140285863 89442430 mov dword ptr [rsp + 0x30], eax
140285867 488b4608 mov rax, qword ptr [rsi + 8]
14028586b 0fb64e10 movzx ecx, byte ptr [rsi + 0x10]
14028586f b201 mov dl, 1
140285871 eb10 jmp 0x140285883
140285873 488b4608 mov rax, qword ptr [rsi + 8]
140285877 f048ff00 lock inc qword ptr [rax]
14028587b 0f8ec4030000 jle 0x140285c45
140285881 31d2 xor edx, edx
140285883 4c8b442450 mov r8, qword ptr [rsp + 0x50]
140285888 4c898424e8000000 mov qword ptr [rsp + 0xe8], r8
140285890 0f10442440 movups xmm0, xmmword ptr [rsp + 0x40]
140285895 0f118424d8000000 movups xmmword ptr [rsp + 0xd8], xmm0
14028589d 0f100560beb605 movups xmm0, xmmword ptr [rip + 0x5b6be60]
1402858a4 0f118424ac000000 movups xmmword ptr [rsp + 0xac], xmm0
1402858ac c78424bc0000000000803f mov dword ptr [rsp + 0xbc], 0x3f800000
1402858b7 4c8b03 mov r8, qword ptr [rbx]
1402858ba 4c8d7308 lea r14, [rbx + 8]
1402858be 48c78424f000000000000000 mov qword ptr [rsp + 0xf0], 0
1402858ca 48c78424f800000004000000 mov qword ptr [rsp + 0xf8], 4
1402858d6 48c784240001000000000000 mov qword ptr [rsp + 0x100], 0
1402858e2 88942408010000 mov byte ptr [rsp + 0x108], dl
1402858e9 8b542430 mov edx, dword ptr [rsp + 0x30]
1402858ed 448b4c2433 mov r9d, dword ptr [rsp + 0x33]
1402858f2 89942409010000 mov dword ptr [rsp + 0x109], edx
1402858f9 44898c240c010000 mov dword ptr [rsp + 0x10c], r9d
140285901 4889842410010000 mov qword ptr [rsp + 0x110], rax
140285909 48898c2418010000 mov qword ptr [rsp + 0x118], rcx
140285911 c784242001000000005041 mov dword ptr [rsp + 0x120], 0x41500000
14028591c 66c78424240100009001 mov word ptr [rsp + 0x124], 0x190
140285926 c684242601000001 mov byte ptr [rsp + 0x126], 1
14028592e 0f108424ab000000 movups xmm0, xmmword ptr [rsp + 0xab]
140285936 0f11842427010000 movups xmmword ptr [rsp + 0x127], xmm0
14028593e 488b8424b8000000 mov rax, qword ptr [rsp + 0xb8]
140285946 4889842434010000 mov qword ptr [rsp + 0x134], rax
14028594e 0f10053b01b505 movups xmm0, xmmword ptr [rip + 0x5b5013b]
140285955 0f1184243c010000 movups xmmword ptr [rsp + 0x13c], xmm0
14028595d 8b053d01b505 mov eax, dword ptr [rip + 0x5b5013d]
140285963 8984244c010000 mov dword ptr [rsp + 0x14c], eax
14028596a f20f10052e7bb105 movsd xmm0, qword ptr [rip + 0x5b17b2e]
140285972 f20f11842450010000 movsd qword ptr [rsp + 0x150], xmm0
14028597b 4c898424d0000000 mov qword ptr [rsp + 0xd0], r8
140285983 4c8d3da6fab405 lea r15, [rip + 0x5b4faa6]
14028598a 488d4c2440 lea rcx, [rsp + 0x40]
14028598f 4c8d8424d0000000 lea r8, [rsp + 0xd0]
140285997 4c89f2 mov rdx, r14
14028599a 4d89f9 mov r9, r15
14028599d e84ed2f6ff call 0x1401f2bf0
1402859a2 0f57c0 xorps xmm0, xmm0
1402859a5 0f11842470010000 movups xmmword ptr [rsp + 0x170], xmm0
1402859ad 0f11842460010000 movups xmmword ptr [rsp + 0x160], xmm0
1402859b5 0f11842450010000 movups xmmword ptr [rsp + 0x150], xmm0
1402859bd 0f11842440010000 movups xmmword ptr [rsp + 0x140], xmm0
1402859c5 c784245002000000000000 mov dword ptr [rsp + 0x250], 0
1402859d0 c684245402000000 mov byte ptr [rsp + 0x254], 0
1402859d8 0f100501b9b605 movups xmm0, xmmword ptr [rip + 0x5b6b901]
1402859df 0f29442440 movaps xmmword ptr [rsp + 0x40], xmm0
1402859e4 48c744245000000000 mov qword ptr [rsp + 0x50], 0
1402859ed 0f100504b9b605 movups xmm0, xmmword ptr [rip + 0x5b6b904]
1402859f4 0f11442458 movups xmmword ptr [rsp + 0x58], xmm0
1402859f9 48c744246800000000 mov qword ptr [rsp + 0x68], 0
140285a02 0f100507b9b605 movups xmm0, xmmword ptr [rip + 0x5b6b907]
140285a09 0f29442470 movaps xmmword ptr [rsp + 0x70], xmm0
140285a0e 48c784248000000000000000 mov qword ptr [rsp + 0x80], 0
140285a1a 0f100507b9b605 movups xmm0, xmmword ptr [rip + 0x5b6b907]
140285a21 0f11842488000000 movups xmmword ptr [rsp + 0x88], xmm0
140285a29 48c784249800000000000000 mov qword ptr [rsp + 0x98], 0
140285a35 488b03 mov rax, qword ptr [rbx]
140285a38 488b8c2490000000 mov rcx, qword ptr [rsp + 0x90]
140285a40 48898c2428010000 mov qword ptr [rsp + 0x128], rcx
140285a48 488b8c2498000000 mov rcx, qword ptr [rsp + 0x98]
140285a50 48898c2430010000 mov qword ptr [rsp + 0x130], rcx
140285a58 488b8c2480000000 mov rcx, qword ptr [rsp + 0x80]
140285a60 48898c2418010000 mov qword ptr [rsp + 0x118], rcx
140285a68 488b8c2488000000 mov rcx, qword ptr [rsp + 0x88]
140285a70 48898c2420010000 mov qword ptr [rsp + 0x120], rcx
140285a78 0f28442440 movaps xmm0, xmmword ptr [rsp + 0x40]
140285a7d 0f284c2450 movaps xmm1, xmmword ptr [rsp + 0x50]
140285a82 0f28542460 movaps xmm2, xmmword ptr [rsp + 0x60]
140285a87 0f285c2470 movaps xmm3, xmmword ptr [rsp + 0x70]
140285a8c 0f119c2408010000 movups xmmword ptr [rsp + 0x108], xmm3
140285a94 0f119424f8000000 movups xmmword ptr [rsp + 0xf8], xmm2
140285a9c 0f118c24e8000000 movups xmmword ptr [rsp + 0xe8], xmm1
140285aa4 0f118424d8000000 movups xmmword ptr [rsp + 0xd8], xmm0
140285aac 48c784243801000000000000 mov qword ptr [rsp + 0x138], 0
140285ab8 f20f100510aab605 movsd xmm0, qword ptr [rip + 0x5b6aa10]
140285ac0 0f11842480010000 movups xmmword ptr [rsp + 0x180], xmm0
140285ac8 0f1005c9b8b605 movups xmm0, xmmword ptr [rip + 0x5b6b8c9]
140285acf 0f11842490010000 movups xmmword ptr [rsp + 0x190], xmm0
140285ad7 0f1005cab8b605 movups xmm0, xmmword ptr [rip + 0x5b6b8ca]
140285ade 0f118424a0010000 movups xmmword ptr [rsp + 0x1a0], xmm0
140285ae6 0f1005dbb8b605 movups xmm0, xmmword ptr [rip + 0x5b6b8db]
140285aed 0f118424c0010000 movups xmmword ptr [rsp + 0x1c0], xmm0
140285af5 0f1005bcb8b605 movups xmm0, xmmword ptr [rip + 0x5b6b8bc]
140285afc 0f118424b0010000 movups xmmword ptr [rsp + 0x1b0], xmm0
140285b04 0f1005ddb8b605 movups xmm0, xmmword ptr [rip + 0x5b6b8dd]
140285b0b 0f118424e0010000 movups xmmword ptr [rsp + 0x1e0], xmm0
140285b13 0f1005beb8b605 movups xmm0, xmmword ptr [rip + 0x5b6b8be]
140285b1a 0f118424d0010000 movups xmmword ptr [rsp + 0x1d0], xmm0
140285b22 0f1005dfb8b605 movups xmm0, xmmword ptr [rip + 0x5b6b8df]
140285b29 0f11842400020000 movups xmmword ptr [rsp + 0x200], xmm0
140285b31 0f1005c0b8b605 movups xmm0, xmmword ptr [rip + 0x5b6b8c0]
140285b38 0f118424f0010000 movups xmmword ptr [rsp + 0x1f0], xmm0
140285b40 0f2805c979b105 movaps xmm0, xmmword ptr [rip + 0x5b179c9]
140285b47 0f11842410020000 movups xmmword ptr [rsp + 0x210], xmm0
140285b4f c784242002000001000000 mov dword ptr [rsp + 0x220], 1
140285b5a f30f1005ae77b105 movss xmm0, dword ptr [rip + 0x5b177ae]
140285b62 0f13842424020000 movlps qword ptr [rsp + 0x224], xmm0
140285b6a c684242c02000001 mov byte ptr [rsp + 0x22c], 1
140285b72 48c784243002000000000000 mov qword ptr [rsp + 0x230], 0
140285b7e c78424380200000000803f mov dword ptr [rsp + 0x238], 0x3f800000
140285b89 66c784243c0200000000 mov word ptr [rsp + 0x23c], 0
140285b93 66c78424420200000000 mov word ptr [rsp + 0x242], 0
140285b9d c784243e02000000000100 mov dword ptr [rsp + 0x23e], 0x10000
140285ba8 66c78424480200000000 mov word ptr [rsp + 0x248], 0
140285bb2 c784244402000000000100 mov dword ptr [rsp + 0x244], 0x10000
140285bbd c784244a02000000000100 mov dword ptr [rsp + 0x24a], 0x10000
140285bc8 66c784244e0200000000 mov word ptr [rsp + 0x24e], 0
140285bd2 c684245502000005 mov byte ptr [rsp + 0x255], 5
140285bda 48898424d0000000 mov qword ptr [rsp + 0xd0], rax
140285be2 488d9c2458020000 lea rbx, [rsp + 0x258]
140285bea 4c8d8424d0000000 lea r8, [rsp + 0xd0]
140285bf2 4889d9 mov rcx, rbx
140285bf5 4c89f2 mov rdx, r14
140285bf8 4d89f9 mov r9, r15
140285bfb e81089f5ff call 0x1401de510
140285c00 488d8424c0000000 lea rax, [rsp + 0xc0]
140285c08 48898424d0000000 mov qword ptr [rsp + 0xd0], rax
140285c10 4889bc24d8000000 mov qword ptr [rsp + 0xd8], rdi
140285c18 4889b424e0000000 mov qword ptr [rsp + 0xe0], rsi
140285c20 488d9424d0000000 lea rdx, [rsp + 0xd0]
140285c28 4889d9 mov rcx, rbx
140285c2b e85065f8ff call 0x14020c180
140285c30 90 nop
140285c31 4881c488020000 add rsp, 0x288
140285c38 5b pop rbx
140285c39 5d pop rbp
140285c3a 5f pop rdi
140285c3b 5e pop rsi
140285c3c 415c pop r12
140285c3e 415d pop r13
140285c40 415e pop r14
140285c42 415f pop r15
140285c44 c3 ret
140285c45 0f0b ud2
