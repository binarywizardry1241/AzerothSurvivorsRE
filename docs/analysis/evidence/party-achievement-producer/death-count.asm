145b95faf: 80be770c000000 cmp byte ptr [rsi + 0xc77], 0
145b95fb6: 0f8585000000 jne 0x145b96041
145b95fbc: 488d3de9f37001 lea rdi, [rip + 0x170f3e9]
145b95fc3: bb3c000000 mov ebx, 0x3c
145b95fc8: ba3c000000 mov edx, 0x3c
145b95fcd: 4889f9 mov rcx, rdi
145b95fd0: e82b3cf9ff call 0x145b29c00
145b95fd5: 4885c0 test rax, rax
145b95fd8: 480f45f8 cmovne rdi, rax
145b95fdc: 480f45da cmovne rbx, rdx
145b95fe0: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145b95fe9: 4c8d75e0 lea r14, [rbp - 0x20]
145b95fed: 41b908000000 mov r9d, 8
145b95ff3: 4c89f1 mov rcx, r14
145b95ff6: 4889fa mov rdx, rdi
145b95ff9: 4989d8 mov r8, rbx
145b95ffc: e8df3ff9ff call 0x145b29fe0
145b96001: 488d05e0f37001 lea rax, [rip + 0x170f3e0]
145b96008: 48894510 mov qword ptr [rbp + 0x10], rax
145b9600c: 48c7451806000000 mov qword ptr [rbp + 0x18], 6
145b96014: 48c745f800000000 mov qword ptr [rbp - 8], 0
145b9601c: 48c7450001000000 mov qword ptr [rbp], 1
145b96024: 48c7450800000000 mov qword ptr [rbp + 8], 0
145b9602c: c6452000 mov byte ptr [rbp + 0x20], 0
145b96030: 4889f1 mov rcx, rsi
145b96033: 4c89f2 mov rdx, r14
145b96036: e825fb0000 call 0x145ba5b60
145b9603b: ff866c0c0000 inc dword ptr [rsi + 0xc6c]
