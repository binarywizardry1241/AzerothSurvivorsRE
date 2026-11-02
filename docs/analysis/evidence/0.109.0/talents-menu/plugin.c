/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry(undefined8 param_1,undefined8 param_2,undefined8 param_3,undefined8 param_4)

{
  code *pcVar1;
  undefined8 *puVar2;
  undefined4 *puVar3;
  undefined8 local_178;
  undefined8 uStack_170;
  undefined8 local_168;
  undefined8 uStack_160;
  undefined8 local_158;
  undefined8 uStack_150;
  undefined8 local_148;
  undefined8 uStack_140;
  undefined8 local_138;
  undefined8 uStack_130;
  undefined8 local_128;
  undefined8 uStack_120;
  undefined8 local_118;
  undefined8 uStack_110;
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

  func_0x000140002200(param_1,param_4);
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
    *(undefined8 *)(puVar3 + 0x40) = 0xffffffffffffffff;
    func_0x000144e1fc30();
    func_0x000140002200();
    puVar3 = (undefined4 *)func_0x0001400021c0();
    if (puVar3 == (undefined4 *)0x0) {
      func_0x000145d992a1();
    }
    else {
      *puVar3 = 0;
      *(undefined1 *)(puVar3 + 1) = 0;
      *(undefined8 *)(puVar3 + 0x40) = 0xffffffffffffffff;
      func_0x000144e1fc30();
      func_0x000140002200();
      puVar3 = (undefined4 *)func_0x0001400021c0();
      if (puVar3 != (undefined4 *)0x0) {
        *puVar3 = 0;
        *(undefined1 *)(puVar3 + 1) = 0;
        *(undefined8 *)(puVar3 + 0x40) = 0xffffffffffffffff;
        func_0x000144e1fc30();
        puVar2[0xc] = local_118;
        puVar2[0xd] = uStack_110;
        puVar2[10] = local_128;
        puVar2[0xb] = uStack_120;
        puVar2[8] = local_138;
        puVar2[9] = uStack_130;
        puVar2[6] = local_148;
        puVar2[7] = uStack_140;
        puVar2[4] = local_158;
        puVar2[5] = uStack_150;
        puVar2[2] = local_168;
        puVar2[3] = uStack_160;
        *puVar2 = local_178;
        puVar2[1] = uStack_170;
        puVar2[0xe] = CONCAT44(uStack_104,local_108);
        puVar2[0xf] = CONCAT44(uStack_fc,uStack_100);
        puVar2[0x10] = CONCAT44(uStack_f4,local_f8);
        puVar2[0x11] = CONCAT44(uStack_ec,uStack_f0);
        puVar2[0x12] = CONCAT44(uStack_e4,local_e8);
        puVar2[0x13] = CONCAT44(uStack_dc,uStack_e0);
        puVar2[0x14] = CONCAT44(uStack_d4,local_d8);
        puVar2[0x15] = CONCAT44(uStack_cc,uStack_d0);
        puVar2[0x16] = local_c8;
        puVar2[0x17] = uStack_c0;
        puVar2[0x18] = local_b8;
        puVar2[0x19] = uStack_b0;
        puVar2[0x1a] = local_a8;
        puVar2[0x1b] = uStack_a0;
        puVar2[0x1c] = local_98;
        puVar2[0x1d] = uStack_90;
        *(undefined4 *)(puVar2 + 0x1e) = local_88;
        *(undefined4 *)((long)puVar2 + 0xf4) = uStack_84;
        *(undefined4 *)(puVar2 + 0x1f) = uStack_80;
        *(undefined4 *)((long)puVar2 + 0xfc) = uStack_7c;
        *(undefined4 *)(puVar2 + 0x20) = local_78;
        *(undefined4 *)((long)puVar2 + 0x104) = uStack_74;
        *(undefined4 *)(puVar2 + 0x21) = uStack_70;
        *(undefined4 *)((long)puVar2 + 0x10c) = uStack_6c;
        *(undefined4 *)(puVar2 + 0x22) = local_68;
        *(undefined4 *)((long)puVar2 + 0x114) = uStack_64;
        *(undefined4 *)(puVar2 + 0x23) = uStack_60;
        *(undefined4 *)((long)puVar2 + 0x11c) = uStack_5c;
        puVar2[0x24] = local_58;
        puVar2[0x25] = uStack_50;
        puVar2[0x26] = local_48;
        puVar2[0x27] = uStack_40;
        puVar2[0x28] = local_38;
        puVar2[0x29] = uStack_30;
        func_0x0001400f7360();
        func_0x00014013d450();
        func_0x0001400b4130();
        return;
      }
      func_0x000145d992a1();
    }
  }
                    /* WARNING: Does not return */
  pcVar1 = (code *)invalidInstructionException();
  (*pcVar1)();
}
