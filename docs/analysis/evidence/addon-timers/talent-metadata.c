
void FUN_1458dde70(undefined8 *param_1)

{
  longlong *plVar1;
  longlong lVar2;
  longlong lVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  longlong *plVar6;
  char cStack_128;
  undefined4 uStack_127;
  undefined4 uStack_123;
  undefined4 uStack_11f;
  undefined4 uStack_11b;
  undefined4 uStack_117;
  undefined4 uStack_113;
  undefined4 uStack_10f;
  undefined4 uStack_10b;
  undefined4 uStack_107;
  undefined4 uStack_103;
  undefined4 uStack_ff;
  undefined4 uStack_fb;
  undefined3 uStack_f7;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  undefined8 uStack_e8;
  longlong lStack_e0;
  undefined8 uStack_d8;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  undefined4 uStack_c8;
  undefined4 uStack_c4;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 *puStack_60;
  longlong *plStack_58;
  longlong lStack_50;
  undefined8 uStack_48;

  uStack_48 = 0xfffffffffffffffe;
  uStack_c0 = 0;
  uStack_b8 = 4;
  uStack_b0 = 0;
  uStack_a8 = 0;
  uStack_a0 = 8;
  uStack_98 = 0;
  uStack_90 = 0;
  uStack_88 = 8;
  uStack_80 = 0;
  uStack_78 = 0;
  uStack_70 = 8;
  uStack_68 = 0;
  puStack_60 = param_1;
  FUN_145856170(&cStack_128);
  lStack_50 = CONCAT35((undefined3)uStack_123,CONCAT41(uStack_127,cStack_128));
  plVar6 = (longlong *)CONCAT35((undefined3)uStack_11b,CONCAT41(uStack_11f,uStack_123._3_1_));
  lVar2 = CONCAT35((undefined3)uStack_113,CONCAT41(uStack_117,uStack_11b._3_1_));
  plStack_58 = plVar6;
  if (lVar2 != 0) {
    plVar1 = plVar6 + lVar2 * 9;
    do {
      if ((char)plVar6[1] == -1) break;
      lVar2 = *plVar6;
      uStack_127 = *(undefined4 *)((longlong)plVar6 + 9);
      uStack_123 = *(undefined4 *)((longlong)plVar6 + 0xd);
      uStack_11f = *(undefined4 *)((longlong)plVar6 + 0x11);
      uStack_11b = *(undefined4 *)((longlong)plVar6 + 0x15);
      uStack_117 = *(undefined4 *)((longlong)plVar6 + 0x19);
      uStack_113 = *(undefined4 *)((longlong)plVar6 + 0x1d);
      uStack_10f = *(undefined4 *)((longlong)plVar6 + 0x21);
      uStack_10b = *(undefined4 *)((longlong)plVar6 + 0x25);
      uStack_107 = *(undefined4 *)((longlong)plVar6 + 0x29);
      uStack_103 = *(undefined4 *)((longlong)plVar6 + 0x2d);
      uStack_ff = *(undefined4 *)((longlong)plVar6 + 0x31);
      uStack_fb = *(undefined4 *)((longlong)plVar6 + 0x35);
      uStack_f4 = *(undefined4 *)((longlong)plVar6 + 0x3c);
      uStack_f0 = (undefined4)plVar6[8];
      uStack_ec = *(undefined4 *)((longlong)plVar6 + 0x44);
      uStack_f7 = (undefined3)((uint)(int)plVar6[7] >> 8);
      lVar3 = *(longlong *)(lVar2 + 0x40);
      uVar4 = *(undefined8 *)(lVar2 + 0x48);
      uVar5 = uVar4;
      cStack_128 = (char)plVar6[1];
      lStack_e0 = FUN_1458dff90(lVar3);
      if (lStack_e0 == 0) {
        uVar5 = uVar4;
        lStack_e0 = lVar3;
      }
      uStack_d0 = *(undefined4 *)(lVar2 + 0x50);
      uStack_cc = *(undefined4 *)(lVar2 + 0x54);
      uStack_c8 = *(undefined4 *)(lVar2 + 0x58);
      uStack_c4 = *(undefined4 *)(lVar2 + 0x5c);
      uStack_e8 = 0xffffffffffffffff;
      uStack_d8 = uVar5;
      FUN_1458ddbb0(&uStack_c0,&cStack_128,&uStack_e8);
      plVar6 = plVar6 + 9;
    } while (plVar6 != plVar1);
  }
  if (lStack_50 != 0) {
    func_0x0001400021d0(plStack_58,lStack_50 * 0x48,8);
  }
  puStack_60[10] = uStack_70;
  puStack_60[0xb] = uStack_68;
  puStack_60[8] = uStack_80;
  puStack_60[9] = uStack_78;
  puStack_60[6] = uStack_90;
  puStack_60[7] = uStack_88;
  puStack_60[4] = uStack_a0;
  puStack_60[5] = uStack_98;
  puStack_60[2] = uStack_b0;
  puStack_60[3] = uStack_a8;
  *puStack_60 = uStack_c0;
  puStack_60[1] = uStack_b8;
  return;
}
