
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14076935d:     	movzbl	0x789b834(%rip), %eax   # 0x148004b98
140769364:     	testb	%al, %al
140769366:     	je	0x14076937b <.text+0x76837b>
140769368:     	movq	0x370(%rbp), %rbx
14076936f:     	movq	0x40(%rbx), %rax
140769373:     	movq	%rax, (%r11)
140769376:     	movq	%rax, %rcx
140769379:     	jmp	0x140769389 <.text+0x768389>
14076937b:     	movq	(%r11), %rcx
14076937e:     	movq	0x370(%rbp), %rbx
140769385:     	movq	0x40(%rbx), %rax
