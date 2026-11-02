1410330a0 0fb6c1 movzx eax, cl
1410330a3 c1e003 shl eax, 3
1410330a6 488d0d7b900905 lea rcx, [rip + 0x509907b]
1410330ad 488b1408 mov rdx, qword ptr [rax + rcx]
1410330b1 488d0d58930905 lea rcx, [rip + 0x5099358]
1410330b8 488b0408 mov rax, qword ptr [rax + rcx]
1410330bc c3 ret
