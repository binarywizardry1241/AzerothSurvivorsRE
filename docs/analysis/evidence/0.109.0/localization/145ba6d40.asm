; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x145ba6d40..0x145ba6d9a SHA256 bd85ea08c418c74f42b985e11454eff9fa75246ebd0a8d6caea4d9f18d336d9b
0x145ba6d40: push rbp
0x145ba6d41: push r14
0x145ba6d43: push rsi
0x145ba6d44: push rdi
0x145ba6d45: push rbx
0x145ba6d46: sub rsp, 0x50
0x145ba6d4a: lea rbp, [rsp + 0x50]
0x145ba6d4f: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145ba6d57: mov rdi, r9
0x145ba6d5a: mov rsi, rcx
0x145ba6d5d: mov rbx, qword ptr [rbp + 0x50]
0x145ba6d61: lea r14, [rbp - 0x28]
0x145ba6d65: mov rcx, r14
0x145ba6d68: call 0x145bcc5b0
0x145ba6d6d: nop
0x145ba6d6e: mov rcx, r14
0x145ba6d71: mov rdx, rdi
0x145ba6d74: mov r8, rbx
0x145ba6d77: call 0x145bb2b80
0x145ba6d7c: nop
0x145ba6d7d: movups xmm0, xmmword ptr [rbp - 0x28]
0x145ba6d81: movups xmm1, xmmword ptr [rbp - 0x18]
0x145ba6d85: movups xmmword ptr [rsi + 0x10], xmm1
0x145ba6d89: movups xmmword ptr [rsi], xmm0
0x145ba6d8c: mov rax, rsi
0x145ba6d8f: add rsp, 0x50
0x145ba6d93: pop rbx
0x145ba6d94: pop rdi
0x145ba6d95: pop rsi
0x145ba6d96: pop r14
0x145ba6d98: pop rbp
0x145ba6d99: ret
