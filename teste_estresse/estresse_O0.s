	.text
	.file	"codigo_estresse.c"
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #112
	.cfi_def_cfa_offset 112
	stp	x29, x30, [sp, #96]             // 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x0, #18432                      // =0x4800
	movk	x0, #488, lsl #16
	str	x0, [sp, #8]                    // 8-byte Folded Spill
	stur	wzr, [x29, #-4]
	bl	malloc
	mov	x8, x0
	ldr	x0, [sp, #8]                    // 8-byte Folded Reload
	stur	x8, [x29, #-16]
	bl	malloc
	mov	x8, x0
	ldr	x0, [sp, #8]                    // 8-byte Folded Reload
	stur	x8, [x29, #-24]
	bl	malloc
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-16]
	cbz	x8, .LBB0_3
	b	.LBB0_1
.LBB0_1:
	ldur	x8, [x29, #-24]
	cbz	x8, .LBB0_3
	b	.LBB0_2
.LBB0_2:
	ldur	x8, [x29, #-32]
	cbnz	x8, .LBB0_4
	b	.LBB0_3
.LBB0_3:
	mov	w8, #1                          // =0x1
	stur	w8, [x29, #-4]
	b	.LBB0_21
.LBB0_4:
	stur	wzr, [x29, #-36]
	b	.LBB0_5
.LBB0_5:                                // =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-36]
	mov	w9, #2304                       // =0x900
	movk	w9, #61, lsl #16
	subs	w8, w8, w9
	b.ge	.LBB0_8
	b	.LBB0_6
.LBB0_6:                                //   in Loop: Header=BB0_5 Depth=1
	ldur	s0, [x29, #-36]
	fmov	w8, s0
	scvtf	d0, w8
	fmov	d1, #1.00000000
	fadd	d0, d0, d1
	ldur	x8, [x29, #-16]
	ldursw	x9, [x29, #-36]
	str	d0, [x8, x9, lsl #3]
	ldur	s0, [x29, #-36]
	fmov	w8, s0
	scvtf	d0, w8
	fmov	d1, #2.00000000
	fadd	d0, d0, d1
	ldur	x8, [x29, #-24]
	ldursw	x9, [x29, #-36]
	str	d0, [x8, x9, lsl #3]
	b	.LBB0_7
.LBB0_7:                                //   in Loop: Header=BB0_5 Depth=1
	ldur	w8, [x29, #-36]
	add	w8, w8, #1
	stur	w8, [x29, #-36]
	b	.LBB0_5
.LBB0_8:
	bl	clock
	str	x0, [sp, #48]
	str	wzr, [sp, #44]
	b	.LBB0_9
.LBB0_9:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_11 Depth 2
                                        //       Child Loop BB0_13 Depth 3
	ldr	w8, [sp, #44]
	subs	w8, w8, #2000
	b.ge	.LBB0_20
	b	.LBB0_10
.LBB0_10:                               //   in Loop: Header=BB0_9 Depth=1
	str	wzr, [sp, #40]
	b	.LBB0_11
.LBB0_11:                               //   Parent Loop BB0_9 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB0_13 Depth 3
	ldr	w8, [sp, #40]
	subs	w8, w8, #2000
	b.ge	.LBB0_18
	b	.LBB0_12
.LBB0_12:                               //   in Loop: Header=BB0_11 Depth=2
	ldur	x8, [x29, #-16]
	ldr	w9, [sp, #44]
	mov	w10, #2000                      // =0x7d0
	mul	w9, w9, w10
	ldr	w10, [sp, #40]
	add	w9, w9, w10
	ldr	d0, [x8, w9, sxtw #3]
	str	d0, [sp, #32]
	str	wzr, [sp, #28]
	b	.LBB0_13
.LBB0_13:                               //   Parent Loop BB0_9 Depth=1
                                        //     Parent Loop BB0_11 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldr	w8, [sp, #28]
	subs	w8, w8, #2000
	b.ge	.LBB0_16
	b	.LBB0_14
.LBB0_14:                               //   in Loop: Header=BB0_13 Depth=3
	ldur	x8, [x29, #-24]
	ldr	w9, [sp, #28]
	mov	w10, #2000                      // =0x7d0
	mul	w9, w9, w10
	ldr	w10, [sp, #40]
	add	w9, w9, w10
	ldr	d1, [x8, w9, sxtw #3]
	ldr	d0, [sp, #32]
	fdiv	d0, d0, d1
	str	d0, [sp, #32]
	b	.LBB0_15
.LBB0_15:                               //   in Loop: Header=BB0_13 Depth=3
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	.LBB0_13
.LBB0_16:                               //   in Loop: Header=BB0_11 Depth=2
	ldr	d0, [sp, #32]
	ldur	x8, [x29, #-32]
	ldr	w9, [sp, #44]
	mov	w10, #2000                      // =0x7d0
	mul	w9, w9, w10
	ldr	w10, [sp, #40]
	add	w9, w9, w10
	str	d0, [x8, w9, sxtw #3]
	b	.LBB0_17
.LBB0_17:                               //   in Loop: Header=BB0_11 Depth=2
	ldr	w8, [sp, #40]
	add	w8, w8, #1
	str	w8, [sp, #40]
	b	.LBB0_11
.LBB0_18:                               //   in Loop: Header=BB0_9 Depth=1
	b	.LBB0_19
.LBB0_19:                               //   in Loop: Header=BB0_9 Depth=1
	ldr	w8, [sp, #44]
	add	w8, w8, #1
	str	w8, [sp, #44]
	b	.LBB0_9
.LBB0_20:
	bl	clock
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #48]
	subs	x8, x8, x9
	scvtf	d0, x8
	mov	x8, #145685290680320            // =0x848000000000
	movk	x8, #16686, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	ldur	x8, [x29, #-32]
	ldr	d1, [x8]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	ldur	x0, [x29, #-16]
	bl	free
	ldur	x0, [x29, #-24]
	bl	free
	ldur	x0, [x29, #-32]
	bl	free
	stur	wzr, [x29, #-4]
	b	.LBB0_21
.LBB0_21:
	ldur	w0, [x29, #-4]
	.cfi_def_cfa wsp, 112
	ldp	x29, x30, [sp, #96]             // 16-byte Folded Reload
	add	sp, sp, #112
	.cfi_def_cfa_offset 0
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
	.addrsig_sym malloc
	.addrsig_sym clock
	.addrsig_sym printf
	.addrsig_sym free
