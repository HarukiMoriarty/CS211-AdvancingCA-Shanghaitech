
riscv-elf/test1.riscv:     file format elf64-littleriscv


Disassembly of section .text:

00000000000100e8 <exit>:
   100e8:	ff010113          	addi	sp,sp,-16
   100ec:	00000593          	li	a1,0
   100f0:	00813023          	sd	s0,0(sp)
   100f4:	00113423          	sd	ra,8(sp)
   100f8:	00050413          	mv	s0,a0
   100fc:	5dd000ef          	jal	ra,10ed8 <__call_exitprocs>
   10100:	f501b503          	ld	a0,-176(gp) # 12918 <_global_impure_ptr>
   10104:	05853783          	ld	a5,88(a0)
   10108:	00078463          	beqz	a5,10110 <exit+0x28>
   1010c:	000780e7          	jalr	a5
   10110:	00040513          	mv	a0,s0
   10114:	004010ef          	jal	ra,11118 <_exit>

0000000000010118 <register_fini>:
   10118:	00000793          	li	a5,0
   1011c:	00078863          	beqz	a5,1012c <register_fini+0x14>
   10120:	00011537          	lui	a0,0x11
   10124:	00050513          	mv	a0,a0
   10128:	7350006f          	j	1105c <atexit>
   1012c:	00008067          	ret

0000000000010130 <_start>:
   10130:	00003197          	auipc	gp,0x3
   10134:	89818193          	addi	gp,gp,-1896 # 129c8 <__global_pointer$>
   10138:	f6818513          	addi	a0,gp,-152 # 12930 <completed.1>
   1013c:	fa018613          	addi	a2,gp,-96 # 12968 <__BSS_END__>
   10140:	40a60633          	sub	a2,a2,a0
   10144:	00000593          	li	a1,0
   10148:	4b5000ef          	jal	ra,10dfc <memset>
   1014c:	00001517          	auipc	a0,0x1
   10150:	f1050513          	addi	a0,a0,-240 # 1105c <atexit>
   10154:	00050863          	beqz	a0,10164 <_start+0x34>
   10158:	00001517          	auipc	a0,0x1
   1015c:	ea850513          	addi	a0,a0,-344 # 11000 <__libc_fini_array>
   10160:	6fd000ef          	jal	ra,1105c <atexit>
   10164:	3fd000ef          	jal	ra,10d60 <__libc_init_array>
   10168:	00012503          	lw	a0,0(sp)
   1016c:	00810593          	addi	a1,sp,8
   10170:	00000613          	li	a2,0
   10174:	3dc000ef          	jal	ra,10550 <main>
   10178:	f71ff06f          	j	100e8 <exit>

000000000001017c <__do_global_dtors_aux>:
   1017c:	ff010113          	addi	sp,sp,-16
   10180:	00813023          	sd	s0,0(sp)
   10184:	f681c783          	lbu	a5,-152(gp) # 12930 <completed.1>
   10188:	00113423          	sd	ra,8(sp)
   1018c:	02079263          	bnez	a5,101b0 <__do_global_dtors_aux+0x34>
   10190:	00000793          	li	a5,0
   10194:	00078a63          	beqz	a5,101a8 <__do_global_dtors_aux+0x2c>
   10198:	00012537          	lui	a0,0x12
   1019c:	1ac50513          	addi	a0,a0,428 # 121ac <__FRAME_END__>
   101a0:	00000097          	auipc	ra,0x0
   101a4:	000000e7          	jalr	zero # 0 <exit-0x100e8>
   101a8:	00100793          	li	a5,1
   101ac:	f6f18423          	sb	a5,-152(gp) # 12930 <completed.1>
   101b0:	00813083          	ld	ra,8(sp)
   101b4:	00013403          	ld	s0,0(sp)
   101b8:	01010113          	addi	sp,sp,16
   101bc:	00008067          	ret

00000000000101c0 <frame_dummy>:
   101c0:	00000793          	li	a5,0
   101c4:	00078c63          	beqz	a5,101dc <frame_dummy+0x1c>
   101c8:	00012537          	lui	a0,0x12
   101cc:	f7018593          	addi	a1,gp,-144 # 12938 <object.0>
   101d0:	1ac50513          	addi	a0,a0,428 # 121ac <__FRAME_END__>
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

00000000000102e4 <matmulti>:
   102e4:	f8010113          	addi	sp,sp,-128
   102e8:	06113c23          	sd	ra,120(sp)
   102ec:	06813823          	sd	s0,112(sp)
   102f0:	06913423          	sd	s1,104(sp)
   102f4:	07213023          	sd	s2,96(sp)
   102f8:	05313c23          	sd	s3,88(sp)
   102fc:	08010413          	addi	s0,sp,128
   10300:	f8a43c23          	sd	a0,-104(s0)
   10304:	f8b43823          	sd	a1,-112(s0)
   10308:	f8c43423          	sd	a2,-120(s0)
   1030c:	f8d42223          	sw	a3,-124(s0)
   10310:	00a00693          	li	a3,10
   10314:	fff68693          	addi	a3,a3,-1
   10318:	fad43c23          	sd	a3,-72(s0)
   1031c:	00a00693          	li	a3,10
   10320:	00068913          	mv	s2,a3
   10324:	00000993          	li	s3,0
   10328:	03b95693          	srli	a3,s2,0x3b
   1032c:	00599393          	slli	t2,s3,0x5
   10330:	0076e3b3          	or	t2,a3,t2
   10334:	00591313          	slli	t1,s2,0x5
   10338:	00a00693          	li	a3,10
   1033c:	fff68693          	addi	a3,a3,-1
   10340:	fad43823          	sd	a3,-80(s0)
   10344:	00a00693          	li	a3,10
   10348:	00068f13          	mv	t5,a3
   1034c:	00000f93          	li	t6,0
   10350:	03bf5693          	srli	a3,t5,0x3b
   10354:	005f9893          	slli	a7,t6,0x5
   10358:	0116e8b3          	or	a7,a3,a7
   1035c:	005f1813          	slli	a6,t5,0x5
   10360:	00a00693          	li	a3,10
   10364:	fff68693          	addi	a3,a3,-1
   10368:	fad43423          	sd	a3,-88(s0)
   1036c:	00a00693          	li	a3,10
   10370:	00068e13          	mv	t3,a3
   10374:	00000e93          	li	t4,0
   10378:	03be5693          	srli	a3,t3,0x3b
   1037c:	005e9793          	slli	a5,t4,0x5
   10380:	00f6e7b3          	or	a5,a3,a5
   10384:	005e1713          	slli	a4,t3,0x5
   10388:	fc042623          	sw	zero,-52(s0)
   1038c:	1880006f          	j	10514 <matmulti+0x230>
   10390:	fc042423          	sw	zero,-56(s0)
   10394:	15c0006f          	j	104f0 <matmulti+0x20c>
   10398:	fcc42783          	lw	a5,-52(s0)
   1039c:	00a00713          	li	a4,10
   103a0:	00070593          	mv	a1,a4
   103a4:	00078513          	mv	a0,a5
   103a8:	109000ef          	jal	ra,10cb0 <__muldi3>
   103ac:	00050793          	mv	a5,a0
   103b0:	00279793          	slli	a5,a5,0x2
   103b4:	f8843703          	ld	a4,-120(s0)
   103b8:	00f70733          	add	a4,a4,a5
   103bc:	fc842783          	lw	a5,-56(s0)
   103c0:	00279793          	slli	a5,a5,0x2
   103c4:	00f707b3          	add	a5,a4,a5
   103c8:	0007a023          	sw	zero,0(a5)
   103cc:	fc042223          	sw	zero,-60(s0)
   103d0:	0fc0006f          	j	104cc <matmulti+0x1e8>
   103d4:	fcc42783          	lw	a5,-52(s0)
   103d8:	00a00713          	li	a4,10
   103dc:	00070593          	mv	a1,a4
   103e0:	00078513          	mv	a0,a5
   103e4:	0cd000ef          	jal	ra,10cb0 <__muldi3>
   103e8:	00050793          	mv	a5,a0
   103ec:	00279793          	slli	a5,a5,0x2
   103f0:	f8843703          	ld	a4,-120(s0)
   103f4:	00f70733          	add	a4,a4,a5
   103f8:	fc842783          	lw	a5,-56(s0)
   103fc:	00279793          	slli	a5,a5,0x2
   10400:	00f707b3          	add	a5,a4,a5
   10404:	0007a903          	lw	s2,0(a5)
   10408:	fcc42783          	lw	a5,-52(s0)
   1040c:	00a00713          	li	a4,10
   10410:	00070593          	mv	a1,a4
   10414:	00078513          	mv	a0,a5
   10418:	099000ef          	jal	ra,10cb0 <__muldi3>
   1041c:	00050793          	mv	a5,a0
   10420:	00279793          	slli	a5,a5,0x2
   10424:	f9843703          	ld	a4,-104(s0)
   10428:	00f70733          	add	a4,a4,a5
   1042c:	fc442783          	lw	a5,-60(s0)
   10430:	00279793          	slli	a5,a5,0x2
   10434:	00f707b3          	add	a5,a4,a5
   10438:	0007a483          	lw	s1,0(a5)
   1043c:	fc442783          	lw	a5,-60(s0)
   10440:	00a00713          	li	a4,10
   10444:	00070593          	mv	a1,a4
   10448:	00078513          	mv	a0,a5
   1044c:	065000ef          	jal	ra,10cb0 <__muldi3>
   10450:	00050793          	mv	a5,a0
   10454:	00279793          	slli	a5,a5,0x2
   10458:	f9043703          	ld	a4,-112(s0)
   1045c:	00f70733          	add	a4,a4,a5
   10460:	fc842783          	lw	a5,-56(s0)
   10464:	00279793          	slli	a5,a5,0x2
   10468:	00f707b3          	add	a5,a4,a5
   1046c:	0007a783          	lw	a5,0(a5)
   10470:	00078593          	mv	a1,a5
   10474:	00048513          	mv	a0,s1
   10478:	039000ef          	jal	ra,10cb0 <__muldi3>
   1047c:	00050793          	mv	a5,a0
   10480:	0007849b          	sext.w	s1,a5
   10484:	fcc42783          	lw	a5,-52(s0)
   10488:	00a00713          	li	a4,10
   1048c:	00070593          	mv	a1,a4
   10490:	00078513          	mv	a0,a5
   10494:	01d000ef          	jal	ra,10cb0 <__muldi3>
   10498:	00050793          	mv	a5,a0
   1049c:	00279793          	slli	a5,a5,0x2
   104a0:	f8843703          	ld	a4,-120(s0)
   104a4:	00f706b3          	add	a3,a4,a5
   104a8:	009907bb          	addw	a5,s2,s1
   104ac:	0007871b          	sext.w	a4,a5
   104b0:	fc842783          	lw	a5,-56(s0)
   104b4:	00279793          	slli	a5,a5,0x2
   104b8:	00f687b3          	add	a5,a3,a5
   104bc:	00e7a023          	sw	a4,0(a5)
   104c0:	fc442783          	lw	a5,-60(s0)
   104c4:	0017879b          	addiw	a5,a5,1
   104c8:	fcf42223          	sw	a5,-60(s0)
   104cc:	fc442783          	lw	a5,-60(s0)
   104d0:	00078713          	mv	a4,a5
   104d4:	f8442783          	lw	a5,-124(s0)
   104d8:	0007071b          	sext.w	a4,a4
   104dc:	0007879b          	sext.w	a5,a5
   104e0:	eef74ae3          	blt	a4,a5,103d4 <matmulti+0xf0>
   104e4:	fc842783          	lw	a5,-56(s0)
   104e8:	0017879b          	addiw	a5,a5,1
   104ec:	fcf42423          	sw	a5,-56(s0)
   104f0:	fc842783          	lw	a5,-56(s0)
   104f4:	00078713          	mv	a4,a5
   104f8:	f8442783          	lw	a5,-124(s0)
   104fc:	0007071b          	sext.w	a4,a4
   10500:	0007879b          	sext.w	a5,a5
   10504:	e8f74ae3          	blt	a4,a5,10398 <matmulti+0xb4>
   10508:	fcc42783          	lw	a5,-52(s0)
   1050c:	0017879b          	addiw	a5,a5,1
   10510:	fcf42623          	sw	a5,-52(s0)
   10514:	fcc42783          	lw	a5,-52(s0)
   10518:	00078713          	mv	a4,a5
   1051c:	f8442783          	lw	a5,-124(s0)
   10520:	0007071b          	sext.w	a4,a4
   10524:	0007879b          	sext.w	a5,a5
   10528:	e6f744e3          	blt	a4,a5,10390 <matmulti+0xac>
   1052c:	00000013          	nop
   10530:	00000013          	nop
   10534:	07813083          	ld	ra,120(sp)
   10538:	07013403          	ld	s0,112(sp)
   1053c:	06813483          	ld	s1,104(sp)
   10540:	06013903          	ld	s2,96(sp)
   10544:	05813983          	ld	s3,88(sp)
   10548:	08010113          	addi	sp,sp,128
   1054c:	00008067          	ret

