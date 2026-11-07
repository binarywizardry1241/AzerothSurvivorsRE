undefined1 FUN_14589c4d0(undefined8 param_1,undefined8 param_2,char param_3,long param_4)

{
  long lVar1;
  char *pcVar2;
  long lVar3;

  lVar3 = 0;
  do {
    if (*(long *)(param_4 + 0x88) * 0x50 == lVar3) {
      return 0;
    }
    lVar1 = lVar3 + 0x50;
    pcVar2 = (char *)(*(long *)(param_4 + 0x80) + lVar3);
    lVar3 = lVar1;
  } while (*pcVar2 != param_3);
  return *(undefined1 *)(*(long *)(param_4 + 0x80) + -0x4f + lVar1);
}
