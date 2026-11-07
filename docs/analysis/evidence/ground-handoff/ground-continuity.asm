1411a4111: test rcx, rcx
1411a4114: mov dword ptr [rbp + 0x580], eax
1411a411a: je 0x1411a453d
1411a4120: mov eax, dword ptr [rcx + 0x48]
1411a4123: mov dword ptr [rbp + 0x57c], eax
1411a4129: mov rax, qword ptr [rcx + 0x28]
1411a412d: mov qword ptr [rbp + 0x500], rax
1411a4134: mov eax, dword ptr [rcx + 0x30]
1411a4137: mov dword ptr [rbp + 0x5cc], eax
1411a413d: mov rax, qword ptr [rbp + 0x568]
1411a4144: test rax, rax
1411a4147: je 0x1411a4547
1411a414d: mov eax, dword ptr [rax + 0x10]
1411a4150: cmp eax, -1
1411a4153: je 0x1411a4547
1411a4159: mov ecx, dword ptr [rbp + 0x57c]
1411a415f: mov rdx, qword ptr [rbp + 0x568]
1411a4166: cmp dword ptr [rdx], ecx
1411a4168: jne 0x1411a4547
1411a416e: cmp eax, dword ptr [rbp + 0x5cc]
1411a4174: jne 0x1411a4547
1411a417a: mov rax, qword ptr [rbp + 0x500]
1411a4181: mov rcx, qword ptr [rbp + 0x568]
1411a4188: cmp qword ptr [rcx + 8], rax
1411a418c: jne 0x1411a4547