0000000000010550 <main>:
   10550:	e2010113          	addi	sp,sp,-480
   10554:	1c113c23          	sd	ra,472(sp)
   10558:	1c813823          	sd	s0,464(sp)
   1055c:	1c913423          	sd	s1,456(sp)
   10560:	1d213023          	sd	s2,448(sp)
   10564:	1b313c23          	sd	s3,440(sp)
   10568:	1b413823          	sd	s4,432(sp)
   1056c:	1b513423          	sd	s5,424(sp)
   10570:	1b613023          	sd	s6,416(sp)
   10574:	19713c23          	sd	s7,408(sp)
   10578:	19813823          	sd	s8,400(sp)
   1057c:	19913423          	sd	s9,392(sp)
   10580:	19a13023          	sd	s10,384(sp)
   10584:	17b13c23          	sd	s11,376(sp)
   10588:	1e010413          	addi	s0,sp,480
   1058c:	00010793          	mv	a5,sp
   10590:	e2f43023          	sd	a5,-480(s0)
   10594:	00a00793          	li	a5,10
   10598:	fff78793          	addi	a5,a5,-1
   1059c:	f6f43423          	sd	a5,-152(s0)
   105a0:	00a00793          	li	a5,10
   105a4:	00078513          	mv	a0,a5
   105a8:	00000593          	li	a1,0
   105ac:	03b55793          	srli	a5,a0,0x3b
   105b0:	00559693          	slli	a3,a1,0x5
   105b4:	00d7e6b3          	or	a3,a5,a3
   105b8:	00551613          	slli	a2,a0,0x5
   105bc:	00a00793          	li	a5,10
   105c0:	00279793          	slli	a5,a5,0x2
   105c4:	e2f43423          	sd	a5,-472(s0)
   105c8:	00a00793          	li	a5,10
   105cc:	fff78793          	addi	a5,a5,-1
   105d0:	f6f43023          	sd	a5,-160(s0)
   105d4:	00a00793          	li	a5,10
   105d8:	00078313          	mv	t1,a5
   105dc:	00000393          	li	t2,0
   105e0:	00a00793          	li	a5,10
   105e4:	00078813          	mv	a6,a5
   105e8:	00000893          	li	a7,0
   105ec:	00080613          	mv	a2,a6
   105f0:	00088693          	mv	a3,a7
   105f4:	00030513          	mv	a0,t1
   105f8:	00038593          	mv	a1,t2
   105fc:	6d8000ef          	jal	ra,10cd4 <__multi3>
   10600:	00050613          	mv	a2,a0
   10604:	00058693          	mv	a3,a1
   10608:	00060713          	mv	a4,a2
   1060c:	00068793          	mv	a5,a3
   10610:	03b75693          	srli	a3,a4,0x3b
   10614:	00579993          	slli	s3,a5,0x5
   10618:	0136e9b3          	or	s3,a3,s3
   1061c:	00571913          	slli	s2,a4,0x5
   10620:	00a00793          	li	a5,10
   10624:	00078713          	mv	a4,a5
   10628:	00a00793          	li	a5,10
   1062c:	00078593          	mv	a1,a5
   10630:	00070513          	mv	a0,a4
   10634:	67c000ef          	jal	ra,10cb0 <__muldi3>
   10638:	00a00793          	li	a5,10
   1063c:	f0f43023          	sd	a5,-256(s0)
   10640:	f0043423          	sd	zero,-248(s0)
   10644:	00a00793          	li	a5,10
   10648:	eef43823          	sd	a5,-272(s0)
   1064c:	ee043c23          	sd	zero,-264(s0)
   10650:	ef043603          	ld	a2,-272(s0)
   10654:	ef843683          	ld	a3,-264(s0)
   10658:	f0043503          	ld	a0,-256(s0)
   1065c:	f0843583          	ld	a1,-248(s0)
   10660:	674000ef          	jal	ra,10cd4 <__multi3>
   10664:	00050613          	mv	a2,a0
   10668:	00058693          	mv	a3,a1
   1066c:	00060713          	mv	a4,a2
   10670:	00068793          	mv	a5,a3
   10674:	03b75693          	srli	a3,a4,0x3b
   10678:	00579a93          	slli	s5,a5,0x5
   1067c:	0156eab3          	or	s5,a3,s5
   10680:	00571a13          	slli	s4,a4,0x5
   10684:	00a00793          	li	a5,10
   10688:	00078713          	mv	a4,a5
   1068c:	00a00793          	li	a5,10
   10690:	00078593          	mv	a1,a5
   10694:	00070513          	mv	a0,a4
   10698:	618000ef          	jal	ra,10cb0 <__muldi3>
   1069c:	00050793          	mv	a5,a0
   106a0:	00279793          	slli	a5,a5,0x2
   106a4:	00f78793          	addi	a5,a5,15
   106a8:	0047d793          	srli	a5,a5,0x4
   106ac:	00479793          	slli	a5,a5,0x4
   106b0:	40f10133          	sub	sp,sp,a5
   106b4:	00010793          	mv	a5,sp
   106b8:	00378793          	addi	a5,a5,3
   106bc:	0027d793          	srli	a5,a5,0x2
   106c0:	00279793          	slli	a5,a5,0x2
   106c4:	f4f43c23          	sd	a5,-168(s0)
   106c8:	00a00793          	li	a5,10
   106cc:	fff78793          	addi	a5,a5,-1
   106d0:	f4f43823          	sd	a5,-176(s0)
   106d4:	00a00793          	li	a5,10
   106d8:	00078c13          	mv	s8,a5
   106dc:	00000c93          	li	s9,0
   106e0:	03bc5793          	srli	a5,s8,0x3b
   106e4:	005c9b93          	slli	s7,s9,0x5
   106e8:	0177ebb3          	or	s7,a5,s7
   106ec:	005c1b13          	slli	s6,s8,0x5
   106f0:	00a00793          	li	a5,10
   106f4:	00279a13          	slli	s4,a5,0x2
   106f8:	00a00793          	li	a5,10
   106fc:	fff78793          	addi	a5,a5,-1
   10700:	f4f43423          	sd	a5,-184(s0)
   10704:	00a00793          	li	a5,10
   10708:	eef43023          	sd	a5,-288(s0)
   1070c:	ee043423          	sd	zero,-280(s0)
   10710:	00a00793          	li	a5,10
   10714:	ecf43823          	sd	a5,-304(s0)
   10718:	ec043c23          	sd	zero,-296(s0)
   1071c:	ed043603          	ld	a2,-304(s0)
   10720:	ed843683          	ld	a3,-296(s0)
   10724:	ee043503          	ld	a0,-288(s0)
   10728:	ee843583          	ld	a1,-280(s0)
   1072c:	5a8000ef          	jal	ra,10cd4 <__multi3>
   10730:	00050613          	mv	a2,a0
   10734:	00058693          	mv	a3,a1
   10738:	00060713          	mv	a4,a2
   1073c:	00068793          	mv	a5,a3
   10740:	03b75693          	srli	a3,a4,0x3b
   10744:	00579613          	slli	a2,a5,0x5
   10748:	ecc43423          	sd	a2,-312(s0)
   1074c:	ec843603          	ld	a2,-312(s0)
   10750:	00c6e6b3          	or	a3,a3,a2
   10754:	ecd43423          	sd	a3,-312(s0)
   10758:	00571793          	slli	a5,a4,0x5
   1075c:	ecf43023          	sd	a5,-320(s0)
   10760:	00a00793          	li	a5,10
   10764:	00078713          	mv	a4,a5
   10768:	00a00793          	li	a5,10
   1076c:	00078593          	mv	a1,a5
   10770:	00070513          	mv	a0,a4
   10774:	53c000ef          	jal	ra,10cb0 <__muldi3>
   10778:	00a00793          	li	a5,10
   1077c:	eaf43823          	sd	a5,-336(s0)
   10780:	ea043c23          	sd	zero,-328(s0)
   10784:	00a00793          	li	a5,10
   10788:	eaf43023          	sd	a5,-352(s0)
   1078c:	ea043423          	sd	zero,-344(s0)
   10790:	ea043603          	ld	a2,-352(s0)
   10794:	ea843683          	ld	a3,-344(s0)
   10798:	eb043503          	ld	a0,-336(s0)
   1079c:	eb843583          	ld	a1,-328(s0)
   107a0:	534000ef          	jal	ra,10cd4 <__multi3>
   107a4:	00050613          	mv	a2,a0
   107a8:	00058693          	mv	a3,a1
   107ac:	00060713          	mv	a4,a2
   107b0:	00068793          	mv	a5,a3
   107b4:	03b75693          	srli	a3,a4,0x3b
   107b8:	00579613          	slli	a2,a5,0x5
   107bc:	e8c43c23          	sd	a2,-360(s0)
   107c0:	e9843603          	ld	a2,-360(s0)
   107c4:	00c6e6b3          	or	a3,a3,a2
   107c8:	e8d43c23          	sd	a3,-360(s0)
   107cc:	00571793          	slli	a5,a4,0x5
   107d0:	e8f43823          	sd	a5,-368(s0)
   107d4:	00a00793          	li	a5,10
   107d8:	00078713          	mv	a4,a5
   107dc:	00a00793          	li	a5,10
   107e0:	00078593          	mv	a1,a5
   107e4:	00070513          	mv	a0,a4
   107e8:	4c8000ef          	jal	ra,10cb0 <__muldi3>
   107ec:	00050793          	mv	a5,a0
   107f0:	00279793          	slli	a5,a5,0x2
   107f4:	00f78793          	addi	a5,a5,15
   107f8:	0047d793          	srli	a5,a5,0x4
   107fc:	00479793          	slli	a5,a5,0x4
   10800:	40f10133          	sub	sp,sp,a5
   10804:	00010793          	mv	a5,sp
   10808:	00378793          	addi	a5,a5,3
   1080c:	0027d793          	srli	a5,a5,0x2
   10810:	00279793          	slli	a5,a5,0x2
   10814:	f4f43023          	sd	a5,-192(s0)
   10818:	00a00793          	li	a5,10
   1081c:	fff78793          	addi	a5,a5,-1
   10820:	f2f43c23          	sd	a5,-200(s0)
   10824:	00a00793          	li	a5,10
   10828:	f0f43823          	sd	a5,-240(s0)
   1082c:	f0043c23          	sd	zero,-232(s0)
   10830:	f1043783          	ld	a5,-240(s0)
   10834:	03b7d793          	srli	a5,a5,0x3b
   10838:	f1843703          	ld	a4,-232(s0)
   1083c:	00571713          	slli	a4,a4,0x5
   10840:	e8e43423          	sd	a4,-376(s0)
   10844:	e8843703          	ld	a4,-376(s0)
   10848:	00e7e7b3          	or	a5,a5,a4
   1084c:	e8f43423          	sd	a5,-376(s0)
   10850:	f1043783          	ld	a5,-240(s0)
   10854:	00579793          	slli	a5,a5,0x5
   10858:	e8f43023          	sd	a5,-384(s0)
   1085c:	00a00793          	li	a5,10
   10860:	00279493          	slli	s1,a5,0x2
   10864:	00a00793          	li	a5,10
   10868:	fff78793          	addi	a5,a5,-1
   1086c:	f2f43823          	sd	a5,-208(s0)
   10870:	00a00793          	li	a5,10
   10874:	e6f43823          	sd	a5,-400(s0)
   10878:	e6043c23          	sd	zero,-392(s0)
   1087c:	00a00793          	li	a5,10
   10880:	e6f43023          	sd	a5,-416(s0)
   10884:	e6043423          	sd	zero,-408(s0)
   10888:	e6043603          	ld	a2,-416(s0)
   1088c:	e6843683          	ld	a3,-408(s0)
   10890:	e7043503          	ld	a0,-400(s0)
   10894:	e7843583          	ld	a1,-392(s0)
   10898:	43c000ef          	jal	ra,10cd4 <__multi3>
   1089c:	00050613          	mv	a2,a0
   108a0:	00058693          	mv	a3,a1
   108a4:	00060713          	mv	a4,a2
   108a8:	00068793          	mv	a5,a3
   108ac:	03b75693          	srli	a3,a4,0x3b
   108b0:	00579613          	slli	a2,a5,0x5
   108b4:	e4c43c23          	sd	a2,-424(s0)
   108b8:	e5843603          	ld	a2,-424(s0)
   108bc:	00c6e6b3          	or	a3,a3,a2
   108c0:	e4d43c23          	sd	a3,-424(s0)
   108c4:	00571793          	slli	a5,a4,0x5
   108c8:	e4f43823          	sd	a5,-432(s0)
   108cc:	00a00793          	li	a5,10
   108d0:	00078713          	mv	a4,a5
   108d4:	00a00793          	li	a5,10
   108d8:	00078593          	mv	a1,a5
   108dc:	00070513          	mv	a0,a4
   108e0:	3d0000ef          	jal	ra,10cb0 <__muldi3>
   108e4:	00a00793          	li	a5,10
   108e8:	e4f43023          	sd	a5,-448(s0)
   108ec:	e4043423          	sd	zero,-440(s0)
   108f0:	00a00793          	li	a5,10
   108f4:	e2f43823          	sd	a5,-464(s0)
   108f8:	e2043c23          	sd	zero,-456(s0)
   108fc:	e3043603          	ld	a2,-464(s0)
   10900:	e3843683          	ld	a3,-456(s0)
   10904:	e4043503          	ld	a0,-448(s0)
   10908:	e4843583          	ld	a1,-440(s0)
   1090c:	3c8000ef          	jal	ra,10cd4 <__multi3>
   10910:	00050613          	mv	a2,a0
   10914:	00058693          	mv	a3,a1
   10918:	00060713          	mv	a4,a2
   1091c:	00068793          	mv	a5,a3
   10920:	03b75693          	srli	a3,a4,0x3b
   10924:	00579d93          	slli	s11,a5,0x5
   10928:	01b6edb3          	or	s11,a3,s11
   1092c:	00571d13          	slli	s10,a4,0x5
   10930:	00a00793          	li	a5,10
   10934:	00078713          	mv	a4,a5
   10938:	00a00793          	li	a5,10
   1093c:	00078593          	mv	a1,a5
   10940:	00070513          	mv	a0,a4
   10944:	36c000ef          	jal	ra,10cb0 <__muldi3>
   10948:	00050793          	mv	a5,a0
   1094c:	00279793          	slli	a5,a5,0x2
   10950:	00f78793          	addi	a5,a5,15
   10954:	0047d793          	srli	a5,a5,0x4
   10958:	00479793          	slli	a5,a5,0x4
   1095c:	40f10133          	sub	sp,sp,a5
   10960:	00010793          	mv	a5,sp
   10964:	00378793          	addi	a5,a5,3
   10968:	0027d793          	srli	a5,a5,0x2
   1096c:	00279793          	slli	a5,a5,0x2
   10970:	f2f43423          	sd	a5,-216(s0)
   10974:	f8042623          	sw	zero,-116(s0)
   10978:	0d00006f          	j	10a48 <main+0x4f8>
   1097c:	f8042423          	sw	zero,-120(s0)
   10980:	0ac0006f          	j	10a2c <main+0x4dc>
   10984:	e2843783          	ld	a5,-472(s0)
   10988:	0027d713          	srli	a4,a5,0x2
   1098c:	f5843903          	ld	s2,-168(s0)
   10990:	f8842983          	lw	s3,-120(s0)
   10994:	f8c42783          	lw	a5,-116(s0)
   10998:	00070593          	mv	a1,a4
   1099c:	00078513          	mv	a0,a5
   109a0:	310000ef          	jal	ra,10cb0 <__muldi3>
   109a4:	00050793          	mv	a5,a0
   109a8:	00f987b3          	add	a5,s3,a5
   109ac:	00279793          	slli	a5,a5,0x2
   109b0:	00f907b3          	add	a5,s2,a5
   109b4:	f8c42703          	lw	a4,-116(s0)
   109b8:	00e7a023          	sw	a4,0(a5)
   109bc:	002a5713          	srli	a4,s4,0x2
   109c0:	f4043903          	ld	s2,-192(s0)
   109c4:	f8842983          	lw	s3,-120(s0)
   109c8:	f8c42783          	lw	a5,-116(s0)
   109cc:	00070593          	mv	a1,a4
   109d0:	00078513          	mv	a0,a5
   109d4:	2dc000ef          	jal	ra,10cb0 <__muldi3>
   109d8:	00050793          	mv	a5,a0
   109dc:	00f987b3          	add	a5,s3,a5
   109e0:	00279793          	slli	a5,a5,0x2
   109e4:	00f907b3          	add	a5,s2,a5
   109e8:	f8842703          	lw	a4,-120(s0)
   109ec:	00e7a023          	sw	a4,0(a5)
   109f0:	0024d713          	srli	a4,s1,0x2
   109f4:	f2843903          	ld	s2,-216(s0)
   109f8:	f8842983          	lw	s3,-120(s0)
   109fc:	f8c42783          	lw	a5,-116(s0)
   10a00:	00070593          	mv	a1,a4
   10a04:	00078513          	mv	a0,a5
   10a08:	2a8000ef          	jal	ra,10cb0 <__muldi3>
   10a0c:	00050793          	mv	a5,a0
   10a10:	00f987b3          	add	a5,s3,a5
   10a14:	00279793          	slli	a5,a5,0x2
   10a18:	00f907b3          	add	a5,s2,a5
   10a1c:	0007a023          	sw	zero,0(a5)
   10a20:	f8842783          	lw	a5,-120(s0)
   10a24:	0017879b          	addiw	a5,a5,1
   10a28:	f8f42423          	sw	a5,-120(s0)
   10a2c:	00a00713          	li	a4,10
   10a30:	f8842783          	lw	a5,-120(s0)
   10a34:	0007879b          	sext.w	a5,a5
   10a38:	f4e7c6e3          	blt	a5,a4,10984 <main+0x434>
   10a3c:	f8c42783          	lw	a5,-116(s0)
   10a40:	0017879b          	addiw	a5,a5,1
   10a44:	f8f42623          	sw	a5,-116(s0)
   10a48:	00a00713          	li	a4,10
   10a4c:	f8c42783          	lw	a5,-116(s0)
   10a50:	0007879b          	sext.w	a5,a5
   10a54:	f2e7c4e3          	blt	a5,a4,1097c <main+0x42c>
   10a58:	000117b7          	lui	a5,0x11
   10a5c:	15078513          	addi	a0,a5,336 # 11150 <__errno+0x8>
   10a60:	facff0ef          	jal	ra,1020c <print_s>
   10a64:	f8042223          	sw	zero,-124(s0)
   10a68:	0880006f          	j	10af0 <main+0x5a0>
   10a6c:	f8042023          	sw	zero,-128(s0)
   10a70:	0580006f          	j	10ac8 <main+0x578>
   10a74:	e2843783          	ld	a5,-472(s0)
   10a78:	0027d713          	srli	a4,a5,0x2
   10a7c:	f5843903          	ld	s2,-168(s0)
   10a80:	f8042983          	lw	s3,-128(s0)
   10a84:	f8442783          	lw	a5,-124(s0)
   10a88:	00070593          	mv	a1,a4
   10a8c:	00078513          	mv	a0,a5
   10a90:	220000ef          	jal	ra,10cb0 <__muldi3>
   10a94:	00050793          	mv	a5,a0
   10a98:	00f987b3          	add	a5,s3,a5
   10a9c:	00279793          	slli	a5,a5,0x2
   10aa0:	00f907b3          	add	a5,s2,a5
   10aa4:	0007a783          	lw	a5,0(a5)
   10aa8:	00078513          	mv	a0,a5
   10aac:	f34ff0ef          	jal	ra,101e0 <print_d>
   10ab0:	000117b7          	lui	a5,0x11
   10ab4:	16878513          	addi	a0,a5,360 # 11168 <__errno+0x20>
   10ab8:	f54ff0ef          	jal	ra,1020c <print_s>
   10abc:	f8042783          	lw	a5,-128(s0)
   10ac0:	0017879b          	addiw	a5,a5,1
   10ac4:	f8f42023          	sw	a5,-128(s0)
   10ac8:	00a00713          	li	a4,10
   10acc:	f8042783          	lw	a5,-128(s0)
   10ad0:	0007879b          	sext.w	a5,a5
   10ad4:	fae7c0e3          	blt	a5,a4,10a74 <main+0x524>
   10ad8:	000117b7          	lui	a5,0x11
   10adc:	17078513          	addi	a0,a5,368 # 11170 <__errno+0x28>
   10ae0:	f2cff0ef          	jal	ra,1020c <print_s>
   10ae4:	f8442783          	lw	a5,-124(s0)
   10ae8:	0017879b          	addiw	a5,a5,1
   10aec:	f8f42223          	sw	a5,-124(s0)
   10af0:	00a00713          	li	a4,10
   10af4:	f8442783          	lw	a5,-124(s0)
   10af8:	0007879b          	sext.w	a5,a5
   10afc:	f6e7c8e3          	blt	a5,a4,10a6c <main+0x51c>
   10b00:	000117b7          	lui	a5,0x11
   10b04:	17878513          	addi	a0,a5,376 # 11178 <__errno+0x30>
   10b08:	f04ff0ef          	jal	ra,1020c <print_s>
   10b0c:	f6042e23          	sw	zero,-132(s0)
   10b10:	0840006f          	j	10b94 <main+0x644>
   10b14:	f6042c23          	sw	zero,-136(s0)
   10b18:	0540006f          	j	10b6c <main+0x61c>
   10b1c:	002a5713          	srli	a4,s4,0x2
   10b20:	f4043903          	ld	s2,-192(s0)
   10b24:	f7842983          	lw	s3,-136(s0)
   10b28:	f7c42783          	lw	a5,-132(s0)
   10b2c:	00070593          	mv	a1,a4
   10b30:	00078513          	mv	a0,a5
   10b34:	17c000ef          	jal	ra,10cb0 <__muldi3>
   10b38:	00050793          	mv	a5,a0
   10b3c:	00f987b3          	add	a5,s3,a5
   10b40:	00279793          	slli	a5,a5,0x2
   10b44:	00f907b3          	add	a5,s2,a5
   10b48:	0007a783          	lw	a5,0(a5)
   10b4c:	00078513          	mv	a0,a5
   10b50:	e90ff0ef          	jal	ra,101e0 <print_d>
   10b54:	000117b7          	lui	a5,0x11
   10b58:	16878513          	addi	a0,a5,360 # 11168 <__errno+0x20>
   10b5c:	eb0ff0ef          	jal	ra,1020c <print_s>
   10b60:	f7842783          	lw	a5,-136(s0)
   10b64:	0017879b          	addiw	a5,a5,1
   10b68:	f6f42c23          	sw	a5,-136(s0)
   10b6c:	00a00713          	li	a4,10
   10b70:	f7842783          	lw	a5,-136(s0)
   10b74:	0007879b          	sext.w	a5,a5
   10b78:	fae7c2e3          	blt	a5,a4,10b1c <main+0x5cc>
   10b7c:	000117b7          	lui	a5,0x11
   10b80:	17078513          	addi	a0,a5,368 # 11170 <__errno+0x28>
   10b84:	e88ff0ef          	jal	ra,1020c <print_s>
   10b88:	f7c42783          	lw	a5,-132(s0)
   10b8c:	0017879b          	addiw	a5,a5,1
   10b90:	f6f42e23          	sw	a5,-132(s0)
   10b94:	00a00713          	li	a4,10
   10b98:	f7c42783          	lw	a5,-132(s0)
   10b9c:	0007879b          	sext.w	a5,a5
   10ba0:	f6e7cae3          	blt	a5,a4,10b14 <main+0x5c4>
   10ba4:	00a00793          	li	a5,10
   10ba8:	00078693          	mv	a3,a5
   10bac:	f2843603          	ld	a2,-216(s0)
   10bb0:	f4043583          	ld	a1,-192(s0)
   10bb4:	f5843503          	ld	a0,-168(s0)
   10bb8:	f2cff0ef          	jal	ra,102e4 <matmulti>
   10bbc:	000117b7          	lui	a5,0x11
   10bc0:	19078513          	addi	a0,a5,400 # 11190 <__errno+0x48>
   10bc4:	e48ff0ef          	jal	ra,1020c <print_s>
   10bc8:	f6042a23          	sw	zero,-140(s0)
   10bcc:	0840006f          	j	10c50 <main+0x700>
   10bd0:	f6042823          	sw	zero,-144(s0)
   10bd4:	0540006f          	j	10c28 <main+0x6d8>
   10bd8:	0024d713          	srli	a4,s1,0x2
   10bdc:	f2843903          	ld	s2,-216(s0)
   10be0:	f7042983          	lw	s3,-144(s0)
   10be4:	f7442783          	lw	a5,-140(s0)
   10be8:	00070593          	mv	a1,a4
   10bec:	00078513          	mv	a0,a5
   10bf0:	0c0000ef          	jal	ra,10cb0 <__muldi3>
   10bf4:	00050793          	mv	a5,a0
   10bf8:	00f987b3          	add	a5,s3,a5
   10bfc:	00279793          	slli	a5,a5,0x2
   10c00:	00f907b3          	add	a5,s2,a5
   10c04:	0007a783          	lw	a5,0(a5)
   10c08:	00078513          	mv	a0,a5
   10c0c:	dd4ff0ef          	jal	ra,101e0 <print_d>
   10c10:	000117b7          	lui	a5,0x11
   10c14:	16878513          	addi	a0,a5,360 # 11168 <__errno+0x20>
   10c18:	df4ff0ef          	jal	ra,1020c <print_s>
   10c1c:	f7042783          	lw	a5,-144(s0)
   10c20:	0017879b          	addiw	a5,a5,1
   10c24:	f6f42823          	sw	a5,-144(s0)
   10c28:	00a00713          	li	a4,10
   10c2c:	f7042783          	lw	a5,-144(s0)
   10c30:	0007879b          	sext.w	a5,a5
   10c34:	fae7c2e3          	blt	a5,a4,10bd8 <main+0x688>
   10c38:	000117b7          	lui	a5,0x11
   10c3c:	17078513          	addi	a0,a5,368 # 11170 <__errno+0x28>
   10c40:	dccff0ef          	jal	ra,1020c <print_s>
   10c44:	f7442783          	lw	a5,-140(s0)
   10c48:	0017879b          	addiw	a5,a5,1
   10c4c:	f6f42a23          	sw	a5,-140(s0)
   10c50:	00a00713          	li	a4,10
   10c54:	f7442783          	lw	a5,-140(s0)
   10c58:	0007879b          	sext.w	a5,a5
   10c5c:	f6e7cae3          	blt	a5,a4,10bd0 <main+0x680>
   10c60:	e00ff0ef          	jal	ra,10260 <exit_proc>
   10c64:	e2043103          	ld	sp,-480(s0)
   10c68:	00000793          	li	a5,0
   10c6c:	00078513          	mv	a0,a5
   10c70:	e2040113          	addi	sp,s0,-480
   10c74:	1d813083          	ld	ra,472(sp)
   10c78:	1d013403          	ld	s0,464(sp)
   10c7c:	1c813483          	ld	s1,456(sp)
   10c80:	1c013903          	ld	s2,448(sp)
   10c84:	1b813983          	ld	s3,440(sp)
   10c88:	1b013a03          	ld	s4,432(sp)
   10c8c:	1a813a83          	ld	s5,424(sp)
   10c90:	1a013b03          	ld	s6,416(sp)
   10c94:	19813b83          	ld	s7,408(sp)
   10c98:	19013c03          	ld	s8,400(sp)
   10c9c:	18813c83          	ld	s9,392(sp)
   10ca0:	18013d03          	ld	s10,384(sp)
   10ca4:	17813d83          	ld	s11,376(sp)
   10ca8:	1e010113          	addi	sp,sp,480
   10cac:	00008067          	ret

