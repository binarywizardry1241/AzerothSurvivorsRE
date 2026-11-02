
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,long param_3,long param_4,undefined8 *param_5)

{
  undefined4 *puVar1;
  char cVar2;
  long *plVar3;
  long lVar4;
  code *pcVar5;
  char *pcVar6;
  long lVar7;
  long lVar8;
  ulong uVar9;
  ulong uVar10;
  long lVar11;
  char cVar12;
  long lVar13;
  undefined4 local_138;
  undefined4 uStack_134;
  undefined4 uStack_130;
  undefined4 uStack_12c;
  undefined8 local_108;
  undefined8 uStack_100;
  undefined8 local_f8;
  undefined8 local_e0;
  undefined8 local_d8;
  long local_c0;
  long local_b8;
  long local_b0;
  long local_a8;
  long local_a0;
  long local_98;
  long local_90;
  long local_88;
  long local_80;
  long local_78;
  long local_70;
  long local_68;
  long local_60;
  long local_58;

  plVar3 = (long *)*param_5;
  lVar11 = param_5[1];
  if (param_4 != param_3) {
    lVar4 = param_5[2];
    uVar10 = (ulong)(param_3 - param_4) >> 5;
    uVar9 = 0;
    do {
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      if (*pcVar6 == '\x03') {
        local_90 = *(long *)(pcVar6 + 0x18);
        if (local_90 < 0) {
LAB_1400750d6:
          func_0x000145eb6fcb();
          goto LAB_140075131;
        }
        if (local_90 == 0) goto LAB_140074a80;
        func_0x000140002200();
        local_98 = func_0x0001400021c0();
        if (local_98 == 0) goto LAB_1400750d6;
        func_0x000145d145fb();
      }
      else {
LAB_140074a80:
        local_98 = 1;
        local_90 = 0;
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      if (*pcVar6 == '\x03') {
        local_58 = *(long *)(pcVar6 + 0x18);
        if (local_58 < 0) {
LAB_1400750e7:
          func_0x000145eb6fcb();
          goto LAB_140075131;
        }
        if (local_58 == 0) goto LAB_140074b0d;
        func_0x000140002200();
        local_c0 = func_0x0001400021c0();
        if (local_c0 == 0) goto LAB_1400750e7;
        func_0x000145d145fb();
      }
      else {
LAB_140074b0d:
        local_c0 = 1;
        local_58 = 0;
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      if (*pcVar6 == '\x03') {
        local_88 = *(long *)(pcVar6 + 0x18);
        if (local_88 < 0) {
LAB_1400750f1:
          func_0x000145eb6fcb();
          goto LAB_140075131;
        }
        if (local_88 == 0) goto LAB_140074b94;
        func_0x000140002200();
        local_b8 = func_0x0001400021c0();
        if (local_b8 == 0) goto LAB_1400750f1;
        func_0x000145d145fb();
      }
      else {
LAB_140074b94:
        local_b8 = 1;
        local_88 = 0;
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      if (*pcVar6 == '\x03') {
        local_78 = *(long *)(pcVar6 + 0x18);
        if (local_78 < 0) {
LAB_1400750fb:
          func_0x000145eb6fcb();
          goto LAB_140075131;
        }
        if (local_78 == 0) goto LAB_140074c14;
        func_0x000140002200();
        local_80 = func_0x0001400021c0();
        if (local_80 == 0) goto LAB_1400750fb;
        func_0x000145d145fb();
      }
      else {
LAB_140074c14:
        local_80 = 1;
        local_78 = 0;
      }
      func_0x000142a769a0();
      func_0x0001400e2240();
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      if (*pcVar6 == '\x03') {
        local_70 = *(long *)(pcVar6 + 0x18);
        if (local_70 < 0) {
LAB_140075109:
          func_0x000145eb6fcb();
          goto LAB_140075131;
        }
        if (local_70 == 0) goto LAB_140074cf3;
        func_0x000140002200();
        local_b0 = func_0x0001400021c0();
        if (local_b0 == 0) goto LAB_140075109;
        func_0x000145d145fb();
      }
      else {
LAB_140074cf3:
        local_b0 = 1;
        local_70 = 0;
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      if (*pcVar6 == '\x03') {
        local_68 = *(long *)(pcVar6 + 0x18);
        if (local_68 < 0) {
LAB_140075113:
          func_0x000145eb6fcb();
          goto LAB_140075131;
        }
        if (local_68 == 0) goto LAB_140074d77;
        func_0x000140002200();
        local_a8 = func_0x0001400021c0();
        if (local_a8 == 0) goto LAB_140075113;
        func_0x000145d145fb();
      }
      else {
LAB_140074d77:
        local_a8 = 1;
        local_68 = 0;
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      if (*pcVar6 == '\x03') {
        local_60 = *(long *)(pcVar6 + 0x18);
        if (local_60 < 0) {
LAB_14007511d:
          func_0x000145eb6fcb();
          goto LAB_140075131;
        }
        if (local_60 == 0) goto LAB_140074dfb;
        func_0x000140002200();
        local_a0 = func_0x0001400021c0();
        if (local_a0 == 0) goto LAB_14007511d;
        func_0x000145d145fb();
      }
      else {
LAB_140074dfb:
        local_a0 = 1;
        local_60 = 0;
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      cVar12 = '\x01';
      if (*pcVar6 == '\x01') {
        cVar12 = pcVar6[1];
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      local_e0 = 1;
      if ((*pcVar6 == '\x02') && (*(long *)(pcVar6 + 8) == 0)) {
        local_e0 = *(undefined8 *)(pcVar6 + 0x10);
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      local_d8 = 5;
      if ((*pcVar6 == '\x02') && (*(long *)(pcVar6 + 8) == 0)) {
        local_d8 = *(undefined8 *)(pcVar6 + 0x10);
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      if (*pcVar6 == '\x01') {
        cVar2 = pcVar6[1];
      }
      else {
        cVar2 = '\0';
      }
      pcVar6 = (char *)func_0x000142a769a0();
      if (pcVar6 == (char *)0x0) {
        pcVar6 = _DAT_1481ea210;
      }
      if (*pcVar6 == '\x03') {
        lVar13 = *(long *)(pcVar6 + 0x18);
        if (lVar13 < 0) {
LAB_140075127:
          func_0x000145eb6fcb();
LAB_140075131:
                    /* WARNING: Does not return */
          pcVar5 = (code *)invalidInstructionException();
          (*pcVar5)();
        }
        if (lVar13 == 0) goto LAB_140074f66;
        func_0x000140002200();
        lVar7 = func_0x0001400021c0();
        if (lVar7 == 0) goto LAB_140075127;
        func_0x000145d145fb();
      }
      else {
LAB_140074f66:
        lVar7 = 1;
        lVar13 = 0;
      }
      lVar8 = lVar11 * 0xf0;
      *(long *)(lVar4 + lVar8) = local_90;
      *(long *)(lVar4 + 8 + lVar8) = local_98;
      *(long *)(lVar4 + 0x10 + lVar8) = local_90;
      *(long *)(lVar4 + 0x18 + lVar8) = local_58;
      *(long *)(lVar4 + 0x20 + lVar8) = local_c0;
      *(long *)(lVar4 + 0x28 + lVar8) = local_58;
      *(long *)(lVar4 + 0x30 + lVar8) = local_88;
      *(long *)(lVar4 + 0x38 + lVar8) = local_b8;
      *(long *)(lVar4 + 0x40 + lVar8) = local_88;
      local_138 = (undefined4)local_108;
      uStack_134 = (undefined4)((ulong)local_108 >> 0x20);
      uStack_130 = (undefined4)uStack_100;
      uStack_12c = (undefined4)((ulong)uStack_100 >> 0x20);
      puVar1 = (undefined4 *)(lVar4 + 0x48 + lVar8);
      *puVar1 = local_138;
      puVar1[1] = uStack_134;
      puVar1[2] = uStack_130;
      puVar1[3] = uStack_12c;
      *(undefined8 *)(lVar4 + 0x58 + lVar8) = local_f8;
      *(long *)(lVar4 + 0x60 + lVar8) = local_70;
      *(long *)(lVar4 + 0x68 + lVar8) = local_b0;
      *(long *)(lVar4 + 0x70 + lVar8) = local_70;
      *(long *)(lVar4 + 0x78 + lVar8) = local_68;
      *(long *)(lVar4 + 0x80 + lVar8) = local_a8;
      *(long *)(lVar4 + 0x88 + lVar8) = local_68;
      *(long *)(lVar4 + 0x90 + lVar8) = local_60;
      *(long *)(lVar4 + 0x98 + lVar8) = local_a0;
      *(long *)(lVar4 + 0xa0 + lVar8) = local_60;
      *(long *)(lVar4 + 0xa8 + lVar8) = lVar13;
      *(long *)(lVar4 + 0xb0 + lVar8) = lVar7;
      *(long *)(lVar4 + 0xb8 + lVar8) = lVar13;
      *(long *)(lVar4 + 0xc0 + lVar8) = local_78;
      *(long *)(lVar4 + 200 + lVar8) = local_80;
      *(long *)(lVar4 + 0xd0 + lVar8) = local_78;
      *(undefined8 *)(lVar4 + 0xd8 + lVar8) = local_e0;
      *(undefined8 *)(lVar4 + 0xe0 + lVar8) = local_d8;
      *(char *)(lVar4 + 0xe8 + lVar8) = cVar12;
      *(char *)(lVar4 + 0xe9 + lVar8) = cVar2;
      lVar11 = lVar11 + 1;
      uVar9 = uVar9 + 1;
    } while (uVar9 != uVar10);
  }
  *plVar3 = lVar11;
  return;
}
