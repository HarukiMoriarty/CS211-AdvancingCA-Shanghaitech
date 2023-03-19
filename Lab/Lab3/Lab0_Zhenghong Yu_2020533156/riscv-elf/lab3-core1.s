
../riscv-elf/lab3-core1.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	addi	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	4c0000ef          	jal	ra,105bc <__call_exitprocs>
   10100:	f481b503          	ld	a0,-184(gp) # 11f98 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	6e8000ef          	jal	ra,107fc <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00010537          	lui	a0,0x10
   10124:	6e450513          	addi	a0,a0,1764 # 106e4 <__libc_fini_array>
   10128:	6180006f          	j	10740 <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00002197          	auipc	gp,0x2
   10134:	f2018193          	addi	gp,gp,-224 # 12050 <__global_pointer$>
   10138:	f6018513          	addi	a0,gp,-160 # 11fb0 <completed.1>
   1013c:	f9818613          	addi	a2,gp,-104 # 11fe8 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	398000ef          	jal	ra,104e0 <memset>
   1014c:	00000517          	auipc	a0,0x0
   10150:	5f450513          	addi	a0,a0,1524 # 10740 <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00000517          	auipc	a0,0x0
   1015c:	58c50513          	addi	a0,a0,1420 # 106e4 <__libc_fini_array>
   10160:	5e0000ef          	jal	ra,10740 <atexit>
   10164:	2e0000ef          	jal	ra,10444 <__libc_init_array>
   10168:	00012503          	lw	a0,0(sp)
   1016c:	00810593          	addi	a1,sp,8
   10170:	00000613          	li	a2,0
   10174:	170000ef          	jal	ra,102e4 <main>
   10178:	f71ff06f          	j	100e8 <exit>

000000000001017c <__do_global_dtors_aux>:
   1017c:	ff010113          	addi	sp,sp,-16
   10180:	00813023          	sd	s0,0(sp)
   10184:	f601c783          	lbu	a5,-160(gp) # 11fb0 <completed.1>
   10188:	00113423          	sd	ra,8(sp)
   1018c:	02079263          	bnez	a5,101b0 <__do_global_dtors_aux+0x34>
   10190:	00000793          	li	a5,0
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x2c>
   10198:	00012537          	lui	a0,0x12
   1019c:	83450513          	addi	a0,a0,-1996 # 11834 <__FRAME_END__>
   101a0:	00000097          	auipc	ra,0x0
   101a4:	000000e7          	jalr	zero # 0 <exit-0x100e8>
   101a8:	00100793          	li	a5,1
   101ac:	f6f18023          	sb	a5,-160(gp) # 11fb0 <completed.1>
   101b0:	00813083          	ld	ra,8(sp)
   101b4:	00013403          	ld	s0,0(sp)
   101b8:	01010113          	addi	sp,sp,16
   101bc:	00008067          	ret

00000000000101c0 <frame_dummy>:
   101c0:	00000793          	li	a5,0
   101c4:	00078c63          	beqz	a5,101dc <frame_dummy+0x1c>
   101c8:	00012537          	lui	a0,0x12
   101cc:	f6818593          	addi	a1,gp,-152 # 11fb8 <object.0>
   101d0:	83450513          	addi	a0,a0,-1996 # 11834 <__FRAME_END__>
   101d4:	00000317          	auipc	t1,0x0
   101d8:	00000067          	jr	zero # 0 <exit-0x100e8>
   101dc:	00008067          	ret

00000000000101e0 <print_d>:
   101e0:	fe010113          	addi	sp,sp,-32
   101e4:	00813c23          	sd	s0,24(sp)
   101e8:	02010413          	addi	s0,sp,32
   101ec:	00050793          	mv	a5,a0
   101f0:	fef42623          	sw	a5,-20(s0)
   101f4:	00200893          	li	a7,2
   101f8:	00000073          	ecall
   101fc:	00000013          	nop
   10200:	01813403          	ld	s0,24(sp)
   10204:	02010113          	addi	sp,sp,32
   10208:	00008067          	ret