0000000000010cb0 <__muldi3>:
   10cb0:	00050613          	mv	a2,a0
   10cb4:	00000513          	li	a0,0
   10cb8:	0015f693          	andi	a3,a1,1
   10cbc:	00068463          	beqz	a3,10cc4 <__muldi3+0x14>
   10cc0:	00c50533          	add	a0,a0,a2
   10cc4:	0015d593          	srli	a1,a1,0x1
   10cc8:	00161613          	slli	a2,a2,0x1
   10ccc:	fe0596e3          	bnez	a1,10cb8 <__muldi3+0x8>
   10cd0:	00008067          	ret

0000000000010cd4 <__multi3>:
   10cd4:	00050e13          	mv	t3,a0
   10cd8:	ff010113          	addi	sp,sp,-16
   10cdc:	00068313          	mv	t1,a3
   10ce0:	00113423          	sd	ra,8(sp)
   10ce4:	00060513          	mv	a0,a2
   10ce8:	000e0893          	mv	a7,t3
   10cec:	00060693          	mv	a3,a2
   10cf0:	00000713          	li	a4,0
   10cf4:	00000793          	li	a5,0
   10cf8:	00000813          	li	a6,0
   10cfc:	0016fe93          	andi	t4,a3,1
   10d00:	00171613          	slli	a2,a4,0x1
   10d04:	000e8a63          	beqz	t4,10d18 <__multi3+0x44>
   10d08:	01088833          	add	a6,a7,a6
   10d0c:	00e787b3          	add	a5,a5,a4
   10d10:	01183733          	sltu	a4,a6,a7
   10d14:	00f707b3          	add	a5,a4,a5
   10d18:	03f8d713          	srli	a4,a7,0x3f
   10d1c:	0016d693          	srli	a3,a3,0x1
   10d20:	00e66733          	or	a4,a2,a4
   10d24:	00189893          	slli	a7,a7,0x1
   10d28:	fc069ae3          	bnez	a3,10cfc <__multi3+0x28>
   10d2c:	00058663          	beqz	a1,10d38 <__multi3+0x64>
   10d30:	f81ff0ef          	jal	ra,10cb0 <__muldi3>
   10d34:	00a787b3          	add	a5,a5,a0
   10d38:	00030a63          	beqz	t1,10d4c <__multi3+0x78>
   10d3c:	000e0513          	mv	a0,t3
   10d40:	00030593          	mv	a1,t1
   10d44:	f6dff0ef          	jal	ra,10cb0 <__muldi3>
   10d48:	00f507b3          	add	a5,a0,a5
   10d4c:	00813083          	ld	ra,8(sp)
   10d50:	00080513          	mv	a0,a6
   10d54:	00078593          	mv	a1,a5
   10d58:	01010113          	addi	sp,sp,16
   10d5c:	00008067          	ret

0000000000010d60 <__libc_init_array>:
   10d60:	fe010113          	addi	sp,sp,-32
   10d64:	00813823          	sd	s0,16(sp)
   10d68:	000127b7          	lui	a5,0x12
   10d6c:	00012437          	lui	s0,0x12
   10d70:	01213023          	sd	s2,0(sp)
   10d74:	1b078793          	addi	a5,a5,432 # 121b0 <__init_array_start>
   10d78:	1b040713          	addi	a4,s0,432 # 121b0 <__init_array_start>
   10d7c:	00113c23          	sd	ra,24(sp)
   10d80:	00913423          	sd	s1,8(sp)
   10d84:	40e78933          	sub	s2,a5,a4
   10d88:	02e78263          	beq	a5,a4,10dac <__libc_init_array+0x4c>
   10d8c:	40395913          	srai	s2,s2,0x3
   10d90:	1b040413          	addi	s0,s0,432
   10d94:	00000493          	li	s1,0
   10d98:	00043783          	ld	a5,0(s0)
   10d9c:	00148493          	addi	s1,s1,1
   10da0:	00840413          	addi	s0,s0,8
   10da4:	000780e7          	jalr	a5
   10da8:	ff24e8e3          	bltu	s1,s2,10d98 <__libc_init_array+0x38>
   10dac:	00012437          	lui	s0,0x12
   10db0:	000127b7          	lui	a5,0x12
   10db4:	1c078793          	addi	a5,a5,448 # 121c0 <__do_global_dtors_aux_fini_array_entry>
   10db8:	1b040713          	addi	a4,s0,432 # 121b0 <__init_array_start>
   10dbc:	40e78933          	sub	s2,a5,a4
   10dc0:	40395913          	srai	s2,s2,0x3
   10dc4:	02e78063          	beq	a5,a4,10de4 <__libc_init_array+0x84>
   10dc8:	1b040413          	addi	s0,s0,432
   10dcc:	00000493          	li	s1,0
   10dd0:	00043783          	ld	a5,0(s0)
   10dd4:	00148493          	addi	s1,s1,1
   10dd8:	00840413          	addi	s0,s0,8
   10ddc:	000780e7          	jalr	a5
   10de0:	ff24e8e3          	bltu	s1,s2,10dd0 <__libc_init_array+0x70>
   10de4:	01813083          	ld	ra,24(sp)
   10de8:	01013403          	ld	s0,16(sp)
   10dec:	00813483          	ld	s1,8(sp)
   10df0:	00013903          	ld	s2,0(sp)
   10df4:	02010113          	addi	sp,sp,32
   10df8:	00008067          	ret

0000000000010dfc <memset>:
   10dfc:	00f00313          	li	t1,15
   10e00:	00050713          	mv	a4,a0
   10e04:	02c37a63          	bgeu	t1,a2,10e38 <memset+0x3c>
   10e08:	00f77793          	andi	a5,a4,15
   10e0c:	0a079063          	bnez	a5,10eac <memset+0xb0>
   10e10:	06059e63          	bnez	a1,10e8c <memset+0x90>
   10e14:	ff067693          	andi	a3,a2,-16
   10e18:	00f67613          	andi	a2,a2,15
   10e1c:	00e686b3          	add	a3,a3,a4
   10e20:	00b73023          	sd	a1,0(a4)
   10e24:	00b73423          	sd	a1,8(a4)
   10e28:	01070713          	addi	a4,a4,16
   10e2c:	fed76ae3          	bltu	a4,a3,10e20 <memset+0x24>
   10e30:	00061463          	bnez	a2,10e38 <memset+0x3c>
   10e34:	00008067          	ret
   10e38:	40c306b3          	sub	a3,t1,a2
   10e3c:	00269693          	slli	a3,a3,0x2
   10e40:	00000297          	auipc	t0,0x0
   10e44:	005686b3          	add	a3,a3,t0
   10e48:	00c68067          	jr	12(a3)
   10e4c:	00b70723          	sb	a1,14(a4)
   10e50:	00b706a3          	sb	a1,13(a4)
   10e54:	00b70623          	sb	a1,12(a4)
   10e58:	00b705a3          	sb	a1,11(a4)
   10e5c:	00b70523          	sb	a1,10(a4)
   10e60:	00b704a3          	sb	a1,9(a4)
   10e64:	00b70423          	sb	a1,8(a4)
   10e68:	00b703a3          	sb	a1,7(a4)
   10e6c:	00b70323          	sb	a1,6(a4)
   10e70:	00b702a3          	sb	a1,5(a4)
   10e74:	00b70223          	sb	a1,4(a4)
   10e78:	00b701a3          	sb	a1,3(a4)
   10e7c:	00b70123          	sb	a1,2(a4)
   10e80:	00b700a3          	sb	a1,1(a4)
   10e84:	00b70023          	sb	a1,0(a4)
   10e88:	00008067          	ret
   10e8c:	0ff5f593          	zext.b	a1,a1
   10e90:	00859693          	slli	a3,a1,0x8
   10e94:	00d5e5b3          	or	a1,a1,a3
   10e98:	01059693          	slli	a3,a1,0x10
   10e9c:	00d5e5b3          	or	a1,a1,a3
   10ea0:	02059693          	slli	a3,a1,0x20
   10ea4:	00d5e5b3          	or	a1,a1,a3
   10ea8:	f6dff06f          	j	10e14 <memset+0x18>
   10eac:	00279693          	slli	a3,a5,0x2
   10eb0:	00000297          	auipc	t0,0x0
   10eb4:	005686b3          	add	a3,a3,t0
   10eb8:	00008293          	mv	t0,ra
   10ebc:	f98680e7          	jalr	-104(a3)
   10ec0:	00028093          	mv	ra,t0
   10ec4:	ff078793          	addi	a5,a5,-16
   10ec8:	40f70733          	sub	a4,a4,a5
   10ecc:	00f60633          	add	a2,a2,a5
   10ed0:	f6c374e3          	bgeu	t1,a2,10e38 <memset+0x3c>
   10ed4:	f3dff06f          	j	10e10 <memset+0x14>

