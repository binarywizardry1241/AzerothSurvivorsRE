  cVar17 = *param_5;
  *param_5 = '\x01';
  if (cVar17 != '\x01') {
    func_0x000140569cf0(param_6,param_3,0x145db38c2,param_3,8,0x145db37bd);
    func_0x000140569cf0();
    func_0x000140569cf0();
    func_0x000140569cf0();
    func_0x000140569cf0();
    func_0x000140569cf0();
    func_0x000140569cf0();
    func_0x000140569cf0();
    func_0x000140569cf0();
  }
  func_0x00014056d3d0();
  bVar16 = true;
  bVar15 = true;

/* Ninth HUD CVar read; intervening reads omitted. */
  func_0x00014056d3d0();
  if (local_168 == -1) {
    bVar22 = true;
    bVar3 = *param_6;
  }
  else {
    auVar31 = func_0x0001400695f0();
    bVar22 = true;
    if (auVar31._8_8_ == 1) {
      bVar22 = *auVar31._0_8_ != '0';
    }
    if (local_168 != 0) {
      func_0x0001400021d0();
    }
    bVar3 = *param_6;
  }
  if ((bVar3 == 2) || (((bVar3 ^ bVar22) & 1) != 0)) {
    *param_6 = bVar22;
    if (*(long *)(param_3 + 0x90) != 0) {
      lVar7 = *(long *)(param_3 + 0x78);
      uVar8 = 0x16513d58b62b8a23;
      lVar10 = 0;
      while( true ) {
        uVar8 = uVar8 & *(ulong *)(param_3 + 0x80);
        auVar31 = *(undefined1 (*) [16])(lVar7 + uVar8);
