	.text
	.file	"codigo_estresse.c"
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	stp	x29, x30, [sp, #-48]!           // 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x22, x21, [sp, #16]             // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             // 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	mov	w0, #18432                      // =0x4800
	movk	w0, #488, lsl #16
	bl	malloc
	mov	x19, x0
	mov	w0, #18432                      // =0x4800
	movk	w0, #488, lsl #16
	bl	malloc
	mov	x20, x0
	mov	w0, #18432                      // =0x4800
	movk	w0, #488, lsl #16
	bl	malloc
	mov	x21, x0
	mov	w0, #1                          // =0x1
	cbz	x19, .LBB0_12
// %bb.1:
	cbz	x20, .LBB0_12
// %bb.2:
	cbz	x21, .LBB0_12
// %bb.3:
	fmov	d0, #1.00000000
	fmov	d1, #2.00000000
	mov	w9, #2304                       // =0x900
	mov	x8, xzr
	movk	w9, #61, lsl #16
.LBB0_4:                                // =>This Inner Loop Header: Depth=1
	scvtf	d2, w8
	lsl	x10, x8, #3
	add	x8, x8, #1
	cmp	x8, x9
	fadd	d3, d2, d0
	fadd	d2, d2, d1
	str	d3, [x19, x10]
	str	d2, [x20, x10]
	b.ne	.LBB0_4
// %bb.5:
	bl	clock
	mov	x22, x0
	mov	x8, xzr
	mov	w9, #2000                       // =0x7d0
	mov	w10, #16000                     // =0x3e80
.LBB0_6:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_7 Depth 2
                                        //       Child Loop BB0_8 Depth 3
	mul	x12, x8, x9
	mov	x11, xzr
	mov	x13, x20
.LBB0_7:                                //   Parent Loop BB0_6 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_8 Depth 3
	add	x14, x11, x12
	mov	w15, #2000                      // =0x7d0
	mov	x16, x13
	ldr	d0, [x19, x14, lsl #3]
.LBB0_8:                                //   Parent Loop BB0_6 Depth=1
                                        //     Parent Loop BB0_7 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	d1, [x16]
	subs	x15, x15, #1
	add	x16, x16, x10
	fdiv	d0, d0, d1
	b.ne	.LBB0_8
// %bb.9:                               //   in Loop: Header=BB0_7 Depth=2
	add	x11, x11, #1
	add	x13, x13, #8
	str	d0, [x21, x14, lsl #3]
	cmp	x11, #2000
	b.ne	.LBB0_7
// %bb.10:                              //   in Loop: Header=BB0_6 Depth=1
	add	x8, x8, #1
	cmp	x8, #2000
	b.ne	.LBB0_6
// %bb.11:
	bl	clock
	sub	x8, x0, x22
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	scvtf	d0, x8
	mov	x8, #145685290680320            // =0x848000000000
	movk	x8, #16686, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	ldr	d1, [x21]
	bl	printf
	mov	x0, x19
	bl	free
	mov	x0, x20
	bl	free
	mov	x0, x21
	bl	free
	mov	w0, wzr
.LBB0_12:
	.cfi_def_cfa wsp, 48
	ldp	x20, x19, [sp, #32]             // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             // 16-byte Folded Reload
	ldp	x29, x30, [sp], #48             // 16-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Tempo: %.4f s | Check: %e\n"
	.size	.L.str, 27

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
