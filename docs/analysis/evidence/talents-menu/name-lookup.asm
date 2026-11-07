14590eac0: push      rsi
14590eac1: push      rdi
14590eac2: sub       rsp, 0x28
14590eac6: mov       rsi, qword ptr [rcx + 0x30]
14590eaca: mov       rdi, qword ptr [rcx + 0x38]
14590eace: mov       rcx, rsi
14590ead1: mov       rdx, rdi
14590ead4: call      0x1458ec500
14590ead9: test      rax, rax
14590eadc: cmove     rax, rsi
14590eae0: cmove     rdx, rdi
14590eae4: add       rsp, 0x28
14590eae8: pop       rdi
14590eae9: pop       rsi
14590eaea: ret
