14597c453: 4939de cmp r14, rbx
14597c456: 7441 je 0x14597c499
14597c458: 498b16 mov rdx, qword ptr [r14]
14597c45b: 4885d2 test rdx, rdx
14597c45e: 7439 je 0x14597c499
14597c460: 498b4618 mov rax, qword ptr [r14 + 0x18]
14597c464: 4d8b4608 mov r8, qword ptr [r14 + 8]
14597c468: 4d8b4e10 mov r9, qword ptr [r14 + 0x10]
14597c46c: 4889442420 mov qword ptr [rsp + 0x20], rax
14597c471: 4889f9 mov rcx, rdi
14597c474: e8e74df4ff call 0x1458c1260
14597c479: 90 nop