000000000001020c <print_s>:
   1020c:	fe010113          	addi	sp,sp,-32
   10210:	00813c23          	sd	s0,24(sp)
   10214:	02010413          	addi	s0,sp,32
   10218:	fea43423          	sd	a0,-24(s0)
   1021c:	00000893          	li	a7,0
   10220:	00000073          	ecall
   10224:	00000013          	nop
   10228:	01813403          	ld	s0,24(sp)
   1022c:	02010113          	addi	sp,sp,32
   10230:	00008067          	ret

0000000000010234 <print_c>:
   10234:	fe010113          	addi	sp,sp,-32
   10238:	00813c23          	sd	s0,24(sp)
   1023c:	02010413          	addi	s0,sp,32
   10240:	00050793          	mv	a5,a0
   10244:	fef407a3          	sb	a5,-17(s0)
   10248:	00100893          	li	a7,1
   1024c:	00000073          	ecall
   10250:	00000013          	nop
   10254:	01813403          	ld	s0,24(sp)
   10258:	02010113          	addi	sp,sp,32
   1025c:	00008067          	ret

0000000000010260 <exit_proc>:
   10260:	ff010113          	addi	sp,sp,-16
   10264:	00813423          	sd	s0,8(sp)
   10268:	01010413          	addi	s0,sp,16
   1026c:	00300893          	li	a7,3
   10270:	00000073          	ecall
   10274:	00000013          	nop
   10278:	00813403          	ld	s0,8(sp)
   1027c:	01010113          	addi	sp,sp,16
   10280:	00008067          	ret

0000000000010284 <read_char>:
   10284:	fe010113          	addi	sp,sp,-32
   10288:	00813c23          	sd	s0,24(sp)
   1028c:	02010413          	addi	s0,sp,32
   10290:	00400893          	li	a7,4
   10294:	00000073          	ecall
   10298:	00050793          	mv	a5,a0
   1029c:	fef407a3          	sb	a5,-17(s0)
   102a0:	fef44783          	lbu	a5,-17(s0)
   102a4:	00078513          	mv	a0,a5
   102a8:	01813403          	ld	s0,24(sp)
   102ac:	02010113          	addi	sp,sp,32
   102b0:	00008067          	ret

00000000000102b4 <read_num>:
   102b4:	fe010113          	addi	sp,sp,-32
   102b8:	00813c23          	sd	s0,24(sp)
   102bc:	02010413          	addi	s0,sp,32
   102c0:	00500893          	li	a7,5
   102c4:	00000073          	ecall
   102c8:	00050793          	mv	a5,a0
   102cc:	fef43423          	sd	a5,-24(s0)
   102d0:	fe843783          	ld	a5,-24(s0)
   102d4:	00078513          	mv	a0,a5
   102d8:	01813403          	ld	s0,24(sp)
   102dc:	02010113          	addi	sp,sp,32
   102e0:	00008067          	ret

