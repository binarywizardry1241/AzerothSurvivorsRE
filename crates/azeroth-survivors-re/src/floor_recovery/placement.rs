//! Current145530130 placement rotation, preserving the SIMD operation order.
//! The fixed 90-degree reorientation and Euler conversions are target constants.
//! Host sin/cos bit parity with Windows CRT remains a separate validation.
pub fn matrix(rotation: [f32; 3]) -> [f32; 9] {
    let heading = rotation[1] * f32::from_bits(0x3c8e_fa35) + f32::from_bits(0xc049_0fdb);
    let roll = rotation[2] * f32::from_bits(0x3c8e_fa35) + f32::from_bits(0xbfc9_0fdb);
    let pitch = rotation[0] * f32::from_bits(0xbc8e_fa35);
    let v0 = [pitch.sin(), 0.0, 0.0, 0.0];
    let v6 = [pitch.cos(), 0.0, 0.0, 0.0];
    let v8 = [roll.sin(), 0.0, 0.0, 0.0];
    let v10 = [roll.cos(), 0.0, 0.0, 0.0];
    let v9 = [heading.sin(), 0.0, 0.0, 0.0];
    let v15 = [heading.cos(), 0.0, 0.0, 0.0];
    let v12 = [0.0; 4];
    let v7 = [v9[0] * f32::from_bits(0x333b_bd2e), 0.0, 0.0, 0.0];
    let s50 = v10;
    let s60 = [v15[0] + v12[0], 0.0, 0.0, 0.0];
    let v14 = v0;
    let v3 = v0;
    let v3 = [v3[0] * v12[0], v3[1], v3[2], v3[3]];
    let v13 = [0.0; 4];
    let v13 = [v3[0], v13[1], v13[2], v13[3]];
    let v0 = v6;
    let v0 = [v0[0], v8[0], v0[1], v8[1]];
    let v2 = v15;
    let s90 = v15;
    let v1 = v15;
    let v1 = [v1[0], v1[1], v10[0], v10[1]];
    let v0 = [v0[0], v0[1], v1[2], v1[0]];
    let v1 = v6;
    let v4 = v6;
    let v1 = [v1[0] - v3[0], v1[1] - v3[1], v1[2] - v3[2], v1[3] - v3[3]];
    let v13 = [
        v13[0] * v0[0],
        v13[1] * v0[1],
        v13[2] * v0[2],
        v13[3] * v0[3],
    ];
    let v15 = v13;
    let v5 = v13;
    let v5 = [v1[0], v5[1], v5[2], v5[3]];
    let s80 = v5;
    let v15 = [v15[2], v15[0], v9[0], v9[0]];
    let v1 = v2;
    let v1 = [v1[0], v1[1], v9[3], v9[3]];
    let s70 = v9;
    let v5 = v15;
    let v15 = [v15[2], v15[0], v1[0], v1[2]];
    let v15 = [v15[0], v15[1], v15[2], v15[0]];
    let v1 = [0.0; 4];
    let v15 = [
        v15[0] * v1[0],
        v15[1] * v1[1],
        v15[2] * v1[2],
        v15[3] * v1[3],
    ];
    let v2 = v15;
    let v2 = [v2[2], v2[3], v15[2], v15[3]];
    let v2 = [v2[0] + v12[0], v2[1], v2[2], v2[3]];
    let v2 = [v2[0] + v7[0], v2[1], v2[2], v2[3]];
    let v5 = [v5[2], v5[0], v9[2], v9[3]];
    let v5 = [v5[0] + v1[0], v5[1] + v1[1], v5[2] + v1[2], v5[3] + v1[3]];
    let v5 = [v5[0], v5[1], v15[2], v15[3]];
    let v7 = v5;
    let v7 = [v7[2], v7[0], v0[1], v0[3]];
    let v7 = [v7[0], v7[2], v7[1], v7[3]];
    let v9 = v5;
    let v9 = [v9[0] + v7[0], v9[1] + v7[1], v9[2] + v7[2], v9[3] + v7[3]];
    let v5 = [v5[0] - v7[0], v5[1] - v7[1], v5[2] - v7[2], v5[3] - v7[3]];
    let v11 = [0.0; 4];
    let v11 = [v11[0], v11[3], v13[1], v13[2]];
    let v7 = [v13[1], v13[1], v13[3], v13[3]];
    let v15 = [v15[3], v15[3], v15[3], v15[3]];
    let v10 = s60;
    let v10 = [v10[0] - v15[0], v10[1], v10[2], v10[3]];
    let v15 = [v15[0] + v12[0], v15[1], v15[2], v15[3]];
    let v12 = [v12[0] - v7[0], v12[1], v12[2], v12[3]];
    let v6 = s50;
    let v12 = [v12[0] + v6[0], v12[1], v12[2], v12[3]];
    let v13 = v12;
    let v13 = [v13[0], v13[1], v5[3], v5[3]];
    let v7 = v5;
    let v7 = [v7[3], v7[0], v9[2], v9[0]];
    let v5 = v9;
    let v5 = [v5[0], v5[1], v7[2], v7[0]];
    let v7 = [v6[0], v6[1], 0.0, 0.0];
    let v7 = [v7[2], v7[0], v1[2], v1[3]];
    let v0 = [v4[0], v4[0], v4[2], v4[2]];
    let v0 = [v0[0] * v7[0], v0[1] * v7[1], v0[2] * v7[2], v0[3] * v7[3]];
    let v7 = v4;
    let v7 = [v7[0] * v8[0], v7[1], v7[2], v7[3]];
    let v4 = v14;
    let v4 = [v4[0], v3[0], v4[1], v3[1]];
    let v3 = [v3[0] - v7[0], v3[1], v3[2], v3[3]];
    let v4 = [v4[0] + v0[0], v4[1] + v0[1], v4[2] + v0[2], v4[3] + v0[3]];
    let v3 = [v3[0], v3[0], v4[3], v4[0]];
    let v4 = [v4[0], v4[1], v3[0], v3[2]];
    let v4 = [v4[0], v4[1], v4[2], v4[0]];
    let v11 = [v11[0], v11[2], v11[3], v11[1]];
    let v11 = [
        v11[0] + v4[0],
        v11[1] + v4[1],
        v11[2] + v4[2],
        v11[3] + v4[3],
    ];
    let v8 = [v8[0] * v14[0], v8[1], v8[2], v8[3]];
    let v14 = [v14[0] * v6[0], v14[1], v14[2], v14[3]];
    let v8 = [v8[0] + v0[0], v8[1], v8[2], v8[3]];
    let v0 = [v0[0] - v14[0], v0[1], v0[2], v0[3]];
    let v8 = [v8[0], s70[0], v8[1], s70[1]];
    let v1 = [v0[0], v1[1], v1[2], v1[3]];
    let v1 = [v1[1], v1[0], v8[0], v8[1]];
    let v1 = [
        v1[0] + s80[0],
        v1[1] + s80[1],
        v1[2] + s80[2],
        v1[3] + s80[3],
    ];
    let v0 = v1;
    let v0 = [v0[3], v0[0], v1[2], v1[3]];
    let v0 = [v10[0], v0[1], v0[2], v0[3]];
    let v0 = [v0[0], v0[0], v0[0], v0[1]];
    let v0 = [v0[0] * v1[0], v0[1] * v1[1], v0[2] * v1[2], v0[3] * v1[3]];
    let v3 = [0.0, 0.0, 0.0, f32::from_bits(0x333b_bd2e)];
    let v3 = [
        v3[0] * v11[0],
        v3[1] * v11[1],
        v3[2] * v11[2],
        v3[3] * v11[3],
    ];
    let v4 = v0;
    let v4 = [v4[0] + v3[0], v4[1] + v3[1], v4[2] + v3[2], v4[3] + v3[3]];
    let v0 = [v0[0] - v3[0], v0[1] - v3[1], v0[2] - v3[2], v0[3] - v3[3]];
    let v3 = v1;
    let v3 = [v3[2], v3[3], v1[2], v1[3]];
    let v0 = [v0[3], v0[0], v4[2], v4[0]];
    let v4 = [v4[0], v4[1], v0[2], v0[0]];
    let v0 = v11;
    let v0 = [v0[2], v0[3], v11[2], v11[3]];
    let v3 = [v3[0] * v2[0], v3[1], v3[2], v3[3]];
    let v3 = [v3[0] + v0[0], v3[1], v3[2], v3[3]];
    let v0 = s90;
    let v0 = [
        v0[0] * [f32::from_bits(0x333b_bd2e), 0.0, 0.0, 0.0][0],
        v0[1],
        v0[2],
        v0[3],
    ];
    let v15 = [v15[0] - v0[0], v15[1], v15[2], v15[3]];
    let v2 = [v2[0], v2[1], v1[3], v1[3]];
    let v1 = [v1[0], v1[1], v1[2], v1[1]];
    let v2 = [v2[0], v2[2], v2[2], v2[0]];
    let v11 = [v11[0], v11[1], v11[2], v11[1]];
    let v11 = [
        v11[0]
            * [
                1.0,
                f32::from_bits(0x333b_bd2e),
                f32::from_bits(0x333b_bd2e),
                1.0,
            ][0],
        v11[1]
            * [
                1.0,
                f32::from_bits(0x333b_bd2e),
                f32::from_bits(0x333b_bd2e),
                1.0,
            ][1],
        v11[2]
            * [
                1.0,
                f32::from_bits(0x333b_bd2e),
                f32::from_bits(0x333b_bd2e),
                1.0,
            ][2],
        v11[3]
            * [
                1.0,
                f32::from_bits(0x333b_bd2e),
                f32::from_bits(0x333b_bd2e),
                1.0,
            ][3],
    ];
    let v2 = [v2[0] * v1[0], v2[1] * v1[1], v2[2] * v1[2], v2[3] * v1[3]];
    let v0 = v2;
    let v0 = [
        v0[0] - v11[0],
        v0[1] - v11[1],
        v0[2] - v11[2],
        v0[3] - v11[3],
    ];
    let v11 = [
        v11[0] + v2[0],
        v11[1] + v2[1],
        v11[2] + v2[2],
        v11[3] + v2[3],
    ];
    let v1 = v15;
    let v1 = [v1[0], v1[1], v9[1], v9[3]];
    let v2 = [v9[0], v9[1], 0.0, 0.0];
    let v0 = [v0[1], v0[2], v11[0], v11[3]];
    let v6 = [v12[0], v12[1], 0.0, 0.0];
    let v2 = [v2[2], v2[0], v6[0], v6[2]];
    let v6 = [v15[0], v15[1], 0.0, 0.0];
    let v2 = [v2[0] * v5[0], v2[1] * v5[1], v2[2] * v5[2], v2[3] * v5[3]];
    let v5 = [v5[1], v5[3], v6[2], v6[0]];
    let v13 = [v13[2], v13[0], v1[0], v1[2]];
    let v13 = [
        v13[0] * v5[0],
        v13[1] * v5[1],
        v13[2] * v5[2],
        v13[3] * v5[3],
    ];
    let v13 = [
        v13[0] + v0[0],
        v13[1] + v0[1],
        v13[2] + v0[2],
        v13[3] + v0[3],
    ];
    let v2 = [v2[0] + v4[0], v2[1] + v4[1], v2[2] + v4[2], v2[3] + v4[3]];
    let v15 = [v15[0] * v12[0], v15[1], v15[2], v15[3]];
    let v15 = [v15[0] + v3[0], v15[1], v15[2], v15[3]];
    let sa0 = v2;
    let sb0 = v13;
    let sc0 = v15[0];
    [
        sa0[0], sa0[1], sa0[2], sa0[3], sb0[0], sb0[1], sb0[2], sb0[3], sc0,
    ]
}
/// Current145542830 row-major multiplication, then uniform scale and translation.
pub fn transform(matrix: [f32; 9], vertex: [f32; 3], position: [f32; 3], scale: f32) -> [f32; 3] {
    std::array::from_fn(|row| {
        ((matrix[row * 3] * vertex[0] + matrix[row * 3 + 1] * vertex[1])
            + matrix[row * 3 + 2] * vertex[2])
            * scale
            + position[row]
    })
}
