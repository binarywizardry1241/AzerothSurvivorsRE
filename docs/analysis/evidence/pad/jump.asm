1401c15cc: 0fb6434f movzx eax, byte ptr [rbx + 0x4f]
1401c15d0: 4420e0 and al, r12b
1401c15d3: 89c1 mov ecx, eax
1401c15d5: 80e101 and cl, 1
1401c15d8: 884b4f mov byte ptr [rbx + 0x4f], cl
1401c15db: 3401 xor al, 1
1401c15dd: 4420e0 and al, r12b
1401c15e0: 44893f mov dword ptr [rdi], r15d
1401c15e3: 884615 mov byte ptr [rsi + 0x15], al
