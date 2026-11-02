14580a550 xorps xmm0, xmm0
14580a553 cmp rdx, 0xd
14580a557 je 0x14580a628
14580a55d cmp rdx, 0xc
14580a561 je 0x14580a603
14580a567 cmp rdx, 9
14580a56b jne 0x14580a648
14580a571 movabs rax, 0x676172646f6f6c62
14580a57b xor rax, qword ptr [rcx]
14580a57e movzx edx, byte ptr [rcx + 8]
14580a582 xor rdx, 0x65
14580a586 or rdx, rax
14580a589 je 0x14580a652
14580a58f movabs rax, 0x7461665f6c616573
14580a599 xor rax, qword ptr [rcx]
14580a59c movzx edx, byte ptr [rcx + 8]
14580a5a0 xor rdx, 0x65
14580a5a4 or rdx, rax
14580a5a7 je 0x14580a61f
14580a5a9 movabs rax, 0x7269665f6c756f73
14580a5b3 xor rax, qword ptr [rcx]
14580a5b6 movzx edx, byte ptr [rcx + 8]
14580a5ba xor rdx, 0x65
14580a5be movss xmm1, dword ptr [rip + 0x6e4796]
14580a5c6 or rdx, rax
14580a5c9 je 0x14580a5ff
14580a5cb movabs rax, 0x6c6577746867696c
14580a5d5 xor rax, qword ptr [rcx]
14580a5d8 movzx edx, byte ptr [rcx + 8]
14580a5dc xor rdx, 0x6c
14580a5e0 or rdx, rax
14580a5e3 je 0x14580a65b
14580a5e5 movabs rax, 0x70726f6d796c6f70
14580a5ef xor rax, qword ptr [rcx]
14580a5f2 movzx ecx, byte ptr [rcx + 8]
14580a5f6 xor rcx, 0x68
14580a5fa or rcx, rax
14580a5fd jne 0x14580a648
14580a5ff movaps xmm0, xmm1
14580a602 ret
14580a603 movabs rax, 0x5f737265746e7568
14580a60d xor rax, qword ptr [rcx]
14580a610 mov ecx, dword ptr [rcx + 8]
14580a613 xor rcx, 0x6b72616d
14580a61a or rcx, rax
14580a61d jne 0x14580a648
14580a61f movss xmm0, dword ptr [rip + 0x6d5c89]
14580a627 ret
14580a628 movabs rax, 0x5f666f5f6c6c6163
14580a632 xor rax, qword ptr [rcx]
14580a635 movabs rdx, 0x656d616c665f666f
14580a63f xor rdx, qword ptr [rcx + 5]
14580a643 or rdx, rax
14580a646 je 0x14580a649
14580a648 ret
14580a649 movss xmm0, dword ptr [rip + 0x6d5ce7]
14580a651 ret
14580a652 movss xmm0, dword ptr [rip + 0x6d590a]
14580a65a ret
14580a65b movss xmm0, dword ptr [rip + 0x6d595d]
14580a663 ret
