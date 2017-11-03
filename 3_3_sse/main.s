	.text
	.intel_syntax noprefix
	.file	"main.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4617878467915022336     # double 5.5
.LCPI0_1:
	.quad	4616752568008179712     # double 4.5
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	1 "main.c"
	.loc	1 12 0                  # main.c:12:0
	.cfi_startproc
# BB#0:
	push	rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset rbp, -16
	mov	rbp, rsp
.Ltmp2:
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	movabs	rax, .L.str
	xorps	xmm0, xmm0
	movsd	xmm1, qword ptr [.LCPI0_0] # xmm1 = mem[0],zero
	movsd	xmm2, qword ptr [.LCPI0_1] # xmm2 = mem[0],zero
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	.loc	1 13 9 prologue_end     # main.c:13:9
.Ltmp3:
	movsd	qword ptr [rbp - 24], xmm2
	.loc	1 14 9                  # main.c:14:9
	movsd	qword ptr [rbp - 32], xmm1
	.loc	1 15 9                  # main.c:15:9
	movsd	qword ptr [rbp - 40], xmm0
	.loc	1 18 35                 # main.c:18:35
	movsd	xmm0, qword ptr [rbp - 24] # xmm0 = mem[0],zero
	.loc	1 18 38 is_stmt 0       # main.c:18:38
	movsd	xmm1, qword ptr [rbp - 32] # xmm1 = mem[0],zero
	.loc	1 18 41                 # main.c:18:41
	movsd	xmm2, qword ptr [rbp - 40] # xmm2 = mem[0],zero
	.loc	1 18 2                  # main.c:18:2
	mov	rdi, rax
	mov	al, 3
	call	printf
	.loc	1 20 14 is_stmt 1       # main.c:20:14
	movsd	xmm0, qword ptr [rbp - 24] # xmm0 = mem[0],zero
	.loc	1 20 17 is_stmt 0       # main.c:20:17
	movsd	xmm1, qword ptr [rbp - 24] # xmm1 = mem[0],zero
	.loc	1 20 6                  # main.c:20:6
	mov	dword ptr [rbp - 44], eax # 4-byte Spill
	call	sse_mul
	.loc	1 20 4                  # main.c:20:4
	movsd	qword ptr [rbp - 24], xmm0
	.loc	1 21 15 is_stmt 1       # main.c:21:15
	movsd	xmm0, qword ptr [rbp - 32] # xmm0 = mem[0],zero
	.loc	1 21 18 is_stmt 0       # main.c:21:18
	movsd	xmm1, qword ptr [rbp - 32] # xmm1 = mem[0],zero
	.loc	1 21 7                  # main.c:21:7
	call	sse_mul
	.loc	1 21 5                  # main.c:21:5
	movsd	qword ptr [rbp - 32], xmm0
	.loc	1 22 14 is_stmt 1       # main.c:22:14
	movsd	xmm0, qword ptr [rbp - 24] # xmm0 = mem[0],zero
	.loc	1 22 17 is_stmt 0       # main.c:22:17
	movsd	xmm1, qword ptr [rbp - 32] # xmm1 = mem[0],zero
	.loc	1 22 6                  # main.c:22:6
	call	sse_add
	.loc	1 22 4                  # main.c:22:4
	movsd	qword ptr [rbp - 40], xmm0
	.loc	1 23 15 is_stmt 1       # main.c:23:15
	movsd	xmm0, qword ptr [rbp - 40] # xmm0 = mem[0],zero
	.loc	1 23 6 is_stmt 0        # main.c:23:6
	call	sse_sqrt
	movabs	rdi, .L.str
	.loc	1 23 4                  # main.c:23:4
	movsd	qword ptr [rbp - 40], xmm0
	.loc	1 24 35 is_stmt 1       # main.c:24:35
	movsd	xmm0, qword ptr [rbp - 24] # xmm0 = mem[0],zero
	.loc	1 24 38 is_stmt 0       # main.c:24:38
	movsd	xmm1, qword ptr [rbp - 32] # xmm1 = mem[0],zero
	.loc	1 24 41                 # main.c:24:41
	movsd	xmm2, qword ptr [rbp - 40] # xmm2 = mem[0],zero
	.loc	1 24 2                  # main.c:24:2
	mov	al, 3
	call	printf
	movabs	rdi, .L.str.1
	.loc	1 27 28 is_stmt 1       # main.c:27:28
	movsd	xmm0, qword ptr [rbp - 40] # xmm0 = mem[0],zero
	.loc	1 27 3 is_stmt 0        # main.c:27:3
	mov	dword ptr [rbp - 48], eax # 4-byte Spill
	mov	al, 1
	call	printf
	xor	ecx, ecx
	.loc	1 28 1 is_stmt 1        # main.c:28:1
	mov	dword ptr [rbp - 52], eax # 4-byte Spill
	mov	eax, ecx
	add	rsp, 64
	pop	rbp
	ret
.Ltmp4:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"value is %lf %lf %lf\n"
	.size	.L.str, 22

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"value is %lf\n"
	.size	.L.str.1, 14

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)" # string offset=0
.Linfo_string1:
	.asciz	"main.c"                # string offset=54
.Linfo_string2:
	.asciz	"/home/rbaydoun/git/cse/3_3_sse" # string offset=61
.Linfo_string3:
	.asciz	"main"                  # string offset=92
.Linfo_string4:
	.asciz	"int"                   # string offset=97
.Linfo_string5:
	.asciz	"argc"                  # string offset=101
.Linfo_string6:
	.asciz	"argv"                  # string offset=106
.Linfo_string7:
	.asciz	"char"                  # string offset=111
.Linfo_string8:
	.asciz	"a"                     # string offset=116
.Linfo_string9:
	.asciz	"double"                # string offset=118
.Linfo_string10:
	.asciz	"b"                     # string offset=125
.Linfo_string11:
	.asciz	"c"                     # string offset=127
	.section	.debug_loc,"",@progbits
	.section	.debug_abbrev,"",@progbits
.Lsection_abbrev:
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lsection_info:
.Lcu_begin0:
	.long	166                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.Lsection_abbrev        # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x9f DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x60 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	138                     # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x43:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	124
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	138                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x51:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	145                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5f:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	162                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6d:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	162                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x7b:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	88
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	162                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x8a:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x91:0x5 DW_TAG_pointer_type
	.long	150                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x96:0x5 DW_TAG_pointer_type
	.long	155                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x9b:0x7 DW_TAG_base_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	5                       # Abbrev [5] 0xa2:0x7 DW_TAG_base_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	4                       # DW_AT_encoding
	.byte	8                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
	.section	.debug_macinfo,"",@progbits
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	170                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"main"                  # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	170                     # Compilation Unit Length
	.long	138                     # DIE offset
	.asciz	"int"                   # External Name
	.long	162                     # DIE offset
	.asciz	"double"                # External Name
	.long	155                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