0000000000010ed8 <__call_exitprocs>:
   10ed8:	fb010113          	addi	sp,sp,-80
   10edc:	03413023          	sd	s4,32(sp)
   10ee0:	f501ba03          	ld	s4,-176(gp) # 12918 <_global_impure_ptr>
   10ee4:	03213823          	sd	s2,48(sp)
   10ee8:	04113423          	sd	ra,72(sp)
   10eec:	1f8a3903          	ld	s2,504(s4)
   10ef0:	04813023          	sd	s0,64(sp)
   10ef4:	02913c23          	sd	s1,56(sp)
   10ef8:	03313423          	sd	s3,40(sp)
   10efc:	01513c23          	sd	s5,24(sp)
   10f00:	01613823          	sd	s6,16(sp)
   10f04:	01713423          	sd	s7,8(sp)
   10f08:	01813023          	sd	s8,0(sp)
   10f0c:	04090063          	beqz	s2,10f4c <__call_exitprocs+0x74>
   10f10:	00050b13          	mv	s6,a0
   10f14:	00058b93          	mv	s7,a1
   10f18:	00100a93          	li	s5,1
   10f1c:	fff00993          	li	s3,-1
   10f20:	00892483          	lw	s1,8(s2)
   10f24:	fff4841b          	addiw	s0,s1,-1
   10f28:	02044263          	bltz	s0,10f4c <__call_exitprocs+0x74>
   10f2c:	00349493          	slli	s1,s1,0x3
   10f30:	009904b3          	add	s1,s2,s1
   10f34:	040b8463          	beqz	s7,10f7c <__call_exitprocs+0xa4>
   10f38:	2084b783          	ld	a5,520(s1)
   10f3c:	05778063          	beq	a5,s7,10f7c <__call_exitprocs+0xa4>
   10f40:	fff4041b          	addiw	s0,s0,-1
   10f44:	ff848493          	addi	s1,s1,-8
   10f48:	ff3416e3          	bne	s0,s3,10f34 <__call_exitprocs+0x5c>
   10f4c:	04813083          	ld	ra,72(sp)
   10f50:	04013403          	ld	s0,64(sp)
   10f54:	03813483          	ld	s1,56(sp)
   10f58:	03013903          	ld	s2,48(sp)
   10f5c:	02813983          	ld	s3,40(sp)
   10f60:	02013a03          	ld	s4,32(sp)
   10f64:	01813a83          	ld	s5,24(sp)
   10f68:	01013b03          	ld	s6,16(sp)
   10f6c:	00813b83          	ld	s7,8(sp)
   10f70:	00013c03          	ld	s8,0(sp)
   10f74:	05010113          	addi	sp,sp,80
   10f78:	00008067          	ret
   10f7c:	00892783          	lw	a5,8(s2)
   10f80:	0084b703          	ld	a4,8(s1)
   10f84:	fff7879b          	addiw	a5,a5,-1
   10f88:	06878263          	beq	a5,s0,10fec <__call_exitprocs+0x114>
   10f8c:	0004b423          	sd	zero,8(s1)
   10f90:	fa0708e3          	beqz	a4,10f40 <__call_exitprocs+0x68>
   10f94:	31092783          	lw	a5,784(s2)
   10f98:	008a96bb          	sllw	a3,s5,s0
   10f9c:	00892c03          	lw	s8,8(s2)
   10fa0:	00d7f7b3          	and	a5,a5,a3
   10fa4:	0007879b          	sext.w	a5,a5
   10fa8:	02079263          	bnez	a5,10fcc <__call_exitprocs+0xf4>
   10fac:	000700e7          	jalr	a4
   10fb0:	00892703          	lw	a4,8(s2)
   10fb4:	1f8a3783          	ld	a5,504(s4)
   10fb8:	01871463          	bne	a4,s8,10fc0 <__call_exitprocs+0xe8>
   10fbc:	f92782e3          	beq	a5,s2,10f40 <__call_exitprocs+0x68>
   10fc0:	f80786e3          	beqz	a5,10f4c <__call_exitprocs+0x74>
   10fc4:	00078913          	mv	s2,a5
   10fc8:	f59ff06f          	j	10f20 <__call_exitprocs+0x48>
   10fcc:	31492783          	lw	a5,788(s2)
   10fd0:	1084b583          	ld	a1,264(s1)
   10fd4:	00d7f7b3          	and	a5,a5,a3
   10fd8:	0007879b          	sext.w	a5,a5
   10fdc:	00079c63          	bnez	a5,10ff4 <__call_exitprocs+0x11c>
   10fe0:	000b0513          	mv	a0,s6
   10fe4:	000700e7          	jalr	a4
   10fe8:	fc9ff06f          	j	10fb0 <__call_exitprocs+0xd8>
   10fec:	00892423          	sw	s0,8(s2)
   10ff0:	fa1ff06f          	j	10f90 <__call_exitprocs+0xb8>
   10ff4:	00058513          	mv	a0,a1
   10ff8:	000700e7          	jalr	a4
   10ffc:	fb5ff06f          	j	10fb0 <__call_exitprocs+0xd8>

0000000000011000 <__libc_fini_array>:
   11000:	fe010113          	addi	sp,sp,-32
   11004:	00813823          	sd	s0,16(sp)
   11008:	000127b7          	lui	a5,0x12
   1100c:	00012437          	lui	s0,0x12
   11010:	1c078793          	addi	a5,a5,448 # 121c0 <__do_global_dtors_aux_fini_array_entry>
   11014:	1c840413          	addi	s0,s0,456 # 121c8 <impure_data>
   11018:	40f40433          	sub	s0,s0,a5
   1101c:	00913423          	sd	s1,8(sp)
   11020:	00113c23          	sd	ra,24(sp)
   11024:	40345493          	srai	s1,s0,0x3
   11028:	02048063          	beqz	s1,11048 <__libc_fini_array+0x48>
   1102c:	ff840413          	addi	s0,s0,-8
   11030:	00f40433          	add	s0,s0,a5
   11034:	00043783          	ld	a5,0(s0)
   11038:	fff48493          	addi	s1,s1,-1
   1103c:	ff840413          	addi	s0,s0,-8
   11040:	000780e7          	jalr	a5
   11044:	fe0498e3          	bnez	s1,11034 <__libc_fini_array+0x34>
   11048:	01813083          	ld	ra,24(sp)
   1104c:	01013403          	ld	s0,16(sp)
   11050:	00813483          	ld	s1,8(sp)
   11054:	02010113          	addi	sp,sp,32
   11058:	00008067          	ret

000000000001105c <atexit>:
   1105c:	00050593          	mv	a1,a0
   11060:	00000693          	li	a3,0
   11064:	00000613          	li	a2,0
   11068:	00000513          	li	a0,0
   1106c:	0040006f          	j	11070 <__register_exitproc>

0000000000011070 <__register_exitproc>:
   11070:	f501b703          	ld	a4,-176(gp) # 12918 <_global_impure_ptr>
   11074:	1f873783          	ld	a5,504(a4)
   11078:	06078063          	beqz	a5,110d8 <__register_exitproc+0x68>
   1107c:	0087a703          	lw	a4,8(a5)
   11080:	01f00813          	li	a6,31
   11084:	08e84663          	blt	a6,a4,11110 <__register_exitproc+0xa0>
   11088:	02050863          	beqz	a0,110b8 <__register_exitproc+0x48>
   1108c:	00371813          	slli	a6,a4,0x3
   11090:	01078833          	add	a6,a5,a6
   11094:	10c83823          	sd	a2,272(a6)
   11098:	3107a883          	lw	a7,784(a5)
   1109c:	00100613          	li	a2,1
   110a0:	00e6163b          	sllw	a2,a2,a4
   110a4:	00c8e8b3          	or	a7,a7,a2
   110a8:	3117a823          	sw	a7,784(a5)
   110ac:	20d83823          	sd	a3,528(a6)
   110b0:	00200693          	li	a3,2
   110b4:	02d50863          	beq	a0,a3,110e4 <__register_exitproc+0x74>
   110b8:	00270693          	addi	a3,a4,2
   110bc:	00369693          	slli	a3,a3,0x3
   110c0:	0017071b          	addiw	a4,a4,1
   110c4:	00e7a423          	sw	a4,8(a5)
   110c8:	00d787b3          	add	a5,a5,a3
   110cc:	00b7b023          	sd	a1,0(a5)
   110d0:	00000513          	li	a0,0
   110d4:	00008067          	ret
   110d8:	20070793          	addi	a5,a4,512
   110dc:	1ef73c23          	sd	a5,504(a4)
   110e0:	f9dff06f          	j	1107c <__register_exitproc+0xc>
   110e4:	3147a683          	lw	a3,788(a5)
   110e8:	00000513          	li	a0,0
   110ec:	00c6e6b3          	or	a3,a3,a2
   110f0:	30d7aa23          	sw	a3,788(a5)
   110f4:	00270693          	addi	a3,a4,2
   110f8:	00369693          	slli	a3,a3,0x3
   110fc:	0017071b          	addiw	a4,a4,1
   11100:	00e7a423          	sw	a4,8(a5)
   11104:	00d787b3          	add	a5,a5,a3
   11108:	00b7b023          	sd	a1,0(a5)
   1110c:	00008067          	ret
   11110:	fff00513          	li	a0,-1
   11114:	00008067          	ret

0000000000011118 <_exit>:
   11118:	05d00893          	li	a7,93
   1111c:	00000073          	ecall
   11120:	00054463          	bltz	a0,11128 <_exit+0x10>
   11124:	0000006f          	j	11124 <_exit+0xc>
   11128:	ff010113          	addi	sp,sp,-16
   1112c:	00813023          	sd	s0,0(sp)
   11130:	00050413          	mv	s0,a0
   11134:	00113423          	sd	ra,8(sp)
   11138:	4080043b          	negw	s0,s0
   1113c:	00c000ef          	jal	ra,11148 <__errno>
   11140:	00852023          	sw	s0,0(a0)
   11144:	0000006f          	j	11144 <_exit+0x2c>

0000000000011148 <__errno>:
   11148:	f601b503          	ld	a0,-160(gp) # 12928 <_impure_ptr>
   1114c:	00008067          	ret

Disassembly of section .rodata:

0000000000011150 <.rodata>:
   11150:	6854                	.2byte	0x6854
   11152:	2065                	.2byte	0x2065
   11154:	746e6f63          	bltu	t3,t1,118b2 <__errno+0x76a>
   11158:	6e65                	.2byte	0x6e65
   1115a:	2074                	.2byte	0x2074
   1115c:	4120666f          	jal	a2,1756e <__global_pointer$+0x4ba6>
   11160:	6920                	.2byte	0x6920
   11162:	0a203a73          	csrrc	s4,0xa2,zero
   11166:	0000                	.2byte	0x0
   11168:	0020                	.2byte	0x20
   1116a:	0000                	.2byte	0x0
   1116c:	0000                	.2byte	0x0
   1116e:	0000                	.2byte	0x0
   11170:	000a                	.2byte	0xa
   11172:	0000                	.2byte	0x0
   11174:	0000                	.2byte	0x0
   11176:	0000                	.2byte	0x0
   11178:	6854                	.2byte	0x6854
   1117a:	2065                	.2byte	0x2065
   1117c:	746e6f63          	bltu	t3,t1,118da <__errno+0x792>
   11180:	6e65                	.2byte	0x6e65
   11182:	2074                	.2byte	0x2074
   11184:	4220666f          	jal	a2,175a6 <__global_pointer$+0x4bde>
   11188:	6920                	.2byte	0x6920
   1118a:	0a203a73          	csrrc	s4,0xa2,zero
   1118e:	0000                	.2byte	0x0
   11190:	6854                	.2byte	0x6854
   11192:	2065                	.2byte	0x2065
   11194:	746e6f63          	bltu	t3,t1,118f2 <__errno+0x7aa>
   11198:	6e65                	.2byte	0x6e65
   1119a:	2074                	.2byte	0x2074
   1119c:	4320666f          	jal	a2,175ce <__global_pointer$+0x4c06>
   111a0:	413d                	.2byte	0x413d
   111a2:	422a                	.2byte	0x422a
   111a4:	6920                	.2byte	0x6920
   111a6:	0a203a73          	csrrc	s4,0xa2,zero
	...

Disassembly of section .eh_frame:

00000000000121ac <__FRAME_END__>:
   121ac:	0000                	.2byte	0x0
	...

Disassembly of section .init_array:

00000000000121b0 <__init_array_start>:
   121b0:	0118                	.2byte	0x118
   121b2:	0001                	.2byte	0x1
   121b4:	0000                	.2byte	0x0
	...

00000000000121b8 <__frame_dummy_init_array_entry>:
   121b8:	01c0                	.2byte	0x1c0
   121ba:	0001                	.2byte	0x1
   121bc:	0000                	.2byte	0x0
	...

Disassembly of section .fini_array:

00000000000121c0 <__do_global_dtors_aux_fini_array_entry>:
   121c0:	017c                	.2byte	0x17c
   121c2:	0001                	.2byte	0x1
   121c4:	0000                	.2byte	0x0
	...

Disassembly of section .data:

00000000000121c8 <impure_data>:
	...
   121d0:	2700                	.2byte	0x2700
   121d2:	0001                	.2byte	0x1
   121d4:	0000                	.2byte	0x0
   121d6:	0000                	.2byte	0x0
   121d8:	27b0                	.2byte	0x27b0
   121da:	0001                	.2byte	0x1
   121dc:	0000                	.2byte	0x0
   121de:	0000                	.2byte	0x0
   121e0:	2860                	.2byte	0x2860
   121e2:	0001                	.2byte	0x1
	...
   122b0:	0001                	.2byte	0x1
   122b2:	0000                	.2byte	0x0
   122b4:	0000                	.2byte	0x0
   122b6:	0000                	.2byte	0x0
   122b8:	330e                	.2byte	0x330e
   122ba:	abcd                	.2byte	0xabcd
   122bc:	1234                	.2byte	0x1234
   122be:	e66d                	.2byte	0xe66d
   122c0:	deec                	.2byte	0xdeec
   122c2:	0005                	.2byte	0x5
   122c4:	0000000b          	.4byte	0xb
	...

Disassembly of section .sdata:

0000000000012910 <M>:
   12910:	000a                	.2byte	0xa
   12912:	0000                	.2byte	0x0
   12914:	0000                	.2byte	0x0
	...

0000000000012918 <_global_impure_ptr>:
   12918:	21c8                	.2byte	0x21c8
   1291a:	0001                	.2byte	0x1
   1291c:	0000                	.2byte	0x0
	...

0000000000012920 <__dso_handle>:
	...

0000000000012928 <_impure_ptr>:
   12928:	21c8                	.2byte	0x21c8
   1292a:	0001                	.2byte	0x1
   1292c:	0000                	.2byte	0x0
	...

Disassembly of section .bss:

0000000000012930 <completed.1>:
	...

