	.data
data:	.byte 1, 2, 3
	.balign 2 @ [0x20070000] <= 0x00030201
store:	.space 6
	@ [0x20070004] <= 0x00000000
	@ [0x20070008] <= 0x00000000
	
	.text
	ldr r0, =data @ r0 <= 0x20070000
	ldrb r1, [r0] @ r1 <= 0x00000001
	ldrb r2, [r0, #1] @ r2 <= 0x00000002
	ldrb r3, [r0, #2] @ r3 <= 0x00000003
	ldr r0, =store @ r0 <= 0x20070004
	strh r1, [r0] @ [0x20070004] <= 0x00000001
	strh r2, [r0, #2] @ [0x20070004] <= 0x00020001
	strh r3, [r0, #4] @ [0x20070008] <= 0x00000003
	wfi
