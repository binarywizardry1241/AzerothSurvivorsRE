/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140830c10(undefined8 param_1,undefined8 param_2,undefined8 param_3)

{
  code *pcVar1;
  undefined8 *puVar2;
  undefined4 *puVar3;
  undefined4 local_108;
  undefined4 uStack_104;
  undefined4 uStack_100;
  undefined4 uStack_fc;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  undefined4 local_e8;
  undefined4 uStack_e4;
  undefined4 uStack_e0;
  undefined4 uStack_dc;
  undefined4 local_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined4 uStack_cc;
  undefined8 local_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  undefined8 uStack_b0;
  undefined8 local_a8;
  undefined8 uStack_a0;
  undefined8 local_98;
  undefined8 uStack_90;
  undefined4 local_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined4 uStack_7c;
  undefined4 local_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined4 local_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined8 local_58;
  undefined8 uStack_50;
  undefined8 local_48;
  undefined8 uStack_40;
  undefined8 local_38;
  undefined8 uStack_30;

  func_0x000140002200(param_1,param_3);
  puVar2 = (undefined8 *)func_0x0001400021c0();
  if (puVar2 == (undefined8 *)0x0) {
    func_0x000145d992a1();
                    /* WARNING: Does not return */
    pcVar1 = (code *)invalidInstructionException();
    (*pcVar1)();
  }
  func_0x000140002200();
  puVar3 = (undefined4 *)func_0x0001400021c0();
  if (puVar3 == (undefined4 *)0x0) {
    func_0x000145d992a1();
  }
  else {
    *puVar3 = 0;
    *(undefined1 *)(puVar3 + 1) = 0;
    puVar3[10] = 2;
    func_0x000144e1fc30();
    func_0x000140002200();
    puVar3 = (undefined4 *)func_0x0001400021c0();
    if (puVar3 != (undefined4 *)0x0) {
      *puVar3 = 0;
      *(undefined1 *)(puVar3 + 1) = 0;
      *(undefined8 *)(puVar3 + 0x40) = 0xffffffffffffffff;
      func_0x000144e1fc30();
      puVar2[0xc] = local_a8;
      puVar2[0xd] = uStack_a0;
      puVar2[10] = local_b8;
      puVar2[0xb] = uStack_b0;
      puVar2[8] = local_c8;
      puVar2[9] = uStack_c0;
      puVar2[6] = CONCAT44(uStack_d4,local_d8);
      puVar2[7] = CONCAT44(uStack_cc,uStack_d0);
      puVar2[4] = CONCAT44(uStack_e4,local_e8);
      puVar2[5] = CONCAT44(uStack_dc,uStack_e0);
      puVar2[2] = CONCAT44(uStack_f4,local_f8);
      puVar2[3] = CONCAT44(uStack_ec,uStack_f0);
      *puVar2 = CONCAT44(uStack_104,local_108);
      puVar2[1] = CONCAT44(uStack_fc,uStack_100);
      puVar2[0xe] = local_98;
      puVar2[0xf] = uStack_90;
      *(undefined4 *)(puVar2 + 0x10) = local_88;
      *(undefined4 *)((long)puVar2 + 0x84) = uStack_84;
      *(undefined4 *)(puVar2 + 0x11) = uStack_80;
      *(undefined4 *)((long)puVar2 + 0x8c) = uStack_7c;
      *(undefined4 *)(puVar2 + 0x12) = local_78;
      *(undefined4 *)((long)puVar2 + 0x94) = uStack_74;
      *(undefined4 *)(puVar2 + 0x13) = uStack_70;
      *(undefined4 *)((long)puVar2 + 0x9c) = uStack_6c;
      *(undefined4 *)(puVar2 + 0x14) = local_68;
      *(undefined4 *)((long)puVar2 + 0xa4) = uStack_64;
      *(undefined4 *)(puVar2 + 0x15) = uStack_60;
      *(undefined4 *)((long)puVar2 + 0xac) = uStack_5c;
      puVar2[0x16] = local_58;
      puVar2[0x17] = uStack_50;
      puVar2[0x18] = local_48;
      puVar2[0x19] = uStack_40;
      puVar2[0x1a] = local_38;
      puVar2[0x1b] = uStack_30;
      func_0x000144e9bf10();
      FUN_14058b3a0();
      func_0x00014013d550();
      FUN_14051a3a0();
      return;
    }
    func_0x000145d992a1();
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