0000000000012938 <object.0>:
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

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	002c                	.2byte	0x2c
   2:	0000                	.2byte	0x0
   4:	0002                	.2byte	0x2
   6:	0000                	.2byte	0x0
   8:	0000                	.2byte	0x0
   a:	0008                	.2byte	0x8
   c:	0000                	.2byte	0x0
   e:	0000                	.2byte	0x0
  10:	0cb0                	.2byte	0xcb0
  12:	0001                	.2byte	0x1
  14:	0000                	.2byte	0x0
  16:	0000                	.2byte	0x0
  18:	0024                	.2byte	0x24
	...
  2e:	0000                	.2byte	0x0
  30:	002c                	.2byte	0x2c
  32:	0000                	.2byte	0x0
  34:	0002                	.2byte	0x2
  36:	00000037          	lui	zero,0x0
  3a:	0008                	.2byte	0x8
  3c:	0000                	.2byte	0x0
  3e:	0000                	.2byte	0x0
  40:	0cd4                	.2byte	0xcd4
  42:	0001                	.2byte	0x1
  44:	0000                	.2byte	0x0
  46:	0000                	.2byte	0x0
  48:	008c                	.2byte	0x8c
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
   0:	00000033          	add	zero,zero,zero
   4:	0005                	.2byte	0x5
   6:	0801                	.2byte	0x801
   8:	0000                	.2byte	0x0
   a:	0000                	.2byte	0x0
   c:	0001                	.2byte	0x1
   e:	0000                	.2byte	0x0
  10:	b000                	.2byte	0xb000
  12:	010c                	.2byte	0x10c
  14:	0000                	.2byte	0x0
  16:	0000                	.2byte	0x0
  18:	2400                	.2byte	0x2400
  1a:	0000                	.2byte	0x0
  1c:	0000                	.2byte	0x0
  1e:	0042                	.2byte	0x42
  20:	0000                	.2byte	0x0
  22:	009c                	.2byte	0x9c
  24:	0000                	.2byte	0x0
  26:	8001                	.2byte	0x8001
  28:	a802                	.2byte	0xa802
  2a:	0000                	.2byte	0x0
  2c:	b000                	.2byte	0xb000
  2e:	010c                	.2byte	0x10c
  30:	0000                	.2byte	0x0
  32:	0000                	.2byte	0x0
  34:	2400                	.2byte	0x2400
  36:	5b00                	.2byte	0x5b00
  38:	0002                	.2byte	0x2
  3a:	0500                	.2byte	0x500
  3c:	0100                	.2byte	0x100
  3e:	2108                	.2byte	0x2108
  40:	0000                	.2byte	0x0
  42:	0800                	.2byte	0x800
  44:	000001c7          	.4byte	0x1c7
  48:	9c1d                	.2byte	0x9c1d
  4a:	0000                	.2byte	0x0
  4c:	0000                	.2byte	0x0
  4e:	0000                	.2byte	0x0
  50:	d400                	.2byte	0xd400
  52:	010c                	.2byte	0x10c
  54:	0000                	.2byte	0x0
  56:	0000                	.2byte	0x0
  58:	8c00                	.2byte	0x8c00
  5a:	0000                	.2byte	0x0
  5c:	0000                	.2byte	0x0
  5e:	0000                	.2byte	0x0
  60:	7e00                	.2byte	0x7e00
  62:	0000                	.2byte	0x0
  64:	0100                	.2byte	0x100
  66:	0710                	.2byte	0x710
  68:	00cc                	.2byte	0xcc
  6a:	0000                	.2byte	0x0
  6c:	0801                	.2byte	0x801
  6e:	9b05                	.2byte	0x9b05
  70:	0001                	.2byte	0x1
  72:	0100                	.2byte	0x100
  74:	0708                	.2byte	0x708
  76:	0134                	.2byte	0x134
  78:	0000                	.2byte	0x0
  7a:	0409                	.2byte	0x409
  7c:	6905                	.2byte	0x6905
  7e:	746e                	.2byte	0x746e
  80:	0100                	.2byte	0x100
  82:	0508                	.2byte	0x508
  84:	0196                	.2byte	0x196
  86:	0000                	.2byte	0x0
  88:	1001                	.2byte	0x1001
  8a:	6d04                	.2byte	0x6d04
  8c:	0001                	.2byte	0x1
  8e:	0100                	.2byte	0x100
  90:	0601                	.2byte	0x601
  92:	011a                	.2byte	0x11a
  94:	0000                	.2byte	0x0
  96:	0101                	.2byte	0x101
  98:	1808                	.2byte	0x1808
  9a:	0001                	.2byte	0x1
  9c:	0100                	.2byte	0x100
  9e:	0502                	.2byte	0x502
  a0:	01a4                	.2byte	0x1a4
  a2:	0000                	.2byte	0x0
  a4:	0201                	.2byte	0x201
  a6:	00014607          	.4byte	0x14607
  aa:	0100                	.2byte	0x100
  ac:	0704                	.2byte	0x704
  ae:	0139                	.2byte	0x139
  b0:	0000                	.2byte	0x0
  b2:	0101                	.2byte	0x101
  b4:	2108                	.2byte	0x2108
  b6:	0001                	.2byte	0x1
  b8:	0100                	.2byte	0x100
  ba:	0708                	.2byte	0x708
  bc:	0000012f          	.4byte	0x12f
  c0:	8104                	.2byte	0x8104
  c2:	0001                	.2byte	0x1
  c4:	8400                	.2byte	0x8400
  c6:	0000350f          	.4byte	0x350f
  ca:	0400                	.2byte	0x400
  cc:	0180                	.2byte	0x180
  ce:	0000                	.2byte	0x0
  d0:	1685                	.2byte	0x1685
  d2:	003c                	.2byte	0x3c
  d4:	0000                	.2byte	0x0
  d6:	b104                	.2byte	0xb104
  d8:	0000                	.2byte	0x0
  da:	8800                	.2byte	0x8800
  dc:	0000aa0f          	.4byte	0xaa0f
  e0:	0100                	.2byte	0x100
  e2:	0510                	.2byte	0x510
  e4:	0105                	.2byte	0x105
  e6:	0000                	.2byte	0x0
  e8:	0401                	.2byte	0x401
  ea:	9004                	.2byte	0x9004
  ec:	0001                	.2byte	0x1
  ee:	0100                	.2byte	0x100
  f0:	0308                	.2byte	0x308
  f2:	0188                	.2byte	0x188
  f4:	0000                	.2byte	0x0
  f6:	0801                	.2byte	0x801
  f8:	7204                	.2byte	0x7204
  fa:	0001                	.2byte	0x1
  fc:	0100                	.2byte	0x100
  fe:	0310                	.2byte	0x310
 100:	01ae                	.2byte	0x1ae
 102:	0000                	.2byte	0x0
 104:	2001                	.2byte	0x2001
 106:	00016503          	lwu	a0,0(sp)
 10a:	0a00                	.2byte	0xa00
 10c:	00b8                	.2byte	0xb8
 10e:	0000                	.2byte	0x0
 110:	0210                	.2byte	0x210
 112:	01ed                	.2byte	0x1ed
 114:	ff0a                	.2byte	0xff0a
 116:	0000                	.2byte	0x0
 118:	0b00                	.2byte	0xb00
 11a:	6f6c                	.2byte	0x6f6c
 11c:	ed020077          	.4byte	0xed020077
 120:	1a01                	.2byte	0x1a01
 122:	0089                	.2byte	0x89
 124:	0000                	.2byte	0x0
 126:	0c00                	.2byte	0xc00
 128:	0000017b          	.4byte	0x17b
 12c:	ed02                	.2byte	0xed02
 12e:	1f01                	.2byte	0x1f01
 130:	0089                	.2byte	0x89
 132:	0000                	.2byte	0x0
 134:	0008                	.2byte	0x8
 136:	100d                	.2byte	0x100d
 138:	f402                	.2byte	0xf402
 13a:	0901                	.2byte	0x901
 13c:	011f 0000 7306      	.byte	0x1f, 0x01, 0x00, 0x00, 0x06, 0x73
 142:	f600                	.2byte	0xf600
 144:	1301                	.2byte	0x1301
 146:	00d4                	.2byte	0xd4
 148:	0000                	.2byte	0x0
 14a:	6c06                	.2byte	0x6c06
 14c:	006c                	.2byte	0x6c
 14e:	9f0a01f7          	.4byte	0x9f0a01f7
 152:	0000                	.2byte	0x0
 154:	0000                	.2byte	0x0
 156:	de0e                	.2byte	0xde0e
 158:	0000                	.2byte	0x0
 15a:	0200                	.2byte	0x200
 15c:	01f8                	.2byte	0x1f8
 15e:	0000ff03          	.4byte	0xff03
 162:	0f00                	.2byte	0xf00
 164:	011f 0000 2610      	.byte	0x1f, 0x01, 0x00, 0x00, 0x10, 0x26
 16a:	0001                	.2byte	0x1
 16c:	0100                	.2byte	0x100
 16e:	0129                	.2byte	0x129
 170:	009f 0000 0cd4      	.byte	0x9f, 0x00, 0x00, 0x00, 0xd4, 0x0c
 176:	0001                	.2byte	0x1
 178:	0000                	.2byte	0x0
 17a:	0000                	.2byte	0x0
 17c:	008c                	.2byte	0x8c
 17e:	0000                	.2byte	0x0
 180:	0000                	.2byte	0x0
 182:	0000                	.2byte	0x0
 184:	9c01                	.2byte	0x9c01
 186:	12007507          	.4byte	0x12007507
 18a:	009f 0000 000c      	.byte	0x9f, 0x00, 0x00, 0x00, 0x0c, 0x00
 190:	0000                	.2byte	0x0
 192:	1c007607          	.4byte	0x1c007607
 196:	009f 0000 003d      	.byte	0x9f, 0x00, 0x00, 0x00, 0x3d, 0x00
 19c:	0000                	.2byte	0x0
 19e:	7505                	.2byte	0x7505
 1a0:	0075                	.2byte	0x75
 1a2:	012c112b          	.4byte	0x12c112b
 1a6:	0000                	.2byte	0x0
 1a8:	7605                	.2byte	0x7605
 1aa:	0076                	.2byte	0x76
 1ac:	112c                	.2byte	0x112c
 1ae:	012c                	.2byte	0x12c
 1b0:	0000                	.2byte	0x0
 1b2:	7705                	.2byte	0x7705
 1b4:	2d00                	.2byte	0x2d00
 1b6:	00011f0b          	.4byte	0x11f0b
 1ba:	0200                	.2byte	0x200
 1bc:	0159                	.2byte	0x159
 1be:	0000                	.2byte	0x0
 1c0:	942e                	.2byte	0x942e
 1c2:	0000                	.2byte	0x0
 1c4:	6e00                	.2byte	0x6e00
 1c6:	0000                	.2byte	0x0
 1c8:	0200                	.2byte	0x200
 1ca:	015f 0000 942f      	.byte	0x5f, 0x01, 0x00, 0x00, 0x2f, 0x94
 1d0:	0000                	.2byte	0x0
 1d2:	8200                	.2byte	0x8200
 1d4:	0000                	.2byte	0x0
 1d6:	0300                	.2byte	0x300
 1d8:	010e                	.2byte	0x10e
 1da:	0000                	.2byte	0x0
 1dc:	0a30                	.2byte	0xa30
 1de:	0094                	.2byte	0x94
 1e0:	0000                	.2byte	0x0
 1e2:	5e01                	.2byte	0x5e01
 1e4:	c102                	.2byte	0xc102
 1e6:	0001                	.2byte	0x1
 1e8:	3100                	.2byte	0x3100
 1ea:	0094                	.2byte	0x94
 1ec:	0000                	.2byte	0x0
 1ee:	00a9                	.2byte	0xa9
 1f0:	0000                	.2byte	0x0
 1f2:	bd02                	.2byte	0xbd02
 1f4:	0001                	.2byte	0x1
 1f6:	3200                	.2byte	0x3200
 1f8:	0094                	.2byte	0x94
 1fa:	0000                	.2byte	0x0
 1fc:	00d1                	.2byte	0xd1
 1fe:	0000                	.2byte	0x0
 200:	7902                	.2byte	0x7902
 202:	0001                	.2byte	0x1
 204:	3300                	.2byte	0x3300
 206:	0094                	.2byte	0x94
 208:	0000                	.2byte	0x0
 20a:	00fd                	.2byte	0xfd
 20c:	0000                	.2byte	0x0
 20e:	c102                	.2byte	0xc102
 210:	0000                	.2byte	0x0
 212:	3400                	.2byte	0x3400
 214:	0094                	.2byte	0x94
 216:	0000                	.2byte	0x0
 218:	0138                	.2byte	0x138
 21a:	0000                	.2byte	0x0
 21c:	f202                	.2byte	0xf202
 21e:	0000                	.2byte	0x0
 220:	3500                	.2byte	0x3500
 222:	0094                	.2byte	0x94
 224:	0000                	.2byte	0x0
 226:	019e                	.2byte	0x19e
 228:	0000                	.2byte	0x0
 22a:	ff02                	.2byte	0xff02
 22c:	0000                	.2byte	0x0
 22e:	3600                	.2byte	0x3600
 230:	0094                	.2byte	0x94
 232:	0000                	.2byte	0x0
 234:	01b2                	.2byte	0x1b2
 236:	0000                	.2byte	0x0
 238:	3011                	.2byte	0x3011
 23a:	010d                	.2byte	0x10d
 23c:	0000                	.2byte	0x0
 23e:	0000                	.2byte	0x0
 240:	0400                	.2byte	0x400
 242:	0000                	.2byte	0x0
 244:	0000                	.2byte	0x0
 246:	0000                	.2byte	0x0
 248:	3100                	.2byte	0x3100
 24a:	0002                	.2byte	0x2
 24c:	0300                	.2byte	0x300
 24e:	00e6                	.2byte	0xe6
 250:	0000                	.2byte	0x0
 252:	1b50                	.2byte	0x1b50
 254:	0094                	.2byte	0x94
 256:	0000                	.2byte	0x0
 258:	5a01                	.2byte	0x5a01
 25a:	0000ec03          	lwu	s8,0(ra) # 101a0 <__do_global_dtors_aux+0x24>
 25e:	5000                	.2byte	0x5000
 260:	0000941b          	slliw	s0,ra,0x0
 264:	0100                	.2byte	0x100
 266:	3c12005b          	.4byte	0x3c12005b
 26a:	010d                	.2byte	0x10d
 26c:	0000                	.2byte	0x0
 26e:	0000                	.2byte	0x0
 270:	0c00                	.2byte	0xc00
 272:	0000                	.2byte	0x0
 274:	0000                	.2byte	0x0
 276:	0000                	.2byte	0x0
 278:	0300                	.2byte	0x300
 27a:	00e6                	.2byte	0xe6
 27c:	0000                	.2byte	0x0
 27e:	00941153          	.4byte	0x941153
 282:	0000                	.2byte	0x0
 284:	5a01                	.2byte	0x5a01
 286:	0000ec03          	lwu	s8,0(ra)
 28a:	5300                	.2byte	0x5300
 28c:	9411                	.2byte	0x9411
 28e:	0000                	.2byte	0x0
 290:	0100                	.2byte	0x100
 292:	0000005b          	.4byte	0x5b

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	1101                	.2byte	0x1101
   2:	1001                	.2byte	0x1001
   4:	12011117          	auipc	sp,0x12011
   8:	1b0e030f          	.4byte	0x1b0e030f
   c:	250e                	.2byte	0x250e
   e:	130e                	.2byte	0x130e
  10:	0005                	.2byte	0x5
  12:	0200                	.2byte	0x200
  14:	002e                	.2byte	0x2e
  16:	193f0e03          	lb	t3,403(t5)
  1a:	0111                	.2byte	0x111
  1c:	0f12                	.2byte	0xf12
  1e:	0000                	.2byte	0x0
  20:	0100                	.2byte	0x100
  22:	0024                	.2byte	0x24
  24:	0b3e0b0b          	.4byte	0xb3e0b0b
  28:	00000e03          	lb	t3,0(zero) # 0 <exit-0x100e8>
  2c:	3402                	.2byte	0x3402
  2e:	0300                	.2byte	0x300
  30:	3a0e                	.2byte	0x3a0e
  32:	0121                	.2byte	0x121
  34:	21390b3b          	.4byte	0x21390b3b
  38:	490a                	.2byte	0x490a
  3a:	00170213          	addi	tp,a4,1
  3e:	0300                	.2byte	0x300
  40:	0034                	.2byte	0x34
  42:	213a0e03          	lb	t3,531(s4)
  46:	3b01                	.2byte	0x3b01
  48:	490b390b          	.4byte	0x490b390b
  4c:	00180213          	addi	tp,a6,1
  50:	0400                	.2byte	0x400
  52:	0016                	.2byte	0x16
  54:	213a0e03          	lb	t3,531(s4)
  58:	3b02                	.2byte	0x3b02
  5a:	490b390b          	.4byte	0x490b390b
  5e:	05000013          	li	zero,80
  62:	0034                	.2byte	0x34
  64:	213a0803          	lb	a6,531(s4)
  68:	3b01                	.2byte	0x3b01
  6a:	490b390b          	.4byte	0x490b390b
  6e:	06000013          	li	zero,96
  72:	000d                	.2byte	0xd
  74:	213a0803          	lb	a6,531(s4)
  78:	3b02                	.2byte	0x3b02
  7a:	3905                	.2byte	0x3905
  7c:	0013490b          	.4byte	0x13490b
  80:	0700                	.2byte	0x700
  82:	0005                	.2byte	0x5
  84:	213a0803          	lb	a6,531(s4)
  88:	3b01                	.2byte	0x3b01
  8a:	2921                	.2byte	0x2921
  8c:	0b39                	.2byte	0xb39
  8e:	1349                	.2byte	0x1349
  90:	1702                	.2byte	0x1702
  92:	0000                	.2byte	0x0
  94:	1108                	.2byte	0x1108
  96:	2501                	.2byte	0x2501
  98:	130e                	.2byte	0x130e
  9a:	1b1f030b          	.4byte	0x1b1f030b
  9e:	111f 1201 1007      	.byte	0x1f, 0x11, 0x01, 0x12, 0x07, 0x10
  a4:	09000017          	auipc	zero,0x9000
  a8:	0024                	.2byte	0x24
  aa:	0b3e0b0b          	.4byte	0xb3e0b0b
  ae:	00000803          	lb	a6,0(zero) # 0 <exit-0x100e8>
  b2:	130a                	.2byte	0x130a
  b4:	0301                	.2byte	0x301
  b6:	0b0e                	.2byte	0xb0e
  b8:	3b0b3a0b          	.4byte	0x3b0b3a0b
  bc:	3905                	.2byte	0x3905
  be:	0013010b          	.4byte	0x13010b
  c2:	0b00                	.2byte	0xb00
  c4:	000d                	.2byte	0xd
  c6:	0b3a0803          	lb	a6,179(s4)
  ca:	0b39053b          	.4byte	0xb39053b
  ce:	1349                	.2byte	0x1349
  d0:	0b38                	.2byte	0xb38
  d2:	0000                	.2byte	0x0
  d4:	0d0c                	.2byte	0xd0c
  d6:	0300                	.2byte	0x300
  d8:	3a0e                	.2byte	0x3a0e
  da:	39053b0b          	.4byte	0x39053b0b
  de:	3813490b          	.4byte	0x3813490b
  e2:	0d00000b          	.4byte	0xd00000b
  e6:	0b0b0117          	auipc	sp,0xb0b0
  ea:	0b3a                	.2byte	0xb3a
  ec:	0b39053b          	.4byte	0xb39053b
  f0:	1301                	.2byte	0x1301
  f2:	0000                	.2byte	0x0
  f4:	160e                	.2byte	0x160e
  f6:	0300                	.2byte	0x300
  f8:	3a0e                	.2byte	0x3a0e
  fa:	39053b0b          	.4byte	0x39053b0b
  fe:	0013490b          	.4byte	0x13490b
 102:	0f00                	.2byte	0xf00
 104:	0026                	.2byte	0x26
 106:	1349                	.2byte	0x1349
 108:	0000                	.2byte	0x0
 10a:	2e10                	.2byte	0x2e10
 10c:	3f01                	.2byte	0x3f01
 10e:	0319                	.2byte	0x319
 110:	3a0e                	.2byte	0x3a0e
 112:	390b3b0b          	.4byte	0x390b3b0b
 116:	4919270b          	.4byte	0x4919270b
 11a:	12011113          	.4byte	0x12011113
 11e:	7a184007          	.4byte	0x7a184007
 122:	0019                	.2byte	0x19
 124:	1100                	.2byte	0x1100
 126:	0111010b          	.4byte	0x111010b
 12a:	0712                	.2byte	0x712
 12c:	1301                	.2byte	0x1301
 12e:	0000                	.2byte	0x0
 130:	0b12                	.2byte	0xb12
 132:	1101                	.2byte	0x1101
 134:	1201                	.2byte	0x1201
 136:	00000007          	.4byte	0x7

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
   0:	007a                	.2byte	0x7a
   2:	0000                	.2byte	0x0
   4:	0005                	.2byte	0x5
   6:	0008                	.2byte	0x8
   8:	002e                	.2byte	0x2e
   a:	0000                	.2byte	0x0
   c:	0101                	.2byte	0x101
   e:	fb01                	.2byte	0xfb01
  10:	0d0e                	.2byte	0xd0e
  12:	0100                	.2byte	0x100
  14:	0101                	.2byte	0x101
  16:	0001                	.2byte	0x1
  18:	0000                	.2byte	0x0
  1a:	0001                	.2byte	0x1
  1c:	0100                	.2byte	0x100
  1e:	0101                	.2byte	0x101
  20:	021f 0000 0000      	.byte	0x1f, 0x02, 0x00, 0x00, 0x00, 0x00
  26:	005a                	.2byte	0x5a
  28:	0000                	.2byte	0x0
  2a:	0102                	.2byte	0x102
  2c:	021f 020f 0093      	.byte	0x1f, 0x02, 0x0f, 0x02, 0x93, 0x00
  32:	0000                	.2byte	0x0
  34:	9301                	.2byte	0x9301
  36:	0000                	.2byte	0x0
  38:	0100                	.2byte	0x100
  3a:	0900                	.2byte	0x900
  3c:	b002                	.2byte	0xb002
  3e:	010c                	.2byte	0x10c
  40:	0000                	.2byte	0x0
  42:	0000                	.2byte	0x0
  44:	0300                	.2byte	0x300
  46:	0124                	.2byte	0x124
  48:	04090103          	lb	sp,64(s2)
  4c:	0100                	.2byte	0x100
  4e:	04090203          	lb	tp,64(s2)
  52:	0100                	.2byte	0x100
  54:	04090103          	lb	sp,64(s2)
  58:	0100                	.2byte	0x100
  5a:	04090103          	lb	sp,64(s2)
  5e:	0100                	.2byte	0x100
  60:	04090203          	lb	tp,64(s2)
  64:	0100                	.2byte	0x100
  66:	04090103          	lb	sp,64(s2)
  6a:	0100                	.2byte	0x100
  6c:	04090103          	lb	sp,64(s2)
  70:	0100                	.2byte	0x100
  72:	04090103          	lb	sp,64(s2)
  76:	0100                	.2byte	0x100
  78:	0409                	.2byte	0x409
  7a:	0000                	.2byte	0x0
  7c:	0101                	.2byte	0x101
  7e:	0220                	.2byte	0x220
  80:	0000                	.2byte	0x0
  82:	0005                	.2byte	0x5
  84:	0008                	.2byte	0x8
  86:	00000037          	lui	zero,0x0
  8a:	0101                	.2byte	0x101
  8c:	fb01                	.2byte	0xfb01
  8e:	0d0e                	.2byte	0xd0e
  90:	0100                	.2byte	0x100
  92:	0101                	.2byte	0x101
  94:	0001                	.2byte	0x1
  96:	0000                	.2byte	0x0
  98:	0001                	.2byte	0x1
  9a:	0100                	.2byte	0x100
  9c:	0101                	.2byte	0x101
  9e:	031f 0000 0000      	.byte	0x1f, 0x03, 0x00, 0x00, 0x00, 0x00
  a4:	005a                	.2byte	0x5a
  a6:	0000                	.2byte	0x0
  a8:	00de                	.2byte	0xde
  aa:	0000                	.2byte	0x0
  ac:	0102                	.2byte	0x102
  ae:	021f 030f 00d5      	.byte	0x1f, 0x02, 0x0f, 0x03, 0xd5, 0x00
  b4:	0000                	.2byte	0x0
  b6:	d501                	.2byte	0xd501
  b8:	0000                	.2byte	0x0
  ba:	0100                	.2byte	0x100
  bc:	010a                	.2byte	0x10a
  be:	0000                	.2byte	0x0
  c0:	0502                	.2byte	0x502
  c2:	0001                	.2byte	0x1
  c4:	0209                	.2byte	0x209
  c6:	0cd4                	.2byte	0xcd4
  c8:	0001                	.2byte	0x1
  ca:	0000                	.2byte	0x0
  cc:	0000                	.2byte	0x0
  ce:	05012903          	lw	s2,80(sp) # b0b0136 <__global_pointer$+0xb09d76e>
  d2:	09010303          	lb	t1,144(sp)
  d6:	0000                	.2byte	0x0
  d8:	0301                	.2byte	0x301
  da:	0901                	.2byte	0x901
  dc:	0000                	.2byte	0x0
  de:	0301                	.2byte	0x301
  e0:	0901                	.2byte	0x901
  e2:	0000                	.2byte	0x0
  e4:	0301                	.2byte	0x301
  e6:	0901                	.2byte	0x901
  e8:	0000                	.2byte	0x0
  ea:	0501                	.2byte	0x501
  ec:	0601                	.2byte	0x601
  ee:	00097c03          	.4byte	0x97c03
  f2:	0100                	.2byte	0x100
  f4:	10090003          	lb	zero,256(s2)
  f8:	0100                	.2byte	0x100
  fa:	0a05                	.2byte	0xa05
  fc:	04090403          	lb	s0,64(s2)
 100:	0100                	.2byte	0x100
 102:	0305                	.2byte	0x305
 104:	0306                	.2byte	0x306
 106:	0901                	.2byte	0x901
 108:	0004                	.2byte	0x4
 10a:	0301                	.2byte	0x301
 10c:	0901                	.2byte	0x901
 10e:	0000                	.2byte	0x0
 110:	0301                	.2byte	0x301
 112:	0901                	.2byte	0x901
 114:	0000                	.2byte	0x0
 116:	0301                	.2byte	0x301
 118:	0901                	.2byte	0x901
 11a:	0000                	.2byte	0x0
 11c:	0301                	.2byte	0x301
 11e:	0901                	.2byte	0x901
 120:	0000                	.2byte	0x0
 122:	0301                	.2byte	0x301
 124:	0901                	.2byte	0x901
 126:	0000                	.2byte	0x0
 128:	0501                	.2byte	0x501
 12a:	060a                	.2byte	0x60a
 12c:	00097b03          	.4byte	0x97b03
 130:	0100                	.2byte	0x100
 132:	04090503          	lb	a0,64(s2)
 136:	0100                	.2byte	0x100
 138:	04097f03          	.4byte	0x4097f03
 13c:	0100                	.2byte	0x100
 13e:	04097e03          	.4byte	0x4097e03
 142:	0100                	.2byte	0x100
 144:	0305                	.2byte	0x305
 146:	0306                	.2byte	0x306
 148:	0904                	.2byte	0x904
 14a:	0004                	.2byte	0x4
 14c:	0301                	.2byte	0x301
 14e:	0901                	.2byte	0x901
 150:	0000                	.2byte	0x0
 152:	0301                	.2byte	0x301
 154:	0904                	.2byte	0x904
 156:	0000                	.2byte	0x0
 158:	0501                	.2byte	0x501
 15a:	09020307          	.4byte	0x9020307
 15e:	0000                	.2byte	0x0
 160:	0301                	.2byte	0x301
 162:	0901                	.2byte	0x901
 164:	0000                	.2byte	0x0
 166:	0501                	.2byte	0x501
 168:	0611                	.2byte	0x611
 16a:	00090203          	lb	tp,0(s2)
 16e:	0100                	.2byte	0x100
 170:	1405                	.2byte	0x1405
 172:	04097e03          	.4byte	0x4097e03
 176:	0100                	.2byte	0x100
 178:	0705                	.2byte	0x705
 17a:	0306                	.2byte	0x306
 17c:	0901                	.2byte	0x901
 17e:	0004                	.2byte	0x4
 180:	0301                	.2byte	0x301
 182:	0901                	.2byte	0x901
 184:	0000                	.2byte	0x0
 186:	0501                	.2byte	0x501
 188:	060a                	.2byte	0x60a
 18a:	00090003          	lb	zero,0(s2)
 18e:	0100                	.2byte	0x100
 190:	0405                	.2byte	0x405
 192:	0306                	.2byte	0x306
 194:	0902                	.2byte	0x902
 196:	0008                	.2byte	0x8
 198:	0301                	.2byte	0x301
 19a:	0901                	.2byte	0x901
 19c:	0000                	.2byte	0x0
 19e:	0301                	.2byte	0x301
 1a0:	0901                	.2byte	0x901
 1a2:	0000                	.2byte	0x0
 1a4:	0501                	.2byte	0x501
 1a6:	0612                	.2byte	0x612
 1a8:	00097b03          	.4byte	0x97b03
 1ac:	0100                	.2byte	0x100
 1ae:	1605                	.2byte	0x1605
 1b0:	04090303          	lb	t1,64(s2)
 1b4:	0100                	.2byte	0x100
 1b6:	0b05                	.2byte	0xb05
 1b8:	04090203          	lb	tp,64(s2)
 1bc:	0100                	.2byte	0x100
 1be:	0705                	.2byte	0x705
 1c0:	0306                	.2byte	0x306
 1c2:	0902                	.2byte	0x902
 1c4:	0004                	.2byte	0x4
 1c6:	0501                	.2byte	0x501
 1c8:	0611                	.2byte	0x611
 1ca:	00090003          	lb	zero,0(s2)
 1ce:	0100                	.2byte	0x100
 1d0:	0705                	.2byte	0x705
 1d2:	0306                	.2byte	0x306
 1d4:	0901                	.2byte	0x901
 1d6:	0004                	.2byte	0x4
 1d8:	0501                	.2byte	0x501
 1da:	060d                	.2byte	0x60d
 1dc:	00090003          	lb	zero,0(s2)
 1e0:	0100                	.2byte	0x100
 1e2:	0705                	.2byte	0x705
 1e4:	0306                	.2byte	0x306
 1e6:	0901                	.2byte	0x901
 1e8:	0004                	.2byte	0x4
 1ea:	0301                	.2byte	0x301
 1ec:	0901                	.2byte	0x901
 1ee:	0000                	.2byte	0x0
 1f0:	0501                	.2byte	0x501
 1f2:	0612                	.2byte	0x612
 1f4:	00090003          	lb	zero,0(s2)
 1f8:	0100                	.2byte	0x100
 1fa:	0a05                	.2byte	0xa05
 1fc:	0306                	.2byte	0x306
 1fe:	0902                	.2byte	0x902
 200:	0008                	.2byte	0x8
 202:	0501                	.2byte	0x501
 204:	09020303          	lb	t1,144(tp) # 90 <exit-0x10058>
 208:	0004                	.2byte	0x4
 20a:	0301                	.2byte	0x301
 20c:	0901                	.2byte	0x901
 20e:	0000                	.2byte	0x0
 210:	0301                	.2byte	0x301
 212:	0902                	.2byte	0x902
 214:	0000                	.2byte	0x0
 216:	0501                	.2byte	0x501
 218:	0606                	.2byte	0x606
 21a:	00090003          	lb	zero,0(s2)
 21e:	0100                	.2byte	0x100
 220:	0505                	.2byte	0x505
 222:	0306                	.2byte	0x306
 224:	0901                	.2byte	0x901
 226:	0004                	.2byte	0x4
 228:	0501                	.2byte	0x501
 22a:	0900031b          	addiw	t1,zero,144
 22e:	0000                	.2byte	0x0
 230:	0301                	.2byte	0x301
 232:	0900                	.2byte	0x900
 234:	0000                	.2byte	0x0
 236:	0301                	.2byte	0x301
 238:	0900                	.2byte	0x900
 23a:	0000                	.2byte	0x0
 23c:	0301                	.2byte	0x301
 23e:	0900                	.2byte	0x900
 240:	0004                	.2byte	0x4
 242:	0501                	.2byte	0x501
 244:	0619                	.2byte	0x619
 246:	00090003          	lb	zero,0(s2)
 24a:	0100                	.2byte	0x100
 24c:	0305                	.2byte	0x305
 24e:	0306                	.2byte	0x306
 250:	0902                	.2byte	0x902
 252:	0004                	.2byte	0x4
 254:	0501                	.2byte	0x501
 256:	0606                	.2byte	0x606
 258:	00090003          	lb	zero,0(s2)
 25c:	0100                	.2byte	0x100
 25e:	0505                	.2byte	0x505
 260:	0306                	.2byte	0x306
 262:	0901                	.2byte	0x901
 264:	0004                	.2byte	0x4
 266:	0501                	.2byte	0x501
 268:	0311                	.2byte	0x311
 26a:	0900                	.2byte	0x900
 26c:	0000                	.2byte	0x0
 26e:	0301                	.2byte	0x301
 270:	0900                	.2byte	0x900
 272:	0004                	.2byte	0x4
 274:	0301                	.2byte	0x301
 276:	0900                	.2byte	0x900
 278:	0004                	.2byte	0x4
 27a:	0301                	.2byte	0x301
 27c:	0900                	.2byte	0x900
 27e:	0004                	.2byte	0x4
 280:	0501                	.2byte	0x501
 282:	060e                	.2byte	0x60e
 284:	00090003          	lb	zero,0(s2)
 288:	0100                	.2byte	0x100
 28a:	0305                	.2byte	0x305
 28c:	0306                	.2byte	0x306
 28e:	0902                	.2byte	0x902
 290:	0004                	.2byte	0x4
 292:	0501                	.2byte	0x501
 294:	0601                	.2byte	0x601
 296:	00090103          	lb	sp,0(s2)
 29a:	0100                	.2byte	0x100
 29c:	1409                	.2byte	0x1409
 29e:	0000                	.2byte	0x0
 2a0:	0101                	.2byte	0x101

