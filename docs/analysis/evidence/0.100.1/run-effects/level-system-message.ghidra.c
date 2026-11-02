
/* WARNING: Removing unreachable block (ram,0x00014545de42) */
/* WARNING: Removing unreachable block (ram,0x00014545de6f) */

undefined8 * entry(void)

{
  code *pcVar1;
  undefined1 *puVar2;
  undefined8 *in_RCX;
  ulong in_R8;
  long lVar3;
  undefined4 local_7e;
  undefined2 local_7a;
  undefined8 local_40;

  func_0x000140002200();
  puVar2 = (undefined1 *)func_0x0001400021c0();
  if (puVar2 == (undefined1 *)0x0) {
    func_0x00014590379b();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  *puVar2 = 10;
  *(undefined4 *)(puVar2 + 1) = 0;
  *(undefined8 *)(puVar2 + 5) = 0;
  local_40 = CONCAT26(local_7a,CONCAT42(local_7e,0x96));
  *(int *)(puVar2 + 0xd) = (int)in_R8 + 1;
  if (in_R8 < 0x10) {
    if (in_R8 == 0) goto LAB_14545ddb7;
  }
  else {
    func_0x0001457744b0();
  }
  func_0x0001457731ed();
LAB_14545ddb7:
  if (in_R8 + 0x11 == 0x20) {
    func_0x000145903690();
  }
  puVar2[in_R8 + 0x11] = 0;
  lVar3 = in_R8 + 0x12;
  if (lVar3 == 0x20) {
    func_0x000145903690();
  }
  puVar2[lVar3] = 0;
  *in_RCX = 0x20;
  in_RCX[1] = puVar2;
  in_RCX[2] = lVar3 + 1;
  in_RCX[3] = local_40;
  return in_RCX;
}
