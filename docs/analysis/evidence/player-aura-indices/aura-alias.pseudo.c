
undefined4 FUN_14597a300(longlong *param_1,undefined8 param_2,byte param_3)

{
  bool bVar1;
  undefined1 auVar2 [16];
  undefined1 auVar3 [16];

  switch(param_2) {
  case 6:
    if ((param_3 == 1) &&
       (*(short *)((longlong)param_1 + 4) == 0x7972 && (int)*param_1 == 0x72756c46)) {
      return 0x3f98;
    }
    break;
  case 9:
    if ((param_3 == 0) && ((char)param_1[1] == 'd' && *param_1 == 0x6569666974726f46)) {
      return 0x367;
    }
    if ((param_3 == 0) && ((char)param_1[1] == 'k' && *param_1 == 0x6e694c206c756f53)) {
      return 0x4a54;
    }
    break;
  case 10:
    bVar1 = (short)param_1[1] == 0x646e;
    if ((param_3 == 0) && (bVar1 && *param_1 == 0x617453207473614c)) {
      return 0xa05;
    }
    if ((param_3 == 2) && (bVar1 && *param_1 == 0x617453207473614c)) {
      return 0x32af;
    }
    break;
  case 0xb:
    if ((param_3 == 2) &&
       (*(longlong *)((longlong)param_1 + 3) == 0x6874616544207461 && *param_1 == 0x6544207461656843
       )) {
      return 0x1508;
    }
    break;
  case 0xc:
    if ((param_3 == 0) && ((int)param_1[1] == 0x6566694c && *param_1 == 0x2064657373656c42)) {
      return 0x6c82;
    }
    break;
  case 0xd:
    if ((param_3 == 2) &&
       (*(longlong *)((longlong)param_1 + 5) == 0x6e6f6974616e7261 && *param_1 == 0x6e7261636e696552
       )) {
      return 0x5080;
    }
    break;
  case 0xe:
    if ((param_3 == 0) &&
       (*(longlong *)((longlong)param_1 + 6) == 0x7972657473614d20 && *param_1 == 0x4d20646c65696853
       )) {
      return 0x367;
    }
    break;
  case 0xf:
    if ((param_3 == 0) &&
       (*(longlong *)((longlong)param_1 + 7) == 0x7265646e65666544 && *param_1 == 0x4420746e65647241
       )) {
      return 0x6c82;
    }
    break;
  case 0x13:
    auVar3[0] = -(*(char *)((longlong)param_1 + 3) == 'i');
    auVar3[1] = -(*(char *)((longlong)param_1 + 4) == 'n');
    auVar3[2] = -(*(char *)((longlong)param_1 + 5) == 'e');
    auVar3[3] = -(*(char *)((longlong)param_1 + 6) == ' ');
    auVar3[4] = -(*(char *)((longlong)param_1 + 7) == 'I');
    auVar3[5] = -((char)param_1[1] == 'n');
    auVar3[6] = -(*(char *)((longlong)param_1 + 9) == 't');
    auVar3[7] = -(*(char *)((longlong)param_1 + 10) == 'e');
    auVar3[8] = -(*(char *)((longlong)param_1 + 0xb) == 'r');
    auVar3[9] = -(*(char *)((longlong)param_1 + 0xc) == 'v');
    auVar3[10] = -(*(char *)((longlong)param_1 + 0xd) == 'e');
    auVar3[0xb] = -(*(char *)((longlong)param_1 + 0xe) == 'n');
    auVar3[0xc] = -(*(char *)((longlong)param_1 + 0xf) == 't');
    auVar3[0xd] = -((char)param_1[2] == 'i');
    auVar3[0xe] = -(*(char *)((longlong)param_1 + 0x11) == 'o');
    auVar3[0xf] = -(*(char *)((longlong)param_1 + 0x12) == 'n');
    auVar2[0] = -((char)*param_1 == 'D');
    auVar2[1] = -(*(char *)((longlong)param_1 + 1) == 'i');
    auVar2[2] = -(*(char *)((longlong)param_1 + 2) == 'v');
    auVar2[3] = -(*(char *)((longlong)param_1 + 3) == 'i');
    auVar2[4] = -(*(char *)((longlong)param_1 + 4) == 'n');
    auVar2[5] = -(*(char *)((longlong)param_1 + 5) == 'e');
    auVar2[6] = -(*(char *)((longlong)param_1 + 6) == ' ');
    auVar2[7] = -(*(char *)((longlong)param_1 + 7) == 'I');
    auVar2[8] = -((char)param_1[1] == 'n');
    auVar2[9] = -(*(char *)((longlong)param_1 + 9) == 't');
    auVar2[10] = -(*(char *)((longlong)param_1 + 10) == 'e');
    auVar2[0xb] = -(*(char *)((longlong)param_1 + 0xb) == 'r');
    auVar2[0xc] = -(*(char *)((longlong)param_1 + 0xc) == 'v');
    auVar2[0xd] = -(*(char *)((longlong)param_1 + 0xd) == 'e');
    auVar2[0xe] = -(*(char *)((longlong)param_1 + 0xe) == 'n');
    auVar2[0xf] = -(*(char *)((longlong)param_1 + 0xf) == 't');
    auVar2 = auVar2 & auVar3;
    if ((param_3 == 2) &&
       ((ushort)((ushort)(SUB161(auVar2 >> 7,0) & 1) | (ushort)(SUB161(auVar2 >> 0xf,0) & 1) << 1 |
                 (ushort)(SUB161(auVar2 >> 0x17,0) & 1) << 2 |
                 (ushort)(SUB161(auVar2 >> 0x1f,0) & 1) << 3 |
                 (ushort)(SUB161(auVar2 >> 0x27,0) & 1) << 4 |
                 (ushort)(SUB161(auVar2 >> 0x2f,0) & 1) << 5 |
                 (ushort)(SUB161(auVar2 >> 0x37,0) & 1) << 6 |
                 (ushort)(SUB161(auVar2 >> 0x3f,0) & 1) << 7 |
                 (ushort)(SUB161(auVar2 >> 0x47,0) & 1) << 8 |
                 (ushort)(SUB161(auVar2 >> 0x4f,0) & 1) << 9 |
                 (ushort)(SUB161(auVar2 >> 0x57,0) & 1) << 10 |
                 (ushort)(SUB161(auVar2 >> 0x5f,0) & 1) << 0xb |
                 (ushort)(SUB161(auVar2 >> 0x67,0) & 1) << 0xc |
                 (ushort)(SUB161(auVar2 >> 0x6f,0) & 1) << 0xd |
                 (ushort)(SUB161(auVar2 >> 0x77,0) & 1) << 0xe |
                (ushort)(byte)(auVar2[0xf] >> 7) << 0xf) == 0xffff)) {
      return 0x4d29;
    }
  }
  return *(undefined4 *)(&DAT_146f44ec0 + (ulonglong)param_3 * 4);
}