00000000000102e4 <main>:
   102e4:	fe010113          	addi	sp,sp,-32
   102e8:	00113c23          	sd	ra,24(sp)
   102ec:	00813823          	sd	s0,16(sp)
   102f0:	02010413          	addi	s0,sp,32
   102f4:	001007b7          	lui	a5,0x100
   102f8:	fef43423          	sd	a5,-24(s0)
   102fc:	fe843783          	ld	a5,-24(s0)
   10300:	10178793          	addi	a5,a5,257 # 100101 <__global_pointer$+0xee0b1>
   10304:	05300713          	li	a4,83
   10308:	00e78023          	sb	a4,0(a5)
   1030c:	fe843783          	ld	a5,-24(s0)
   10310:	07b78793          	addi	a5,a5,123
   10314:	0007c783          	lbu	a5,0(a5)
   10318:	00078513          	mv	a0,a5
   1031c:	f19ff0ef          	jal	ra,10234 <print_c>
   10320:	fe843783          	ld	a5,-24(s0)
   10324:	0007c783          	lbu	a5,0(a5)
   10328:	00078513          	mv	a0,a5
   1032c:	f09ff0ef          	jal	ra,10234 <print_c>
   10330:	fe843783          	ld	a5,-24(s0)
   10334:	0007c783          	lbu	a5,0(a5)
   10338:	00078513          	mv	a0,a5
   1033c:	ef9ff0ef          	jal	ra,10234 <print_c>
   10340:	fe843783          	ld	a5,-24(s0)
   10344:	0007c783          	lbu	a5,0(a5)
   10348:	00078513          	mv	a0,a5
   1034c:	ee9ff0ef          	jal	ra,10234 <print_c>
   10350:	fe843783          	ld	a5,-24(s0)
   10354:	0007c783          	lbu	a5,0(a5)
   10358:	00078513          	mv	a0,a5
   1035c:	ed9ff0ef          	jal	ra,10234 <print_c>
   10360:	fe843783          	ld	a5,-24(s0)
   10364:	0007c783          	lbu	a5,0(a5)
   10368:	00078513          	mv	a0,a5
   1036c:	ec9ff0ef          	jal	ra,10234 <print_c>
   10370:	fe843783          	ld	a5,-24(s0)
   10374:	0007c783          	lbu	a5,0(a5)
   10378:	00078513          	mv	a0,a5
   1037c:	eb9ff0ef          	jal	ra,10234 <print_c>
   10380:	fe843783          	ld	a5,-24(s0)
   10384:	0007c783          	lbu	a5,0(a5)
   10388:	00078513          	mv	a0,a5
   1038c:	ea9ff0ef          	jal	ra,10234 <print_c>
   10390:	fe843783          	ld	a5,-24(s0)
   10394:	0007c783          	lbu	a5,0(a5)
   10398:	00078513          	mv	a0,a5
   1039c:	e99ff0ef          	jal	ra,10234 <print_c>
   103a0:	fe843783          	ld	a5,-24(s0)
   103a4:	0007c783          	lbu	a5,0(a5)
   103a8:	00078513          	mv	a0,a5
   103ac:	e89ff0ef          	jal	ra,10234 <print_c>
   103b0:	fe843783          	ld	a5,-24(s0)
   103b4:	0007c783          	lbu	a5,0(a5)
   103b8:	00078513          	mv	a0,a5
   103bc:	e79ff0ef          	jal	ra,10234 <print_c>
   103c0:	fe843783          	ld	a5,-24(s0)
   103c4:	0007c783          	lbu	a5,0(a5)
   103c8:	00078513          	mv	a0,a5
   103cc:	e69ff0ef          	jal	ra,10234 <print_c>
   103d0:	fe843783          	ld	a5,-24(s0)
   103d4:	0007c783          	lbu	a5,0(a5)
   103d8:	00078513          	mv	a0,a5
   103dc:	e59ff0ef          	jal	ra,10234 <print_c>
   103e0:	fe843783          	ld	a5,-24(s0)
   103e4:	0007c783          	lbu	a5,0(a5)
   103e8:	00078513          	mv	a0,a5
   103ec:	e49ff0ef          	jal	ra,10234 <print_c>
   103f0:	fe843783          	ld	a5,-24(s0)
   103f4:	0007c783          	lbu	a5,0(a5)
   103f8:	00078513          	mv	a0,a5
   103fc:	e39ff0ef          	jal	ra,10234 <print_c>
   10400:	fe843783          	ld	a5,-24(s0)
   10404:	0007c783          	lbu	a5,0(a5)
   10408:	00078513          	mv	a0,a5
   1040c:	e29ff0ef          	jal	ra,10234 <print_c>
   10410:	fe843783          	ld	a5,-24(s0)
   10414:	0007c783          	lbu	a5,0(a5)
   10418:	00078513          	mv	a0,a5
   1041c:	e19ff0ef          	jal	ra,10234 <print_c>
   10420:	00a00513          	li	a0,10
   10424:	e11ff0ef          	jal	ra,10234 <print_c>
   10428:	e39ff0ef          	jal	ra,10260 <exit_proc>
   1042c:	00000793          	li	a5,0
   10430:	00078513          	mv	a0,a5
   10434:	01813083          	ld	ra,24(sp)
   10438:	01013403          	ld	s0,16(sp)
   1043c:	02010113          	addi	sp,sp,32
   10440:	00008067          	ret