Disassembly of section .debug_frame:

0000000000000000 <.debug_frame>:
   0:	000c                	.2byte	0xc
   2:	0000                	.2byte	0x0
   4:	ffff                	.2byte	0xffff
   6:	ffff                	.2byte	0xffff
   8:	7c010003          	lb	zero,1984(sp)
   c:	0d01                	.2byte	0xd01
   e:	0002                	.2byte	0x2
  10:	0024                	.2byte	0x24
  12:	0000                	.2byte	0x0
  14:	0000                	.2byte	0x0
  16:	0000                	.2byte	0x0
  18:	0cd4                	.2byte	0xcd4
  1a:	0001                	.2byte	0x1
  1c:	0000                	.2byte	0x0
  1e:	0000                	.2byte	0x0
  20:	008c                	.2byte	0x8c
  22:	0000                	.2byte	0x0
  24:	0000                	.2byte	0x0
  26:	0000                	.2byte	0x0
  28:	0e48                	.2byte	0xe48
  2a:	4810                	.2byte	0x4810
  2c:	0281                	.2byte	0x281
  2e:	6c02                	.2byte	0x6c02
  30:	4cc1                	.2byte	0x4cc1
  32:	000e                	.2byte	0xe
  34:	0000                	.2byte	0x0
	...

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	6d6f682f          	.4byte	0x6d6f682f
   4:	2f65                	.2byte	0x2f65
   6:	6275                	.2byte	0x6275
   8:	6e75                	.2byte	0x6e75
   a:	7574                	.2byte	0x7574
   c:	7369722f          	.4byte	0x7369722f
  10:	672d7663          	bgeu	s10,s2,67c <exit-0xfa6c>
  14:	756e                	.2byte	0x756e
  16:	742d                	.2byte	0x742d
  18:	636c6f6f          	jal	t5,c664e <__global_pointer$+0xb3c86>
  1c:	6168                	.2byte	0x6168
  1e:	6e69                	.2byte	0x6e69
  20:	6363672f          	.4byte	0x6363672f
  24:	62696c2f          	.4byte	0x62696c2f
  28:	2f636367          	.4byte	0x2f636367
  2c:	666e6f63          	bltu	t3,t1,6aa <exit-0xfa3e>
  30:	6769                	.2byte	0x6769
  32:	7369722f          	.4byte	0x7369722f
  36:	6d2f7663          	bgeu	t5,s2,702 <exit-0xf9e6>
  3a:	6c75                	.2byte	0x6c75
  3c:	6964                	.2byte	0x6964
  3e:	00532e33          	slt	t3,t1,t0
  42:	6d6f682f          	.4byte	0x6d6f682f
  46:	2f65                	.2byte	0x2f65
  48:	6275                	.2byte	0x6275
  4a:	6e75                	.2byte	0x6e75
  4c:	7574                	.2byte	0x7574
  4e:	7369722f          	.4byte	0x7369722f
  52:	672d7663          	bgeu	s10,s2,6be <exit-0xfa2a>
  56:	756e                	.2byte	0x756e
  58:	742d                	.2byte	0x742d
  5a:	636c6f6f          	jal	t5,c6690 <__global_pointer$+0xb3cc8>
  5e:	6168                	.2byte	0x6168
  60:	6e69                	.2byte	0x6e69
  62:	6975622f          	.4byte	0x6975622f
  66:	646c                	.2byte	0x646c
  68:	6975622f          	.4byte	0x6975622f
  6c:	646c                	.2byte	0x646c
  6e:	672d                	.2byte	0x672d
  70:	6e2d6363          	bltu	s10,sp,756 <exit-0xf992>
  74:	7765                	.2byte	0x7765
  76:	696c                	.2byte	0x696c
  78:	2d62                	.2byte	0x2d62
  7a:	67617473          	csrrci	s0,0x676,2
  7e:	3265                	.2byte	0x3265
  80:	7369722f          	.4byte	0x7369722f
  84:	34367663          	bgeu	a2,gp,3d0 <exit-0xfd18>
  88:	752d                	.2byte	0x752d
  8a:	6b6e                	.2byte	0x6b6e
  8c:	6f6e                	.2byte	0x6f6e
  8e:	652d6e77          	.4byte	0x652d6e77
  92:	666c                	.2byte	0x666c
  94:	62696c2f          	.4byte	0x62696c2f
  98:	00636367          	.4byte	0x636367
  9c:	20554e47          	.4byte	0x20554e47
  a0:	5341                	.2byte	0x5341
  a2:	3220                	.2byte	0x3220
  a4:	332e                	.2byte	0x332e
  a6:	0039                	.2byte	0x39
  a8:	5f5f 756d 646c      	.byte	0x5f, 0x5f, 0x6d, 0x75, 0x6c, 0x64
  ae:	3369                	.2byte	0x3369
  b0:	5400                	.2byte	0x5400
  b2:	7449                	.2byte	0x7449
  b4:	7079                	.2byte	0x7079
  b6:	0065                	.2byte	0x65
  b8:	5744                	.2byte	0x5744
  ba:	75727473          	csrrci	s0,mseccfgh,4
  be:	77007463          	bgeu	zero,a6,826 <exit-0xf8c2>
  c2:	685f 6769 5f68      	.byte	0x5f, 0x68, 0x69, 0x67, 0x68, 0x5f
  c8:	6d74                	.2byte	0x6d74
  ca:	0070                	.2byte	0x70
  cc:	5f5f 6e69 3174      	.byte	0x5f, 0x5f, 0x69, 0x6e, 0x74, 0x31
  d2:	3832                	.2byte	0x3832
  d4:	7520                	.2byte	0x7520
  d6:	736e                	.2byte	0x736e
  d8:	6769                	.2byte	0x6769
  da:	656e                	.2byte	0x656e
  dc:	0064                	.2byte	0x64
  de:	5744                	.2byte	0x5744
  e0:	6e75                	.2byte	0x6e75
  e2:	6f69                	.2byte	0x6f69
  e4:	006e                	.2byte	0x6e
  e6:	5f5f 706f 0030      	.byte	0x5f, 0x5f, 0x6f, 0x70, 0x30, 0x00
  ec:	5f5f 706f 0031      	.byte	0x5f, 0x5f, 0x6f, 0x70, 0x31, 0x00
  f2:	69685f77          	.4byte	0x69685f77
  f6:	745f6867          	.4byte	0x745f6867
  fa:	706d                	.2byte	0x706d
  fc:	7832                	.2byte	0x7832
  fe:	6300                	.2byte	0x6300
 100:	7261                	.2byte	0x7261
 102:	7972                	.2byte	0x7972
 104:	5f00                	.2byte	0x5f00
 106:	695f 746e 3231      	.byte	0x5f, 0x69, 0x6e, 0x74, 0x31, 0x32
 10c:	0038                	.2byte	0x38
 10e:	5f75                	.2byte	0x5f75
 110:	6f6c                	.2byte	0x6f6c
 112:	736d5f77          	.4byte	0x736d5f77
 116:	0062                	.2byte	0x62
 118:	6e75                	.2byte	0x6e75
 11a:	6e676973          	csrrsi	s2,0x6e6,14
 11e:	6465                	.2byte	0x6465
 120:	6320                	.2byte	0x6320
 122:	6168                	.2byte	0x6168
 124:	0072                	.2byte	0x72
 126:	5f5f 756d 746c      	.byte	0x5f, 0x5f, 0x6d, 0x75, 0x6c, 0x74
 12c:	3369                	.2byte	0x3369
 12e:	6c00                	.2byte	0x6c00
 130:	20676e6f          	jal	t3,76336 <__global_pointer$+0x6396e>
 134:	6f6c                	.2byte	0x6f6c
 136:	676e                	.2byte	0x676e
 138:	7520                	.2byte	0x7520
 13a:	736e                	.2byte	0x736e
 13c:	6769                	.2byte	0x6769
 13e:	656e                	.2byte	0x656e
 140:	2064                	.2byte	0x2064
 142:	6e69                	.2byte	0x6e69
 144:	0074                	.2byte	0x74
 146:	726f6873          	csrrsi	a6,mhpmevent6h,30
 14a:	2074                	.2byte	0x2074
 14c:	6e75                	.2byte	0x6e75
 14e:	6e676973          	csrrsi	s2,0x6e6,14
 152:	6465                	.2byte	0x6465
 154:	6920                	.2byte	0x6920
 156:	746e                	.2byte	0x746e
 158:	7500                	.2byte	0x7500
 15a:	6c5f 776f 7600      	.byte	0x5f, 0x6c, 0x6f, 0x77, 0x00, 0x76
 160:	6c5f 776f 6300      	.byte	0x5f, 0x6c, 0x6f, 0x77, 0x00, 0x63
 166:	6c706d6f          	jal	s10,702c <exit-0x90bc>
 16a:	7865                	.2byte	0x7865
 16c:	6c20                	.2byte	0x6c20
 16e:	20676e6f          	jal	t3,76374 <__global_pointer$+0x639ac>
 172:	6f64                	.2byte	0x6f64
 174:	6275                	.2byte	0x6275
 176:	656c                	.2byte	0x656c
 178:	7700                	.2byte	0x7700
 17a:	685f 6769 0068      	.byte	0x5f, 0x68, 0x69, 0x67, 0x68, 0x00
 180:	4455                	.2byte	0x4455
 182:	7449                	.2byte	0x7449
 184:	7079                	.2byte	0x7079
 186:	0065                	.2byte	0x65
 188:	706d6f63          	bltu	s10,t1,8a6 <exit-0xf842>
 18c:	656c                	.2byte	0x656c
 18e:	2078                	.2byte	0x2078
 190:	6c66                	.2byte	0x6c66
 192:	0074616f          	jal	sp,46998 <__global_pointer$+0x33fd0>
 196:	6f6c                	.2byte	0x6f6c
 198:	676e                	.2byte	0x676e
 19a:	6c20                	.2byte	0x6c20
 19c:	20676e6f          	jal	t3,763a2 <__global_pointer$+0x639da>
 1a0:	6e69                	.2byte	0x6e69
 1a2:	0074                	.2byte	0x74
 1a4:	726f6873          	csrrsi	a6,mhpmevent6h,30
 1a8:	2074                	.2byte	0x2074
 1aa:	6e69                	.2byte	0x6e69
 1ac:	0074                	.2byte	0x74
 1ae:	706d6f63          	bltu	s10,t1,8cc <exit-0xf81c>
 1b2:	656c                	.2byte	0x656c
 1b4:	2078                	.2byte	0x2078
 1b6:	6f64                	.2byte	0x6f64
 1b8:	6275                	.2byte	0x6275
 1ba:	656c                	.2byte	0x656c
 1bc:	6e00                	.2byte	0x6e00
 1be:	7765                	.2byte	0x7765
 1c0:	775f 6c5f 776f      	.byte	0x5f, 0x77, 0x5f, 0x6c, 0x6f, 0x77
 1c6:	4700                	.2byte	0x4700
 1c8:	554e                	.2byte	0x554e
 1ca:	4320                	.2byte	0x4320
 1cc:	3731                	.2byte	0x3731
 1ce:	3120                	.2byte	0x3120
 1d0:	2e32                	.2byte	0x2e32
 1d2:	2e31                	.2byte	0x2e31
 1d4:	2030                	.2byte	0x2030
 1d6:	6d2d                	.2byte	0x6d2d
 1d8:	646f6d63          	bltu	t5,t1,832 <exit-0xf8b6>
 1dc:	6c65                	.2byte	0x6c65
 1de:	6d3d                	.2byte	0x6d3d
 1e0:	6465                	.2byte	0x6465
 1e2:	6f6c                	.2byte	0x6f6c
 1e4:	6d2d2077          	.4byte	0x6d2d2077
 1e8:	646f6d63          	bltu	t5,t1,842 <exit-0xf8a6>
 1ec:	6c65                	.2byte	0x6c65
 1ee:	6d3d                	.2byte	0x6d3d
 1f0:	6465                	.2byte	0x6465
 1f2:	6f6c                	.2byte	0x6f6c
 1f4:	6d2d2077          	.4byte	0x6d2d2077
 1f8:	7574                	.2byte	0x7574
 1fa:	656e                	.2byte	0x656e
 1fc:	723d                	.2byte	0x723d
 1fe:	656b636f          	jal	t1,b6854 <__global_pointer$+0xa3e8c>
 202:	2074                	.2byte	0x2074
 204:	6d2d                	.2byte	0x6d2d
 206:	6261                	.2byte	0x6261
 208:	3d69                	.2byte	0x3d69
 20a:	706c                	.2byte	0x706c
 20c:	3436                	.2byte	0x3436
 20e:	2d20                	.2byte	0x2d20
 210:	696d                	.2byte	0x696d
 212:	732d6173          	csrrsi	sp,mhpmevent18h,26
 216:	6570                	.2byte	0x6570
 218:	2e323d63          	.4byte	0x2e323d63
 21c:	2032                	.2byte	0x2032
 21e:	6d2d                	.2byte	0x6d2d
 220:	7261                	.2byte	0x7261
 222:	723d6863          	bltu	s10,gp,952 <exit-0xf796>
 226:	3676                	.2byte	0x3676
 228:	6934                	.2byte	0x6934
 22a:	2061                	.2byte	0x2061
 22c:	672d                	.2byte	0x672d
 22e:	2d20                	.2byte	0x2d20
 230:	2d20734f          	.4byte	0x2d20734f
 234:	2d20324f          	.4byte	0x2d20324f
 238:	2d20734f          	.4byte	0x2d20734f
 23c:	6266                	.2byte	0x6266
 23e:	6975                	.2byte	0x6975
 240:	646c                	.2byte	0x646c
 242:	6e69                	.2byte	0x6e69
 244:	696c2d67          	.4byte	0x696c2d67
 248:	6762                	.2byte	0x6762
 24a:	2d206363          	bltu	zero,s2,510 <exit-0xfbd8>
 24e:	6e66                	.2byte	0x6e66
 250:	74732d6f          	jal	s10,33196 <__global_pointer$+0x207ce>
 254:	6361                	.2byte	0x6361
 256:	72702d6b          	.4byte	0x72702d6b
 25a:	6365746f          	jal	s0,57890 <__global_pointer$+0x44ec8>
 25e:	6f74                	.2byte	0x6f74
 260:	2072                	.2byte	0x2072
 262:	662d                	.2byte	0x662d
 264:	6976                	.2byte	0x6976
 266:	69626973          	csrrsi	s2,0x696,4
 26a:	696c                	.2byte	0x696c
 26c:	7974                	.2byte	0x7974
 26e:	683d                	.2byte	0x683d
 270:	6469                	.2byte	0x6469
 272:	6564                	.2byte	0x6564
 274:	006e                	.2byte	0x6e

