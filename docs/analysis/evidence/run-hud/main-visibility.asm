14028e55e 40f6c601 test sil, 1
14028e562 40b601 mov sil, 1
14028e565 7520 jne 0x14028e587
14028e567 400fb6c5 movzx eax, bpl
14028e56b 83e001 and eax, 1
14028e56e 488d1c40 lea rbx, [rax + rax*2]
14028e572 f644240401 test byte ptr [rsp + 4], 1
14028e577 b802000000 mov eax, 2
14028e57c 480f45d8 cmovne rbx, rax
14028e580 48035c2418 add rbx, qword ptr [rsp + 0x18]
14028e585 31f6 xor esi, esi
14028e587 0fb603 movzx eax, byte ptr [rbx]
14028e58a 3401 xor al, 1
