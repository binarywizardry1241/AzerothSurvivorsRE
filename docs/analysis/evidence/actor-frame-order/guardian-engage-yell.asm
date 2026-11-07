14597cc95: ba18000000 mov edx, 0x18
14597cc9a: 488d0dd5e98a01 lea rcx, [rip + 0x18ae9d5]
14597cca1: e85af8f6ff call 0x1458ec500
14597cca6: 90 nop 
14597cca7: 4885c0 test rax, rax
14597ccaa: 488d0dc5e98a01 lea rcx, [rip + 0x18ae9c5]
14597ccb1: 480f44c1 cmove rax, rcx
14597ccb5: b918000000 mov ecx, 0x18
14597ccba: 480f44d1 cmove rdx, rcx
14597ccbe: c6852b03000000 mov byte ptr [rbp + 0x32b], 0
14597ccc5: 4889542428 mov qword ptr [rsp + 0x28], rdx
14597ccca: 4889442420 mov qword ptr [rsp + 0x20], rax
14597cccf: 488d8d60020000 lea rcx, [rbp + 0x260]
14597ccd6: 4c89ea mov rdx, r13
14597ccd9: 4c8b85f0020000 mov r8, qword ptr [rbp + 0x2f0]
14597cce0: 4989d9 mov r9, rbx
14597cce3: e8c862f4ff call 0x1458c2fb0
14597cce8: 90 nop 