Disassembly of section .debug_line_str:

0000000000000000 <.debug_line_str>:
   0:	6d6f682f          	.4byte	0x6d6f682f
   4:	2f65                	.2byte	0x2f65
   6:	6275                	.2byte	0x6275
   8:	6e75                	.2byte	0x6e75
   a:	7574                	.2byte	0x7574
   c:	7369722f          	.4byte	0x7369722f
  10:	672d7663          	bgeu	s10,s2,67c <exit-0xfa6c>
  14:	756e                	.2byte	0x756e
  16:	742d                	.2byte	0x742d
  18:	636c6f6f          	jal	t5,c664e <__global_pointer$+0xb3c86>
  1c:	6168                	.2byte	0x6168
  1e:	6e69                	.2byte	0x6e69
  20:	6975622f          	.4byte	0x6975622f
  24:	646c                	.2byte	0x646c
  26:	6975622f          	.4byte	0x6975622f
  2a:	646c                	.2byte	0x646c
  2c:	672d                	.2byte	0x672d
  2e:	6e2d6363          	bltu	s10,sp,714 <exit-0xf9d4>
  32:	7765                	.2byte	0x7765
  34:	696c                	.2byte	0x696c
  36:	2d62                	.2byte	0x2d62
  38:	67617473          	csrrci	s0,0x676,2
  3c:	3265                	.2byte	0x3265
  3e:	7369722f          	.4byte	0x7369722f
  42:	34367663          	bgeu	a2,gp,38e <exit-0xfd5a>
  46:	752d                	.2byte	0x752d
  48:	6b6e                	.2byte	0x6b6e
  4a:	6f6e                	.2byte	0x6f6e
  4c:	652d6e77          	.4byte	0x652d6e77
  50:	666c                	.2byte	0x666c
  52:	62696c2f          	.4byte	0x62696c2f
  56:	00636367          	.4byte	0x636367
  5a:	6d6f682f          	.4byte	0x6d6f682f
  5e:	2f65                	.2byte	0x2f65
  60:	6275                	.2byte	0x6275
  62:	6e75                	.2byte	0x6e75
  64:	7574                	.2byte	0x7574
  66:	7369722f          	.4byte	0x7369722f
  6a:	672d7663          	bgeu	s10,s2,6d6 <exit-0xfa12>
  6e:	756e                	.2byte	0x756e
  70:	742d                	.2byte	0x742d
  72:	636c6f6f          	jal	t5,c66a8 <__global_pointer$+0xb3ce0>
  76:	6168                	.2byte	0x6168
  78:	6e69                	.2byte	0x6e69
  7a:	6363672f          	.4byte	0x6363672f
  7e:	62696c2f          	.4byte	0x62696c2f
  82:	2f636367          	.4byte	0x2f636367
  86:	666e6f63          	bltu	t3,t1,704 <exit-0xf9e4>
  8a:	6769                	.2byte	0x6769
  8c:	7369722f          	.4byte	0x7369722f
  90:	6d007663          	bgeu	zero,a6,75c <exit-0xf98c>
  94:	6c75                	.2byte	0x6c75
  96:	6964                	.2byte	0x6964
  98:	00532e33          	slt	t3,t1,t0
  9c:	6d6f682f          	.4byte	0x6d6f682f
  a0:	2f65                	.2byte	0x2f65
  a2:	6275                	.2byte	0x6275
  a4:	6e75                	.2byte	0x6e75
  a6:	7574                	.2byte	0x7574
  a8:	7369722f          	.4byte	0x7369722f
  ac:	672d7663          	bgeu	s10,s2,718 <exit-0xf9d0>
  b0:	756e                	.2byte	0x756e
  b2:	742d                	.2byte	0x742d
  b4:	636c6f6f          	jal	t5,c66ea <__global_pointer$+0xb3d22>
  b8:	6168                	.2byte	0x6168
  ba:	6e69                	.2byte	0x6e69
  bc:	6363672f          	.4byte	0x6363672f
  c0:	62696c2f          	.4byte	0x62696c2f
  c4:	2f636367          	.4byte	0x2f636367
  c8:	666e6f63          	bltu	t3,t1,746 <exit-0xf9a2>
  cc:	6769                	.2byte	0x6769
  ce:	7369722f          	.4byte	0x7369722f
  d2:	6d2f7663          	bgeu	t5,s2,79e <exit-0xf94a>
  d6:	6c75                	.2byte	0x6c75
  d8:	6974                	.2byte	0x6974
  da:	00632e33          	slt	t3,t1,t1
  de:	6d6f682f          	.4byte	0x6d6f682f
  e2:	2f65                	.2byte	0x2f65
  e4:	6275                	.2byte	0x6275
  e6:	6e75                	.2byte	0x6e75
  e8:	7574                	.2byte	0x7574
  ea:	7369722f          	.4byte	0x7369722f
  ee:	672d7663          	bgeu	s10,s2,75a <exit-0xf98e>
  f2:	756e                	.2byte	0x756e
  f4:	742d                	.2byte	0x742d
  f6:	636c6f6f          	jal	t5,c672c <__global_pointer$+0xb3d64>
  fa:	6168                	.2byte	0x6168
  fc:	6e69                	.2byte	0x6e69
  fe:	6363672f          	.4byte	0x6363672f
 102:	62696c2f          	.4byte	0x62696c2f
 106:	00636367          	.4byte	0x636367
 10a:	696c                	.2byte	0x696c
 10c:	6762                	.2byte	0x6762
 10e:	2e326363          	bltu	tp,gp,3f4 <exit-0xfcf4>
 112:	0068                	.2byte	0x68

