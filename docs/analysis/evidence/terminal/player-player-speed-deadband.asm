1458fa0cf: 0f 28 dd                    	movaps	%xmm5, %xmm3
1458fa0d2: f3 0f 59 1d 66 45 4c 00     	mulss	0x4c4566(%rip), %xmm3   # 0x145dbe640
1458fa0da: 0f 28 cb                    	movaps	%xmm3, %xmm1
1458fa0dd: f3 41 0f 5c 8c 24 4c 05 00 00       	subss	0x54c(%r12), %xmm1
1458fa0e7: 0f 54 0d 52 0e 4a 00        	andps	0x4a0e52(%rip), %xmm1   # 0x145d9af40
1458fa0ee: 0f 2e 0d 9b 0d 4a 00        	ucomiss	0x4a0d9b(%rip), %xmm1   # 0x145d9ae90
1458fa0f5: 0f 86 8f 00 00 00           	jbe	0x1458fa18a <.text+0x58f918a>