0000000000010444 <__libc_init_array>:
   10444:	fe010113          	addi	sp,sp,-32
   10448:	00813823          	sd	s0,16(sp)
   1044c:	000127b7          	lui	a5,0x12
   10450:	00012437          	lui	s0,0x12
   10454:	01213023          	sd	s2,0(sp)
   10458:	83878793          	addi	a5,a5,-1992 # 11838 <__init_array_start>
   1045c:	83840713          	addi	a4,s0,-1992 # 11838 <__init_array_start>
   10460:	00113c23          	sd	ra,24(sp)
   10464:	00913423          	sd	s1,8(sp)
   10468:	40e78933          	sub	s2,a5,a4
   1046c:	02e78263          	beq	a5,a4,10490 <__libc_init_array+0x4c>
   10470:	40395913          	srai	s2,s2,0x3
   10474:	83840413          	addi	s0,s0,-1992
   10478:	00000493          	li	s1,0
   1047c:	00043783          	ld	a5,0(s0)
   10480:	00148493          	addi	s1,s1,1
   10484:	00840413          	addi	s0,s0,8
   10488:	000780e7          	jalr	a5
   1048c:	ff24e8e3          	bltu	s1,s2,1047c <__libc_init_array+0x38>
   10490:	00012437          	lui	s0,0x12
   10494:	000127b7          	lui	a5,0x12
   10498:	84878793          	addi	a5,a5,-1976 # 11848 <__do_global_dtors_aux_fini_array_entry>
   1049c:	83840713          	addi	a4,s0,-1992 # 11838 <__init_array_start>
   104a0:	40e78933          	sub	s2,a5,a4
   104a4:	40395913          	srai	s2,s2,0x3
   104a8:	02e78063          	beq	a5,a4,104c8 <__libc_init_array+0x84>
   104ac:	83840413          	addi	s0,s0,-1992
   104b0:	00000493          	li	s1,0
   104b4:	00043783          	ld	a5,0(s0)
   104b8:	00148493          	addi	s1,s1,1
   104bc:	00840413          	addi	s0,s0,8
   104c0:	000780e7          	jalr	a5
   104c4:	ff24e8e3          	bltu	s1,s2,104b4 <__libc_init_array+0x70>
   104c8:	01813083          	ld	ra,24(sp)
   104cc:	01013403          	ld	s0,16(sp)
   104d0:	00813483          	ld	s1,8(sp)
   104d4:	00013903          	ld	s2,0(sp)
   104d8:	02010113          	addi	sp,sp,32
   104dc:	00008067          	ret

