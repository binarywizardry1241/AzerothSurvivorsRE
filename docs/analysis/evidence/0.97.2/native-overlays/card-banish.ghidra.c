
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,char *param_3,undefined8 param_4,undefined8 param_5
          ,undefined8 param_6)

{
  undefined8 *puVar1;
  long lVar2;
  code *pcVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  uint uVar7;
  char *pcVar8;
  long lVar9;
  long extraout_RDX;
  byte bVar10;
  long *plVar11;
  char cVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  undefined4 uVar16;
  long in_stack_00000028;
  undefined8 local_298;
  undefined1 uStack_258;
  undefined7 uStack_257;
  undefined8 local_a0;
  long *local_88;
  long *local_80;

  pcVar8 = (char *)func_0x000142aed730(param_5,param_3,6,0x1458fdc30,param_6);
  if (pcVar8 == (char *)0x0) {
    pcVar8 = _DAT_1479bc7b8;
  }
  if (*pcVar8 == '\x01') {
    bVar10 = in_stack_00000028 != 0 & pcVar8[1];
  }
  else {
    bVar10 = 0;
  }
  uVar13 = 0;
  uVar14 = 0;
  uVar15 = 0;
  uVar16 = 0;
  func_0x0001401e3e60();
  uVar7 = uRam00000001458fe018;
  uVar6 = uRam00000001458fe014;
  uVar5 = uRam00000001458fe010;
  uVar4 = _DAT_1458fe00c;
  if (bVar10 == 0) {
    uStack_258 = (undefined1)uRam00000001458fe010;
    uStack_257 = (undefined7)(CONCAT44(uRam00000001458fe014,uRam00000001458fe010) >> 8);
    local_298 = CONCAT44(uRam00000001458fe010,_DAT_1458fe00c);
    if (local_88 == (long *)0x0) {
      local_88 = local_80;
    }
    lVar9 = local_88[2];
    if ((ulong)(*local_88 - lVar9) < 0x78) {
      func_0x000145757d40();
    }
    lVar2 = local_88[1];
    *(undefined8 *)(lVar2 + lVar9) = 0x14027f910;
    puVar1 = (undefined8 *)(lVar2 + 8 + lVar9);
    *puVar1 = local_298;
    puVar1[1] = CONCAT44(uVar7,uVar6);
    puVar1 = (undefined8 *)(lVar2 + 0x18 + lVar9);
    *puVar1 = CONCAT44(uVar4,0x3f800000);
    puVar1[1] = CONCAT44(uVar6,uVar5);
    puVar1 = (undefined8 *)(lVar2 + 0x28 + lVar9);
    *puVar1 = CONCAT44(0x3f800000,uVar7);
    puVar1[1] = CONCAT44(uVar5,uVar4);
    puVar1 = (undefined8 *)(lVar2 + 0x38 + lVar9);
    *puVar1 = CONCAT44(uVar7,uVar6);
    puVar1[1] = CONCAT44(uVar4,0x3f800000);
    puVar1 = (undefined8 *)(lVar2 + 0x48 + lVar9);
    *puVar1 = CONCAT71(uStack_257,uStack_258);
    puVar1[1] = CONCAT17(0x3f,CONCAT16(0x80,(uint6)uVar7));
    puVar1 = (undefined8 *)(lVar2 + 0x58 + lVar9);
    *puVar1 = CONCAT44(uVar14,uVar13);
    puVar1[1] = CONCAT44(uVar16,uVar15);
    *(undefined4 *)(lVar2 + 0x68 + lVar9) = 0x3ecccccd;
    *(undefined1 *)(lVar2 + 0x6c + lVar9) = 0;
    *(undefined8 *)(lVar2 + 0x70 + lVar9) = local_a0;
    local_88[2] = lVar9 + 0x78;
  }
  else {
    func_0x0001400c7a20();
    func_0x0001401fcfd0();
  }
  func_0x000145452350();
  if (extraout_RDX < 0) {
LAB_1400c1a52:
    func_0x0001458e721b();
                    /* WARNING: Does not return */
    pcVar3 = (code *)invalidInstructionException();
    (*pcVar3)();
  }
  if (extraout_RDX == 0) {
    cVar12 = *param_3;
    if (cVar12 == '\x01') goto LAB_1400c1a9c;
LAB_1400c1ac5:
    plVar11 = *(long **)(param_3 + 8);
    LOCK();
    lVar9 = *plVar11;
    *plVar11 = *plVar11 + 1;
    UNLOCK();
    if (*plVar11 == 0 || SCARRY8(lVar9,1) != *plVar11 < 0) goto LAB_1400c1d3d;
  }
  else {
    func_0x000140002200();
    lVar9 = func_0x0001400021c0();
    if (lVar9 == 0) goto LAB_1400c1a52;
    func_0x000145756ddd();
    cVar12 = *param_3;
    if (cVar12 != '\x01') goto LAB_1400c1ac5;
LAB_1400c1a9c:
    plVar11 = *(long **)(param_3 + 8);
  }
  func_0x0001401fe030();
  if (bVar10 != 0) {
    func_0x00014570bf80();
    if (cVar12 == '\0') {
      LOCK();
      lVar9 = *plVar11;
      *plVar11 = *plVar11 + 1;
      UNLOCK();
      if (*plVar11 == 0 || SCARRY8(lVar9,1) != *plVar11 < 0) {
LAB_1400c1d3d:
                    /* WARNING: Does not return */
        pcVar3 = (code *)invalidInstructionException();
        (*pcVar3)();
      }
    }
    func_0x0001401fe030();
  }
  return;
}
