ulong entry(undefined8 param_1,undefined8 param_2,ulong param_3,uint param_4,undefined8 param_5)

{
  ulong uVar1;
  uint uVar2;

  uVar2 = param_4 & 0xffff;
  uVar1 = CONCAT71((int7)((ulong)param_5 >> 8),1);
  if (uVar2 == 199 || 0x16 < (ushort)(param_4 - 0xb5)) {
    if ((ushort)(param_4 - 0xda) < 0x15) {
      uVar1 = (ulong)(0x100003 >> ((byte)(param_4 - 0xda) & 0x1f));
    }
    else {
      uVar1 = 0;
    }
  }
  if (0xfffd < param_3) {
    return 0;
  }
  if (uVar2 < 0x209) {
    if (uVar2 - 0x96 < 0x149) {
                    /* WARNING: Could not emulate address calculation at 0x000145ae0d43 */
                    /* WARNING: Treating indirect jump as call */
      uVar1 = (*(code *)((long)*(int *)((ulong)(uVar2 - 0x96) * 4 + 0x1472da60c) + 0x1472da60c))();
      return uVar1;
    }
    if (((uVar2 - 0x42 < 0x3c) && ((0x8000000a0408001U >> ((ulong)(uVar2 - 0x42) & 0x3f) & 1) != 0))
       || (uVar2 == 499)) goto LAB_145ae0d4c;
  }
  else if (uVar2 < 0x2c2) {
    if (((uVar2 - 0x209 < 0x2e) && ((0x200008000001U >> ((ulong)(uVar2 - 0x209) & 0x3f) & 1) != 0))
       || ((uVar2 - 0x24e < 0x2a && ((0x20000000005U >> ((ulong)(uVar2 - 0x24e) & 0x3f) & 1) != 0)))
       ) {
LAB_145ae0d4c:
      return (ulong)CONCAT31((int3)(param_4 - 0xb5 >> 8),1);
    }
  }
  else if (((uVar2 - 0x2c2 < 0x33) &&
           ((0x4000000010001U >> ((ulong)(uVar2 - 0x2c2) & 0x3f) & 1) != 0)) || (uVar2 == 0x321))
  goto LAB_145ae0d4c;
  return uVar1 & 0xffffff01;
}