00000000000104e0 <memset>:
   104e0:	00f00313          	li	t1,15
   104e4:	00050713          	mv	a4,a0
   104e8:	02c37a63          	bgeu	t1,a2,1051c <memset+0x3c>
   104ec:	00f77793          	andi	a5,a4,15
   104f0:	0a079063          	bnez	a5,10590 <memset+0xb0>
   104f4:	06059e63          	bnez	a1,10570 <memset+0x90>
   104f8:	ff067693          	andi	a3,a2,-16
   104fc:	00f67613          	andi	a2,a2,15
   10500:	00e686b3          	add	a3,a3,a4
   10504:	00b73023          	sd	a1,0(a4)
   10508:	00b73423          	sd	a1,8(a4)
   1050c:	01070713          	addi	a4,a4,16
   10510:	fed76ae3          	bltu	a4,a3,10504 <memset+0x24>
   10514:	00061463          	bnez	a2,1051c <memset+0x3c>
   10518:	00008067          	ret
   1051c:	40c306b3          	sub	a3,t1,a2
   10520:	00269693          	slli	a3,a3,0x2
   10524:	00000297          	auipc	t0,0x0
   10528:	005686b3          	add	a3,a3,t0
   1052c:	00c68067          	jr	12(a3)
   10530:	00b70723          	sb	a1,14(a4)
   10534:	00b706a3          	sb	a1,13(a4)
   10538:	00b70623          	sb	a1,12(a4)
   1053c:	00b705a3          	sb	a1,11(a4)
   10540:	00b70523          	sb	a1,10(a4)
   10544:	00b704a3          	sb	a1,9(a4)
   10548:	00b70423          	sb	a1,8(a4)
   1054c:	00b703a3          	sb	a1,7(a4)
   10550:	00b70323          	sb	a1,6(a4)
   10554:	00b702a3          	sb	a1,5(a4)
   10558:	00b70223          	sb	a1,4(a4)
   1055c:	00b701a3          	sb	a1,3(a4)
   10560:	00b70123          	sb	a1,2(a4)
   10564:	00b700a3          	sb	a1,1(a4)
   10568:	00b70023          	sb	a1,0(a4)
   1056c:	00008067          	ret
   10570:	0ff5f593          	zext.b	a1,a1
   10574:	00859693          	slli	a3,a1,0x8
   10578:	00d5e5b3          	or	a1,a1,a3
   1057c:	01059693          	slli	a3,a1,0x10
   10580:	00d5e5b3          	or	a1,a1,a3
   10584:	02059693          	slli	a3,a1,0x20
   10588:	00d5e5b3          	or	a1,a1,a3
   1058c:	f6dff06f          	j	104f8 <memset+0x18>
   10590:	00279693          	slli	a3,a5,0x2
   10594:	00000297          	auipc	t0,0x0
   10598:	005686b3          	add	a3,a3,t0
   1059c:	00008293          	mv	t0,ra
   105a0:	f98680e7          	jalr	-104(a3)
   105a4:	00028093          	mv	ra,t0
   105a8:	ff078793          	addi	a5,a5,-16
   105ac:	40f70733          	sub	a4,a4,a5
   105b0:	00f60633          	add	a2,a2,a5
   105b4:	f6c374e3          	bgeu	t1,a2,1051c <memset+0x3c>
   105b8:	f3dff06f          	j	104f4 <memset+0x14>