Disassembly of section .debug_loclists:

0000000000000000 <.debug_loclists>:
   0:	01fa                	.2byte	0x1fa
   2:	0000                	.2byte	0x0
   4:	0005                	.2byte	0x5
   6:	0008                	.2byte	0x8
   8:	0000                	.2byte	0x0
   a:	0000                	.2byte	0x0
   c:	010cd407          	.4byte	0x10cd407
  10:	0000                	.2byte	0x0
  12:	0000                	.2byte	0x0
  14:	e800                	.2byte	0xe800
  16:	010c                	.2byte	0x10c
  18:	0000                	.2byte	0x0
  1a:	0000                	.2byte	0x0
  1c:	0600                	.2byte	0x600
  1e:	935a                	.2byte	0x935a
  20:	5b08                	.2byte	0x5b08
  22:	e8070893          	addi	a7,a4,-384
  26:	010c                	.2byte	0x10c
  28:	0000                	.2byte	0x0
  2a:	0000                	.2byte	0x0
  2c:	6000                	.2byte	0x6000
  2e:	010d                	.2byte	0x10d
  30:	0000                	.2byte	0x0
  32:	0000                	.2byte	0x0
  34:	0600                	.2byte	0x600
  36:	0aa503a3          	sb	a0,167(a0)
  3a:	9f2e                	.2byte	0x9f2e
  3c:	0700                	.2byte	0x700
  3e:	0cd4                	.2byte	0xcd4
  40:	0001                	.2byte	0x1
  42:	0000                	.2byte	0x0
  44:	0000                	.2byte	0x0
  46:	0cfc                	.2byte	0xcfc
  48:	0001                	.2byte	0x1
  4a:	0000                	.2byte	0x0
  4c:	0000                	.2byte	0x0
  4e:	5c06                	.2byte	0x5c06
  50:	935d0893          	addi	a7,s10,-1739
  54:	0708                	.2byte	0x708
  56:	0cfc                	.2byte	0xcfc
  58:	0001                	.2byte	0x1
  5a:	0000                	.2byte	0x0
  5c:	0000                	.2byte	0x0
  5e:	0d60                	.2byte	0xd60
  60:	0001                	.2byte	0x1
  62:	0000                	.2byte	0x0
  64:	0000                	.2byte	0x0
  66:	a306                	.2byte	0xa306
  68:	2e0ca503          	lw	a0,736(s9)
  6c:	009f ec07 010c      	.byte	0x9f, 0x00, 0x07, 0xec, 0x0c, 0x01
  72:	0000                	.2byte	0x0
  74:	0000                	.2byte	0x0
  76:	2800                	.2byte	0x2800
  78:	010d                	.2byte	0x10d
  7a:	0000                	.2byte	0x0
  7c:	0000                	.2byte	0x0
  7e:	0100                	.2byte	0x100
  80:	0061                	.2byte	0x61
  82:	010cec07          	.4byte	0x10cec07
  86:	0000                	.2byte	0x0
  88:	0000                	.2byte	0x0
  8a:	fc00                	.2byte	0xfc00
  8c:	010c                	.2byte	0x10c
  8e:	0000                	.2byte	0x0
  90:	0000                	.2byte	0x0
  92:	0100                	.2byte	0x100
  94:	075a                	.2byte	0x75a
  96:	0cfc                	.2byte	0xcfc
  98:	0001                	.2byte	0x1
  9a:	0000                	.2byte	0x0
  9c:	0000                	.2byte	0x0
  9e:	0d34                	.2byte	0xd34
  a0:	0001                	.2byte	0x1
  a2:	0000                	.2byte	0x0
  a4:	0000                	.2byte	0x0
  a6:	5d01                	.2byte	0x5d01
  a8:	0700                	.2byte	0x700
  aa:	0cec                	.2byte	0xcec
  ac:	0001                	.2byte	0x1
  ae:	0000                	.2byte	0x0
  b0:	0000                	.2byte	0x0
  b2:	0cfc                	.2byte	0xcfc
  b4:	0001                	.2byte	0x1
  b6:	0000                	.2byte	0x0
  b8:	0000                	.2byte	0x0
  ba:	3002                	.2byte	0x3002
  bc:	079f 0cfc 0001      	.byte	0x9f, 0x07, 0xfc, 0x0c, 0x01, 0x00
  c2:	0000                	.2byte	0x0
  c4:	0000                	.2byte	0x0
  c6:	0d60                	.2byte	0xd60
  c8:	0001                	.2byte	0x1
  ca:	0000                	.2byte	0x0
  cc:	0000                	.2byte	0x0
  ce:	6001                	.2byte	0x6001
  d0:	0700                	.2byte	0x700
  d2:	0cfc                	.2byte	0xcfc
  d4:	0001                	.2byte	0x1
  d6:	0000                	.2byte	0x0
  d8:	0000                	.2byte	0x0
  da:	0d0c                	.2byte	0xd0c
  dc:	0001                	.2byte	0x1
  de:	0000                	.2byte	0x0
  e0:	0000                	.2byte	0x0
  e2:	8106                	.2byte	0x8106
  e4:	8000                	.2byte	0x8000
  e6:	2200                	.2byte	0x2200
  e8:	079f 0d0c 0001      	.byte	0x9f, 0x07, 0x0c, 0x0d, 0x01, 0x00
  ee:	0000                	.2byte	0x0
  f0:	0000                	.2byte	0x0
  f2:	0d18                	.2byte	0xd18
  f4:	0001                	.2byte	0x1
  f6:	0000                	.2byte	0x0
  f8:	0000                	.2byte	0x0
  fa:	6001                	.2byte	0x6001
  fc:	0700                	.2byte	0x700
  fe:	0cec                	.2byte	0xcec
 100:	0001                	.2byte	0x1
 102:	0000                	.2byte	0x0
 104:	0000                	.2byte	0x0
 106:	0cfc                	.2byte	0xcfc
 108:	0001                	.2byte	0x1
 10a:	0000                	.2byte	0x0
 10c:	0000                	.2byte	0x0
 10e:	3002                	.2byte	0x3002
 110:	079f 0cfc 0001      	.byte	0x9f, 0x07, 0xfc, 0x0c, 0x01, 0x00
 116:	0000                	.2byte	0x0
 118:	0000                	.2byte	0x0
 11a:	0d10                	.2byte	0xd10
 11c:	0001                	.2byte	0x1
 11e:	0000                	.2byte	0x0
 120:	0000                	.2byte	0x0
 122:	5f01                	.2byte	0x5f01
 124:	010d1807          	.4byte	0x10d1807
 128:	0000                	.2byte	0x0
 12a:	0000                	.2byte	0x0
 12c:	3800                	.2byte	0x3800
 12e:	010d                	.2byte	0x10d
 130:	0000                	.2byte	0x0
 132:	0000                	.2byte	0x0
 134:	0100                	.2byte	0x100
 136:	005f ec07 010c      	.byte	0x5f, 0x00, 0x07, 0xec, 0x0c, 0x01
 13c:	0000                	.2byte	0x0
 13e:	0000                	.2byte	0x0
 140:	fc00                	.2byte	0xfc00
 142:	010c                	.2byte	0x10c
 144:	0000                	.2byte	0x0
 146:	0000                	.2byte	0x0
 148:	0200                	.2byte	0x200
 14a:	9f30                	.2byte	0x9f30
 14c:	010cfc07          	.4byte	0x10cfc07
 150:	0000                	.2byte	0x0
 152:	0000                	.2byte	0x0
 154:	0400                	.2byte	0x400
 156:	010d                	.2byte	0x10d
 158:	0000                	.2byte	0x0
 15a:	0000                	.2byte	0x0
 15c:	0100                	.2byte	0x100
 15e:	075e                	.2byte	0x75e
 160:	0d04                	.2byte	0xd04
 162:	0001                	.2byte	0x1
 164:	0000                	.2byte	0x0
 166:	0000                	.2byte	0x0
 168:	0d10                	.2byte	0xd10
 16a:	0001                	.2byte	0x1
 16c:	0000                	.2byte	0x0
 16e:	0000                	.2byte	0x0
 170:	7f06                	.2byte	0x7f06
 172:	7e00                	.2byte	0x7e00
 174:	2200                	.2byte	0x2200
 176:	079f 0d10 0001      	.byte	0x9f, 0x07, 0x10, 0x0d, 0x01, 0x00
 17c:	0000                	.2byte	0x0
 17e:	0000                	.2byte	0x0
 180:	0d18                	.2byte	0xd18
 182:	0001                	.2byte	0x1
 184:	0000                	.2byte	0x0
 186:	0000                	.2byte	0x0
 188:	5f01                	.2byte	0x5f01
 18a:	010d2807          	.4byte	0x10d2807
 18e:	0000                	.2byte	0x0
 190:	0000                	.2byte	0x0
 192:	6000                	.2byte	0x6000
 194:	010d                	.2byte	0x10d
 196:	0000                	.2byte	0x0
 198:	0000                	.2byte	0x0
 19a:	0100                	.2byte	0x100
 19c:	005e                	.2byte	0x5e
 19e:	010d0407          	.4byte	0x10d0407
 1a2:	0000                	.2byte	0x0
 1a4:	0000                	.2byte	0x0
 1a6:	3400                	.2byte	0x3400
 1a8:	010d                	.2byte	0x10d
 1aa:	0000                	.2byte	0x0
 1ac:	0000                	.2byte	0x0
 1ae:	0100                	.2byte	0x100
 1b0:	005c                	.2byte	0x5c
 1b2:	010d0c07          	.4byte	0x10d0c07
 1b6:	0000                	.2byte	0x0
 1b8:	0000                	.2byte	0x0
 1ba:	1400                	.2byte	0x1400
 1bc:	010d                	.2byte	0x10d
 1be:	0000                	.2byte	0x0
 1c0:	0000                	.2byte	0x0
 1c2:	1f00                	.2byte	0x1f00
 1c4:	0080                	.2byte	0x80
 1c6:	80808023          	sb	s0,-2048(ra)
 1ca:	8080                	.2byte	0x8080
 1cc:	8080                	.2byte	0x8080
 1ce:	8080                	.2byte	0x8080
 1d0:	8101                	.2byte	0x8101
 1d2:	2300                	.2byte	0x2300
 1d4:	8080                	.2byte	0x8080
 1d6:	8080                	.2byte	0x8080
 1d8:	8080                	.2byte	0x8080
 1da:	8080                	.2byte	0x8080
 1dc:	0180                	.2byte	0x180
 1de:	082d                	.2byte	0x82d
 1e0:	1aff                	.2byte	0x1aff
 1e2:	079f 0d14 0001      	.byte	0x9f, 0x07, 0x14, 0x0d, 0x01, 0x00
 1e8:	0000                	.2byte	0x0
 1ea:	0000                	.2byte	0x0
 1ec:	0d18                	.2byte	0xd18
 1ee:	0001                	.2byte	0x1
 1f0:	0000                	.2byte	0x0
 1f2:	0000                	.2byte	0x0
 1f4:	7e08                	.2byte	0x7e08
 1f6:	3000                	.2byte	0x3000
 1f8:	082e                	.2byte	0x82e
 1fa:	1aff                	.2byte	0x1aff
 1fc:	9f 00             	Address 0x00000000000001fc is out of bounds.

