1401c335c: 0fb6434f movzx eax, byte ptr [rbx + 0x4f]
1401c3360: 4420e0 and al, r12b
1401c3363: 89c1 mov ecx, eax
1401c3365: 80e101 and cl, 1
1401c3368: 884b4f mov byte ptr [rbx + 0x4f], cl
1401c336b: 3401 xor al, 1
1401c336d: 4420e0 and al, r12b
1401c3370: 44893f mov dword ptr [rdi], r15d
1401c3373: 884615 mov byte ptr [rsi + 0x15], al