00000000000105bc <__call_exitprocs>:
   105bc:	fb010113          	addi	sp,sp,-80
   105c0:	03413023          	sd	s4,32(sp)
   105c4:	f481ba03          	ld	s4,-184(gp) # 11f98 <_global_impure_ptr>
   105c8:	03213823          	sd	s2,48(sp)
   105cc:	04113423          	sd	ra,72(sp)
   105d0:	1f8a3903          	ld	s2,504(s4)
   105d4:	04813023          	sd	s0,64(sp)
   105d8:	02913c23          	sd	s1,56(sp)
   105dc:	03313423          	sd	s3,40(sp)
   105e0:	01513c23          	sd	s5,24(sp)
   105e4:	01613823          	sd	s6,16(sp)
   105e8:	01713423          	sd	s7,8(sp)
   105ec:	01813023          	sd	s8,0(sp)
   105f0:	04090063          	beqz	s2,10630 <__call_exitprocs+0x74>
   105f4:	00050b13          	mv	s6,a0
   105f8:	00058b93          	mv	s7,a1
   105fc:	00100a93          	li	s5,1
   10600:	fff00993          	li	s3,-1
   10604:	00892483          	lw	s1,8(s2)
   10608:	fff4841b          	addiw	s0,s1,-1
   1060c:	02044263          	bltz	s0,10630 <__call_exitprocs+0x74>
   10610:	00349493          	slli	s1,s1,0x3
   10614:	009904b3          	add	s1,s2,s1
   10618:	040b8463          	beqz	s7,10660 <__call_exitprocs+0xa4>
   1061c:	2084b783          	ld	a5,520(s1)
   10620:	05778063          	beq	a5,s7,10660 <__call_exitprocs+0xa4>
   10624:	fff4041b          	addiw	s0,s0,-1
   10628:	ff848493          	addi	s1,s1,-8
   1062c:	ff3416e3          	bne	s0,s3,10618 <__call_exitprocs+0x5c>
   10630:	04813083          	ld	ra,72(sp)
   10634:	04013403          	ld	s0,64(sp)
   10638:	03813483          	ld	s1,56(sp)
   1063c:	03013903          	ld	s2,48(sp)
   10640:	02813983          	ld	s3,40(sp)
   10644:	02013a03          	ld	s4,32(sp)
   10648:	01813a83          	ld	s5,24(sp)
   1064c:	01013b03          	ld	s6,16(sp)
   10650:	00813b83          	ld	s7,8(sp)
   10654:	00013c03          	ld	s8,0(sp)
   10658:	05010113          	addi	sp,sp,80
   1065c:	00008067          	ret
   10660:	00892783          	lw	a5,8(s2)
   10664:	0084b703          	ld	a4,8(s1)
   10668:	fff7879b          	addiw	a5,a5,-1
   1066c:	06878263          	beq	a5,s0,106d0 <__call_exitprocs+0x114>
   10670:	0004b423          	sd	zero,8(s1)
   10674:	fa0708e3          	beqz	a4,10624 <__call_exitprocs+0x68>
   10678:	31092783          	lw	a5,784(s2)
   1067c:	008a96bb          	sllw	a3,s5,s0
   10680:	00892c03          	lw	s8,8(s2)
   10684:	00d7f7b3          	and	a5,a5,a3
   10688:	0007879b          	sext.w	a5,a5
   1068c:	02079263          	bnez	a5,106b0 <__call_exitprocs+0xf4>
   10690:	000700e7          	jalr	a4
   10694:	00892703          	lw	a4,8(s2)
   10698:	1f8a3783          	ld	a5,504(s4)
   1069c:	01871463          	bne	a4,s8,106a4 <__call_exitprocs+0xe8>
   106a0:	f92782e3          	beq	a5,s2,10624 <__call_exitprocs+0x68>
   106a4:	f80786e3          	beqz	a5,10630 <__call_exitprocs+0x74>
   106a8:	00078913          	mv	s2,a5
   106ac:	f59ff06f          	j	10604 <__call_exitprocs+0x48>
   106b0:	31492783          	lw	a5,788(s2)
   106b4:	1084b583          	ld	a1,264(s1)
   106b8:	00d7f7b3          	and	a5,a5,a3
   106bc:	0007879b          	sext.w	a5,a5
   106c0:	00079c63          	bnez	a5,106d8 <__call_exitprocs+0x11c>
   106c4:	000b0513          	mv	a0,s6
   106c8:	000700e7          	jalr	a4
   106cc:	fc9ff06f          	j	10694 <__call_exitprocs+0xd8>
   106d0:	00892423          	sw	s0,8(s2)
   106d4:	fa1ff06f          	j	10674 <__call_exitprocs+0xb8>
   106d8:	00058513          	mv	a0,a1
   106dc:	000700e7          	jalr	a4
   106e0:	fb5ff06f          	j	10694 <__call_exitprocs+0xd8>

00000000000106e4 <__libc_fini_array>:
   106e4:	fe010113          	addi	sp,sp,-32
   106e8:	00813823          	sd	s0,16(sp)
   106ec:	000127b7          	lui	a5,0x12
   106f0:	00012437          	lui	s0,0x12
   106f4:	84878793          	addi	a5,a5,-1976 # 11848 <__do_global_dtors_aux_fini_array_entry>
   106f8:	85040413          	addi	s0,s0,-1968 # 11850 <impure_data>
   106fc:	40f40433          	sub	s0,s0,a5
   10700:	00913423          	sd	s1,8(sp)
   10704:	00113c23          	sd	ra,24(sp)
   10708:	40345493          	srai	s1,s0,0x3
   1070c:	02048063          	beqz	s1,1072c <__libc_fini_array+0x48>
   10710:	ff840413          	addi	s0,s0,-8
   10714:	00f40433          	add	s0,s0,a5
   10718:	00043783          	ld	a5,0(s0)
   1071c:	fff48493          	addi	s1,s1,-1
   10720:	ff840413          	addi	s0,s0,-8
   10724:	000780e7          	jalr	a5
   10728:	fe0498e3          	bnez	s1,10718 <__libc_fini_array+0x34>
   1072c:	01813083          	ld	ra,24(sp)
   10730:	01013403          	ld	s0,16(sp)
   10734:	00813483          	ld	s1,8(sp)
   10738:	02010113          	addi	sp,sp,32
   1073c:	00008067          	ret

