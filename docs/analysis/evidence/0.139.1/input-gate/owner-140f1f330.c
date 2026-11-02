/* Static Ghidra raw-slice observation, not original source.
 * Target 0.139.1 SHA-256 1c0912276637a41a1a971886bb74626577d021af55a313128f85fdbfcc3b2f1d
 * Raw virtual entry 0x140f1f330; original Win64 operands require independent checking.
 * Evidence ev_24189c89dfc06fa7dc879ddadbaa54cbbb7f673778170b86bb7780b409519fca
 */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,long param_4)

{
  uint *puVar1;
  ulong uVar2;
  long lVar3;
  
  if (*(long *)(param_4 + 0x10) != 0) {
    puVar1 = (uint *)(*(long *)(param_4 + 8) + 0x40);
    uVar2 = (ulong)*puVar1;
    lVar3 = uVar2 - 0xc2;
    if (uVar2 < 0xc3) {
      lVar3 = 0;
    }
                    /* WARNING: Could not recover jumptable at 0x000140f1f3c9. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)(&DAT_146695010 + *(int *)(&DAT_146695010 + lVar3 * 4)))
              (*(long *)(param_4 + 8),puVar1,param_3,
               &DAT_146695010 + *(int *)(&DAT_146695010 + lVar3 * 4));
    return;
  }
  return;
}