0000000000010740 <atexit>:
   10740:	00050593          	mv	a1,a0
   10744:	00000693          	li	a3,0
   10748:	00000613          	li	a2,0
   1074c:	00000513          	li	a0,0
   10750:	0040006f          	j	10754 <__register_exitproc>

0000000000010754 <__register_exitproc>:
   10754:	f481b703          	ld	a4,-184(gp) # 11f98 <_global_impure_ptr>
   10758:	1f873783          	ld	a5,504(a4)
   1075c:	06078063          	beqz	a5,107bc <__register_exitproc+0x68>
   10760:	0087a703          	lw	a4,8(a5)
   10764:	01f00813          	li	a6,31
   10768:	08e84663          	blt	a6,a4,107f4 <__register_exitproc+0xa0>
   1076c:	02050863          	beqz	a0,1079c <__register_exitproc+0x48>
   10770:	00371813          	slli	a6,a4,0x3
   10774:	01078833          	add	a6,a5,a6
   10778:	10c83823          	sd	a2,272(a6)
   1077c:	3107a883          	lw	a7,784(a5)
   10780:	00100613          	li	a2,1
   10784:	00e6163b          	sllw	a2,a2,a4
   10788:	00c8e8b3          	or	a7,a7,a2
   1078c:	3117a823          	sw	a7,784(a5)
   10790:	20d83823          	sd	a3,528(a6)
   10794:	00200693          	li	a3,2
   10798:	02d50863          	beq	a0,a3,107c8 <__register_exitproc+0x74>
   1079c:	00270693          	addi	a3,a4,2
   107a0:	00369693          	slli	a3,a3,0x3
   107a4:	0017071b          	addiw	a4,a4,1
   107a8:	00e7a423          	sw	a4,8(a5)
   107ac:	00d787b3          	add	a5,a5,a3
   107b0:	00b7b023          	sd	a1,0(a5)
   107b4:	00000513          	li	a0,0
   107b8:	00008067          	ret
   107bc:	20070793          	addi	a5,a4,512
   107c0:	1ef73c23          	sd	a5,504(a4)
   107c4:	f9dff06f          	j	10760 <__register_exitproc+0xc>
   107c8:	3147a683          	lw	a3,788(a5)
   107cc:	00000513          	li	a0,0
   107d0:	00c6e6b3          	or	a3,a3,a2
   107d4:	30d7aa23          	sw	a3,788(a5)
   107d8:	00270693          	addi	a3,a4,2
   107dc:	00369693          	slli	a3,a3,0x3
   107e0:	0017071b          	addiw	a4,a4,1
   107e4:	00e7a423          	sw	a4,8(a5)
   107e8:	00d787b3          	add	a5,a5,a3
   107ec:	00b7b023          	sd	a1,0(a5)
   107f0:	00008067          	ret
   107f4:	fff00513          	li	a0,-1
   107f8:	00008067          	ret

00000000000107fc <_exit>:
   107fc:	05d00893          	li	a7,93
   10800:	00000073          	ecall
   10804:	00054463          	bltz	a0,1080c <_exit+0x10>
   10808:	0000006f          	j	10808 <_exit+0xc>
   1080c:	ff010113          	addi	sp,sp,-16
   10810:	00813023          	sd	s0,0(sp)
   10814:	00050413          	mv	s0,a0
   10818:	00113423          	sd	ra,8(sp)
   1081c:	4080043b          	negw	s0,s0
   10820:	00c000ef          	jal	ra,1082c <__errno>
   10824:	00852023          	sw	s0,0(a0)
   10828:	0000006f          	j	10828 <_exit+0x2c>

000000000001082c <__errno>:
   1082c:	f581b503          	ld	a0,-168(gp) # 11fa8 <_impure_ptr>
   10830:	00008067          	ret

Disassembly of section .eh_frame:

0000000000011834 <__FRAME_END__>:
   11834:	0000                	.2byte	0x0
	...

Disassembly of section .init_array:

0000000000011838 <__init_array_start>:
   11838:	0118                	.2byte	0x118
   1183a:	0001                	.2byte	0x1
   1183c:	0000                	.2byte	0x0
	...

0000000000011840 <__frame_dummy_init_array_entry>:
   11840:	01c0                	.2byte	0x1c0
   11842:	0001                	.2byte	0x1
   11844:	0000                	.2byte	0x0
	...

Disassembly of section .fini_array:

0000000000011848 <__do_global_dtors_aux_fini_array_entry>:
   11848:	017c                	.2byte	0x17c
   1184a:	0001                	.2byte	0x1
   1184c:	0000                	.2byte	0x0
	...

Disassembly of section .data:

0000000000011850 <impure_data>:
	...
   11858:	1d88                	.2byte	0x1d88
   1185a:	0001                	.2byte	0x1
   1185c:	0000                	.2byte	0x0
   1185e:	0000                	.2byte	0x0
   11860:	1e38                	.2byte	0x1e38
   11862:	0001                	.2byte	0x1
   11864:	0000                	.2byte	0x0
   11866:	0000                	.2byte	0x0
   11868:	1ee8                	.2byte	0x1ee8
   1186a:	0001                	.2byte	0x1
	...
   11938:	0001                	.2byte	0x1
   1193a:	0000                	.2byte	0x0
   1193c:	0000                	.2byte	0x0
   1193e:	0000                	.2byte	0x0
   11940:	330e                	.2byte	0x330e
   11942:	abcd                	.2byte	0xabcd
   11944:	1234                	.2byte	0x1234
   11946:	e66d                	.2byte	0xe66d
   11948:	deec                	.2byte	0xdeec
   1194a:	0005                	.2byte	0x5
   1194c:	0000000b          	.4byte	0xb
	...

Disassembly of section .sdata:

0000000000011f98 <_global_impure_ptr>:
   11f98:	1850                	.2byte	0x1850
   11f9a:	0001                	.2byte	0x1
   11f9c:	0000                	.2byte	0x0
	...

0000000000011fa0 <__dso_handle>:
	...

0000000000011fa8 <_impure_ptr>:
   11fa8:	1850                	.2byte	0x1850
   11faa:	0001                	.2byte	0x1
   11fac:	0000                	.2byte	0x0
	...

Disassembly of section .bss:

0000000000011fb0 <completed.1>:
	...

0000000000011fb8 <object.0>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347          	.4byte	0x3a434347
   4:	2820                	.2byte	0x2820
   6:	31202967          	.4byte	0x31202967
   a:	2e32                	.2byte	0x2e32
   c:	2e31                	.2byte	0x2e31
   e:	0030                	.2byte	0x30
  10:	3a434347          	.4byte	0x3a434347
  14:	2820                	.2byte	0x2820
  16:	29554e47          	.4byte	0x29554e47
  1a:	3120                	.2byte	0x3120
  1c:	2e32                	.2byte	0x2e32
  1e:	2e31                	.2byte	0x2e31
  20:	0030                	.2byte	0x30

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	2041                	.2byte	0x2041
   2:	0000                	.2byte	0x0
   4:	7200                	.2byte	0x7200
   6:	7369                	.2byte	0x7369
   8:	01007663          	bgeu	zero,a6,14 <exit-0x100d4>
   c:	0016                	.2byte	0x16
   e:	0000                	.2byte	0x0
  10:	1004                	.2byte	0x1004
  12:	7205                	.2byte	0x7205
  14:	3676                	.2byte	0x3676
  16:	6934                	.2byte	0x6934
  18:	7032                	.2byte	0x7032
  1a:	5f30                	.2byte	0x5f30
  1c:	3261                	.2byte	0x3261
  1e:	3070                	.2byte	0x3070
	...
