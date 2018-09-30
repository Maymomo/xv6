
_sb:     file format elf32-i386


Disassembly of section .text:

00000000 <shownum>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 14             	sub    $0x14,%esp
   7:	8b 5d 08             	mov    0x8(%ebp),%ebx
   a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
   e:	83 fb 0f             	cmp    $0xf,%ebx
  11:	77 26                	ja     39 <shownum+0x39>
  13:	83 e3 0f             	and    $0xf,%ebx
  16:	a1 a8 09 00 00       	mov    0x9a8,%eax
  1b:	8a 04 18             	mov    (%eax,%ebx,1),%al
  1e:	88 45 f7             	mov    %al,-0x9(%ebp)
  21:	83 ec 04             	sub    $0x4,%esp
  24:	6a 01                	push   $0x1
  26:	8d 45 f7             	lea    -0x9(%ebp),%eax
  29:	50                   	push   %eax
  2a:	6a 01                	push   $0x1
  2c:	e8 72 02 00 00       	call   2a3 <write>
  31:	83 c4 10             	add    $0x10,%esp
  34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  37:	c9                   	leave  
  38:	c3                   	ret    
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	89 d8                	mov    %ebx,%eax
  3e:	c1 e8 04             	shr    $0x4,%eax
  41:	50                   	push   %eax
  42:	e8 b9 ff ff ff       	call   0 <shownum>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	eb c7                	jmp    13 <shownum+0x13>

0000004c <show>:
  4c:	55                   	push   %ebp
  4d:	89 e5                	mov    %esp,%ebp
  4f:	83 ec 14             	sub    $0x14,%esp
  52:	ff 75 08             	pushl  0x8(%ebp)
  55:	e8 a6 ff ff ff       	call   0 <shownum>
  5a:	83 c4 0c             	add    $0xc,%esp
  5d:	6a 01                	push   $0x1
  5f:	68 df 06 00 00       	push   $0x6df
  64:	6a 01                	push   $0x1
  66:	e8 38 02 00 00       	call   2a3 <write>
  6b:	83 c4 10             	add    $0x10,%esp
  6e:	c9                   	leave  
  6f:	c3                   	ret    

00000070 <main>:
  70:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  74:	83 e4 f0             	and    $0xfffffff0,%esp
  77:	ff 71 fc             	pushl  -0x4(%ecx)
  7a:	55                   	push   %ebp
  7b:	89 e5                	mov    %esp,%ebp
  7d:	51                   	push   %ecx
  7e:	83 ec 10             	sub    $0x10,%esp
  81:	ff 35 a4 09 00 00    	pushl  0x9a4
  87:	e8 8e 00 00 00       	call   11a <strlen>
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	50                   	push   %eax
  90:	ff 35 a4 09 00 00    	pushl  0x9a4
  96:	6a 01                	push   $0x1
  98:	e8 06 02 00 00       	call   2a3 <write>
  9d:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
  a4:	e8 62 02 00 00       	call   30b <sbrk>
  a9:	89 04 24             	mov    %eax,(%esp)
  ac:	e8 9b ff ff ff       	call   4c <show>
  b1:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
  b8:	e8 8f ff ff ff       	call   4c <show>
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	b8 00 10 00 00       	mov    $0x1000,%eax
  c5:	48                   	dec    %eax
  c6:	75 fd                	jne    c5 <main+0x55>
  c8:	c6 05 00 00 00 00 02 	movb   $0x2,0x0
  cf:	e8 af 01 00 00       	call   283 <exit>

000000d4 <strcpy>:
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  d7:	53                   	push   %ebx
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  de:	ba 00 00 00 00       	mov    $0x0,%edx
  e3:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  e6:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  e9:	42                   	inc    %edx
  ea:	84 c9                	test   %cl,%cl
  ec:	75 f5                	jne    e3 <strcpy+0xf>
  ee:	5b                   	pop    %ebx
  ef:	5d                   	pop    %ebp
  f0:	c3                   	ret    

000000f1 <strcmp>:
  f1:	55                   	push   %ebp
  f2:	89 e5                	mov    %esp,%ebp
  f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  fa:	8a 01                	mov    (%ecx),%al
  fc:	84 c0                	test   %al,%al
  fe:	74 10                	je     110 <strcmp+0x1f>
 100:	3a 02                	cmp    (%edx),%al
 102:	75 0c                	jne    110 <strcmp+0x1f>
 104:	41                   	inc    %ecx
 105:	42                   	inc    %edx
 106:	8a 01                	mov    (%ecx),%al
 108:	84 c0                	test   %al,%al
 10a:	74 04                	je     110 <strcmp+0x1f>
 10c:	3a 02                	cmp    (%edx),%al
 10e:	74 f4                	je     104 <strcmp+0x13>
 110:	0f b6 c0             	movzbl %al,%eax
 113:	0f b6 12             	movzbl (%edx),%edx
 116:	29 d0                	sub    %edx,%eax
 118:	5d                   	pop    %ebp
 119:	c3                   	ret    

0000011a <strlen>:
 11a:	55                   	push   %ebp
 11b:	89 e5                	mov    %esp,%ebp
 11d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 120:	80 39 00             	cmpb   $0x0,(%ecx)
 123:	74 10                	je     135 <strlen+0x1b>
 125:	ba 00 00 00 00       	mov    $0x0,%edx
 12a:	42                   	inc    %edx
 12b:	89 d0                	mov    %edx,%eax
 12d:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 131:	75 f7                	jne    12a <strlen+0x10>
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    
 135:	b8 00 00 00 00       	mov    $0x0,%eax
 13a:	eb f7                	jmp    133 <strlen+0x19>

0000013c <memset>:
 13c:	55                   	push   %ebp
 13d:	89 e5                	mov    %esp,%ebp
 13f:	57                   	push   %edi
 140:	8b 55 08             	mov    0x8(%ebp),%edx
 143:	89 d7                	mov    %edx,%edi
 145:	8b 4d 10             	mov    0x10(%ebp),%ecx
 148:	8b 45 0c             	mov    0xc(%ebp),%eax
 14b:	fc                   	cld    
 14c:	f3 aa                	rep stos %al,%es:(%edi)
 14e:	89 d0                	mov    %edx,%eax
 150:	5f                   	pop    %edi
 151:	5d                   	pop    %ebp
 152:	c3                   	ret    

00000153 <strchr>:
 153:	55                   	push   %ebp
 154:	89 e5                	mov    %esp,%ebp
 156:	53                   	push   %ebx
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 15d:	8a 10                	mov    (%eax),%dl
 15f:	84 d2                	test   %dl,%dl
 161:	74 1b                	je     17e <strchr+0x2b>
 163:	88 d9                	mov    %bl,%cl
 165:	38 d3                	cmp    %dl,%bl
 167:	74 12                	je     17b <strchr+0x28>
 169:	40                   	inc    %eax
 16a:	8a 10                	mov    (%eax),%dl
 16c:	84 d2                	test   %dl,%dl
 16e:	74 06                	je     176 <strchr+0x23>
 170:	38 ca                	cmp    %cl,%dl
 172:	75 f5                	jne    169 <strchr+0x16>
 174:	eb 05                	jmp    17b <strchr+0x28>
 176:	b8 00 00 00 00       	mov    $0x0,%eax
 17b:	5b                   	pop    %ebx
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
 17e:	b8 00 00 00 00       	mov    $0x0,%eax
 183:	eb f6                	jmp    17b <strchr+0x28>

00000185 <gets>:
 185:	55                   	push   %ebp
 186:	89 e5                	mov    %esp,%ebp
 188:	57                   	push   %edi
 189:	56                   	push   %esi
 18a:	53                   	push   %ebx
 18b:	83 ec 1c             	sub    $0x1c,%esp
 18e:	be 00 00 00 00       	mov    $0x0,%esi
 193:	8d 7d e7             	lea    -0x19(%ebp),%edi
 196:	8d 5e 01             	lea    0x1(%esi),%ebx
 199:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 19c:	7d 2c                	jge    1ca <gets+0x45>
 19e:	83 ec 04             	sub    $0x4,%esp
 1a1:	6a 01                	push   $0x1
 1a3:	57                   	push   %edi
 1a4:	6a 00                	push   $0x0
 1a6:	e8 f0 00 00 00       	call   29b <read>
 1ab:	83 c4 10             	add    $0x10,%esp
 1ae:	85 c0                	test   %eax,%eax
 1b0:	7e 18                	jle    1ca <gets+0x45>
 1b2:	8a 45 e7             	mov    -0x19(%ebp),%al
 1b5:	8b 55 08             	mov    0x8(%ebp),%edx
 1b8:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1bc:	3c 0a                	cmp    $0xa,%al
 1be:	74 08                	je     1c8 <gets+0x43>
 1c0:	89 de                	mov    %ebx,%esi
 1c2:	3c 0d                	cmp    $0xd,%al
 1c4:	75 d0                	jne    196 <gets+0x11>
 1c6:	eb 02                	jmp    1ca <gets+0x45>
 1c8:	89 de                	mov    %ebx,%esi
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 1d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1d4:	5b                   	pop    %ebx
 1d5:	5e                   	pop    %esi
 1d6:	5f                   	pop    %edi
 1d7:	5d                   	pop    %ebp
 1d8:	c3                   	ret    

000001d9 <stat>:
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	56                   	push   %esi
 1dd:	53                   	push   %ebx
 1de:	83 ec 08             	sub    $0x8,%esp
 1e1:	6a 00                	push   $0x0
 1e3:	ff 75 08             	pushl  0x8(%ebp)
 1e6:	e8 d8 00 00 00       	call   2c3 <open>
 1eb:	83 c4 10             	add    $0x10,%esp
 1ee:	85 c0                	test   %eax,%eax
 1f0:	78 24                	js     216 <stat+0x3d>
 1f2:	89 c3                	mov    %eax,%ebx
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	ff 75 0c             	pushl  0xc(%ebp)
 1fa:	50                   	push   %eax
 1fb:	e8 db 00 00 00       	call   2db <fstat>
 200:	89 c6                	mov    %eax,%esi
 202:	89 1c 24             	mov    %ebx,(%esp)
 205:	e8 a1 00 00 00       	call   2ab <close>
 20a:	83 c4 10             	add    $0x10,%esp
 20d:	89 f0                	mov    %esi,%eax
 20f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 212:	5b                   	pop    %ebx
 213:	5e                   	pop    %esi
 214:	5d                   	pop    %ebp
 215:	c3                   	ret    
 216:	be ff ff ff ff       	mov    $0xffffffff,%esi
 21b:	eb f0                	jmp    20d <stat+0x34>

0000021d <atoi>:
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
 220:	53                   	push   %ebx
 221:	8b 4d 08             	mov    0x8(%ebp),%ecx
 224:	8a 11                	mov    (%ecx),%dl
 226:	8d 42 d0             	lea    -0x30(%edx),%eax
 229:	3c 09                	cmp    $0x9,%al
 22b:	77 1f                	ja     24c <atoi+0x2f>
 22d:	b8 00 00 00 00       	mov    $0x0,%eax
 232:	41                   	inc    %ecx
 233:	8d 04 80             	lea    (%eax,%eax,4),%eax
 236:	01 c0                	add    %eax,%eax
 238:	0f be d2             	movsbl %dl,%edx
 23b:	8d 44 10 d0          	lea    -0x30(%eax,%edx,1),%eax
 23f:	8a 11                	mov    (%ecx),%dl
 241:	8d 5a d0             	lea    -0x30(%edx),%ebx
 244:	80 fb 09             	cmp    $0x9,%bl
 247:	76 e9                	jbe    232 <atoi+0x15>
 249:	5b                   	pop    %ebx
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    
 24c:	b8 00 00 00 00       	mov    $0x0,%eax
 251:	eb f6                	jmp    249 <atoi+0x2c>

00000253 <memmove>:
 253:	55                   	push   %ebp
 254:	89 e5                	mov    %esp,%ebp
 256:	56                   	push   %esi
 257:	53                   	push   %ebx
 258:	8b 75 08             	mov    0x8(%ebp),%esi
 25b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 25e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 261:	85 db                	test   %ebx,%ebx
 263:	7e 10                	jle    275 <memmove+0x22>
 265:	01 f3                	add    %esi,%ebx
 267:	89 f2                	mov    %esi,%edx
 269:	41                   	inc    %ecx
 26a:	42                   	inc    %edx
 26b:	8a 41 ff             	mov    -0x1(%ecx),%al
 26e:	88 42 ff             	mov    %al,-0x1(%edx)
 271:	39 d3                	cmp    %edx,%ebx
 273:	75 f4                	jne    269 <memmove+0x16>
 275:	89 f0                	mov    %esi,%eax
 277:	5b                   	pop    %ebx
 278:	5e                   	pop    %esi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    

0000027b <fork>:
 27b:	b8 01 00 00 00       	mov    $0x1,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exit>:
 283:	b8 02 00 00 00       	mov    $0x2,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <wait>:
 28b:	b8 03 00 00 00       	mov    $0x3,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <pipe>:
 293:	b8 04 00 00 00       	mov    $0x4,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <read>:
 29b:	b8 05 00 00 00       	mov    $0x5,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <write>:
 2a3:	b8 10 00 00 00       	mov    $0x10,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <close>:
 2ab:	b8 15 00 00 00       	mov    $0x15,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <kill>:
 2b3:	b8 06 00 00 00       	mov    $0x6,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exec>:
 2bb:	b8 07 00 00 00       	mov    $0x7,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <open>:
 2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mknod>:
 2cb:	b8 11 00 00 00       	mov    $0x11,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <unlink>:
 2d3:	b8 12 00 00 00       	mov    $0x12,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <fstat>:
 2db:	b8 08 00 00 00       	mov    $0x8,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <link>:
 2e3:	b8 13 00 00 00       	mov    $0x13,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mkdir>:
 2eb:	b8 14 00 00 00       	mov    $0x14,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <chdir>:
 2f3:	b8 09 00 00 00       	mov    $0x9,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <dup>:
 2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <getpid>:
 303:	b8 0b 00 00 00       	mov    $0xb,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <sbrk>:
 30b:	b8 0c 00 00 00       	mov    $0xc,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sleep>:
 313:	b8 0d 00 00 00       	mov    $0xd,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <uptime>:
 31b:	b8 0e 00 00 00       	mov    $0xe,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <may>:
 323:	b8 16 00 00 00       	mov    $0x16,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <dup2>:
 32b:	b8 17 00 00 00       	mov    $0x17,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <printint>:
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	57                   	push   %edi
 337:	56                   	push   %esi
 338:	53                   	push   %ebx
 339:	83 ec 3c             	sub    $0x3c,%esp
 33c:	89 45 bc             	mov    %eax,-0x44(%ebp)
 33f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 343:	74 04                	je     349 <printint+0x16>
 345:	85 d2                	test   %edx,%edx
 347:	78 10                	js     359 <printint+0x26>
 349:	89 d3                	mov    %edx,%ebx
 34b:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 352:	be 00 00 00 00       	mov    $0x0,%esi
 357:	eb 11                	jmp    36a <printint+0x37>
 359:	f7 da                	neg    %edx
 35b:	89 d3                	mov    %edx,%ebx
 35d:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 364:	eb ec                	jmp    352 <printint+0x1f>
 366:	89 c3                	mov    %eax,%ebx
 368:	89 fe                	mov    %edi,%esi
 36a:	8d 7e 01             	lea    0x1(%esi),%edi
 36d:	89 d8                	mov    %ebx,%eax
 36f:	ba 00 00 00 00       	mov    $0x0,%edx
 374:	f7 f1                	div    %ecx
 376:	8a 92 f8 06 00 00    	mov    0x6f8(%edx),%dl
 37c:	88 55 c4             	mov    %dl,-0x3c(%ebp)
 37f:	88 54 3d d7          	mov    %dl,-0x29(%ebp,%edi,1)
 383:	39 d9                	cmp    %ebx,%ecx
 385:	76 df                	jbe    366 <printint+0x33>
 387:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 38b:	74 08                	je     395 <printint+0x62>
 38d:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 392:	8d 7e 02             	lea    0x2(%esi),%edi
 395:	85 ff                	test   %edi,%edi
 397:	7e 30                	jle    3c9 <printint+0x96>
 399:	8b 75 bc             	mov    -0x44(%ebp),%esi
 39c:	8d 45 d8             	lea    -0x28(%ebp),%eax
 39f:	8d 5c 38 ff          	lea    -0x1(%eax,%edi,1),%ebx
 3a3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3a6:	8d 7d d7             	lea    -0x29(%ebp),%edi
 3a9:	eb 02                	jmp    3ad <printint+0x7a>
 3ab:	89 c3                	mov    %eax,%ebx
 3ad:	8a 03                	mov    (%ebx),%al
 3af:	88 45 d7             	mov    %al,-0x29(%ebp)
 3b2:	83 ec 04             	sub    $0x4,%esp
 3b5:	6a 01                	push   $0x1
 3b7:	57                   	push   %edi
 3b8:	56                   	push   %esi
 3b9:	e8 e5 fe ff ff       	call   2a3 <write>
 3be:	8d 43 ff             	lea    -0x1(%ebx),%eax
 3c1:	83 c4 10             	add    $0x10,%esp
 3c4:	3b 5d c4             	cmp    -0x3c(%ebp),%ebx
 3c7:	75 e2                	jne    3ab <printint+0x78>
 3c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3cc:	5b                   	pop    %ebx
 3cd:	5e                   	pop    %esi
 3ce:	5f                   	pop    %edi
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    

000003d1 <printf>:
 3d1:	55                   	push   %ebp
 3d2:	89 e5                	mov    %esp,%ebp
 3d4:	57                   	push   %edi
 3d5:	56                   	push   %esi
 3d6:	53                   	push   %ebx
 3d7:	83 ec 2c             	sub    $0x2c,%esp
 3da:	8b 75 0c             	mov    0xc(%ebp),%esi
 3dd:	8a 1e                	mov    (%esi),%bl
 3df:	84 db                	test   %bl,%bl
 3e1:	0f 84 9f 01 00 00    	je     586 <printf+0x1b5>
 3e7:	46                   	inc    %esi
 3e8:	8d 45 10             	lea    0x10(%ebp),%eax
 3eb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3ee:	bf 00 00 00 00       	mov    $0x0,%edi
 3f3:	eb 2a                	jmp    41f <printf+0x4e>
 3f5:	88 5d e7             	mov    %bl,-0x19(%ebp)
 3f8:	83 ec 04             	sub    $0x4,%esp
 3fb:	6a 01                	push   $0x1
 3fd:	8d 45 e7             	lea    -0x19(%ebp),%eax
 400:	50                   	push   %eax
 401:	ff 75 08             	pushl  0x8(%ebp)
 404:	e8 9a fe ff ff       	call   2a3 <write>
 409:	83 c4 10             	add    $0x10,%esp
 40c:	eb 05                	jmp    413 <printf+0x42>
 40e:	83 ff 25             	cmp    $0x25,%edi
 411:	74 1f                	je     432 <printf+0x61>
 413:	46                   	inc    %esi
 414:	8a 5e ff             	mov    -0x1(%esi),%bl
 417:	84 db                	test   %bl,%bl
 419:	0f 84 67 01 00 00    	je     586 <printf+0x1b5>
 41f:	0f be d3             	movsbl %bl,%edx
 422:	0f b6 c3             	movzbl %bl,%eax
 425:	85 ff                	test   %edi,%edi
 427:	75 e5                	jne    40e <printf+0x3d>
 429:	83 f8 25             	cmp    $0x25,%eax
 42c:	75 c7                	jne    3f5 <printf+0x24>
 42e:	89 c7                	mov    %eax,%edi
 430:	eb e1                	jmp    413 <printf+0x42>
 432:	83 f8 64             	cmp    $0x64,%eax
 435:	74 59                	je     490 <printf+0xbf>
 437:	81 e2 f7 00 00 00    	and    $0xf7,%edx
 43d:	83 fa 70             	cmp    $0x70,%edx
 440:	74 7a                	je     4bc <printf+0xeb>
 442:	83 f8 73             	cmp    $0x73,%eax
 445:	0f 84 9d 00 00 00    	je     4e8 <printf+0x117>
 44b:	83 f8 63             	cmp    $0x63,%eax
 44e:	0f 84 e5 00 00 00    	je     539 <printf+0x168>
 454:	83 f8 25             	cmp    $0x25,%eax
 457:	0f 84 08 01 00 00    	je     565 <printf+0x194>
 45d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 461:	83 ec 04             	sub    $0x4,%esp
 464:	6a 01                	push   $0x1
 466:	8d 45 e7             	lea    -0x19(%ebp),%eax
 469:	50                   	push   %eax
 46a:	ff 75 08             	pushl  0x8(%ebp)
 46d:	e8 31 fe ff ff       	call   2a3 <write>
 472:	88 5d e7             	mov    %bl,-0x19(%ebp)
 475:	83 c4 0c             	add    $0xc,%esp
 478:	6a 01                	push   $0x1
 47a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 47d:	50                   	push   %eax
 47e:	ff 75 08             	pushl  0x8(%ebp)
 481:	e8 1d fe ff ff       	call   2a3 <write>
 486:	83 c4 10             	add    $0x10,%esp
 489:	bf 00 00 00 00       	mov    $0x0,%edi
 48e:	eb 83                	jmp    413 <printf+0x42>
 490:	83 ec 0c             	sub    $0xc,%esp
 493:	6a 01                	push   $0x1
 495:	b9 0a 00 00 00       	mov    $0xa,%ecx
 49a:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 49d:	8b 17                	mov    (%edi),%edx
 49f:	8b 45 08             	mov    0x8(%ebp),%eax
 4a2:	e8 8c fe ff ff       	call   333 <printint>
 4a7:	89 f8                	mov    %edi,%eax
 4a9:	83 c0 04             	add    $0x4,%eax
 4ac:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4af:	83 c4 10             	add    $0x10,%esp
 4b2:	bf 00 00 00 00       	mov    $0x0,%edi
 4b7:	e9 57 ff ff ff       	jmp    413 <printf+0x42>
 4bc:	83 ec 0c             	sub    $0xc,%esp
 4bf:	6a 00                	push   $0x0
 4c1:	b9 10 00 00 00       	mov    $0x10,%ecx
 4c6:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4c9:	8b 17                	mov    (%edi),%edx
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	e8 60 fe ff ff       	call   333 <printint>
 4d3:	89 f8                	mov    %edi,%eax
 4d5:	83 c0 04             	add    $0x4,%eax
 4d8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4db:	83 c4 10             	add    $0x10,%esp
 4de:	bf 00 00 00 00       	mov    $0x0,%edi
 4e3:	e9 2b ff ff ff       	jmp    413 <printf+0x42>
 4e8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 4eb:	8b 01                	mov    (%ecx),%eax
 4ed:	83 c1 04             	add    $0x4,%ecx
 4f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4f3:	85 c0                	test   %eax,%eax
 4f5:	74 12                	je     509 <printf+0x138>
 4f7:	89 c3                	mov    %eax,%ebx
 4f9:	8a 00                	mov    (%eax),%al
 4fb:	84 c0                	test   %al,%al
 4fd:	75 11                	jne    510 <printf+0x13f>
 4ff:	bf 00 00 00 00       	mov    $0x0,%edi
 504:	e9 0a ff ff ff       	jmp    413 <printf+0x42>
 509:	bb f1 06 00 00       	mov    $0x6f1,%ebx
 50e:	b0 28                	mov    $0x28,%al
 510:	8b 7d 08             	mov    0x8(%ebp),%edi
 513:	88 45 e7             	mov    %al,-0x19(%ebp)
 516:	83 ec 04             	sub    $0x4,%esp
 519:	6a 01                	push   $0x1
 51b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 51e:	50                   	push   %eax
 51f:	57                   	push   %edi
 520:	e8 7e fd ff ff       	call   2a3 <write>
 525:	43                   	inc    %ebx
 526:	8a 03                	mov    (%ebx),%al
 528:	83 c4 10             	add    $0x10,%esp
 52b:	84 c0                	test   %al,%al
 52d:	75 e4                	jne    513 <printf+0x142>
 52f:	bf 00 00 00 00       	mov    $0x0,%edi
 534:	e9 da fe ff ff       	jmp    413 <printf+0x42>
 539:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 53c:	8b 07                	mov    (%edi),%eax
 53e:	88 45 e7             	mov    %al,-0x19(%ebp)
 541:	83 ec 04             	sub    $0x4,%esp
 544:	6a 01                	push   $0x1
 546:	8d 45 e7             	lea    -0x19(%ebp),%eax
 549:	50                   	push   %eax
 54a:	ff 75 08             	pushl  0x8(%ebp)
 54d:	e8 51 fd ff ff       	call   2a3 <write>
 552:	83 c7 04             	add    $0x4,%edi
 555:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 558:	83 c4 10             	add    $0x10,%esp
 55b:	bf 00 00 00 00       	mov    $0x0,%edi
 560:	e9 ae fe ff ff       	jmp    413 <printf+0x42>
 565:	88 5d e7             	mov    %bl,-0x19(%ebp)
 568:	83 ec 04             	sub    $0x4,%esp
 56b:	6a 01                	push   $0x1
 56d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 570:	50                   	push   %eax
 571:	ff 75 08             	pushl  0x8(%ebp)
 574:	e8 2a fd ff ff       	call   2a3 <write>
 579:	83 c4 10             	add    $0x10,%esp
 57c:	bf 00 00 00 00       	mov    $0x0,%edi
 581:	e9 8d fe ff ff       	jmp    413 <printf+0x42>
 586:	8d 65 f4             	lea    -0xc(%ebp),%esp
 589:	5b                   	pop    %ebx
 58a:	5e                   	pop    %esi
 58b:	5f                   	pop    %edi
 58c:	5d                   	pop    %ebp
 58d:	c3                   	ret    

0000058e <free>:
 58e:	55                   	push   %ebp
 58f:	89 e5                	mov    %esp,%ebp
 591:	57                   	push   %edi
 592:	56                   	push   %esi
 593:	53                   	push   %ebx
 594:	8b 5d 08             	mov    0x8(%ebp),%ebx
 597:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 59a:	a1 ac 09 00 00       	mov    0x9ac,%eax
 59f:	eb 28                	jmp    5c9 <free+0x3b>
 5a1:	03 72 04             	add    0x4(%edx),%esi
 5a4:	89 73 fc             	mov    %esi,-0x4(%ebx)
 5a7:	8b 10                	mov    (%eax),%edx
 5a9:	8b 12                	mov    (%edx),%edx
 5ab:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5ae:	eb 36                	jmp    5e6 <free+0x58>
 5b0:	03 53 fc             	add    -0x4(%ebx),%edx
 5b3:	89 50 04             	mov    %edx,0x4(%eax)
 5b6:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5b9:	89 10                	mov    %edx,(%eax)
 5bb:	eb 35                	jmp    5f2 <free+0x64>
 5bd:	8b 10                	mov    (%eax),%edx
 5bf:	39 d0                	cmp    %edx,%eax
 5c1:	72 04                	jb     5c7 <free+0x39>
 5c3:	39 d1                	cmp    %edx,%ecx
 5c5:	72 10                	jb     5d7 <free+0x49>
 5c7:	89 d0                	mov    %edx,%eax
 5c9:	39 c8                	cmp    %ecx,%eax
 5cb:	73 f0                	jae    5bd <free+0x2f>
 5cd:	8b 10                	mov    (%eax),%edx
 5cf:	39 ca                	cmp    %ecx,%edx
 5d1:	77 04                	ja     5d7 <free+0x49>
 5d3:	39 c2                	cmp    %eax,%edx
 5d5:	77 f0                	ja     5c7 <free+0x39>
 5d7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5da:	8b 10                	mov    (%eax),%edx
 5dc:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5df:	39 fa                	cmp    %edi,%edx
 5e1:	74 be                	je     5a1 <free+0x13>
 5e3:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5e6:	8b 50 04             	mov    0x4(%eax),%edx
 5e9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5ec:	39 f1                	cmp    %esi,%ecx
 5ee:	74 c0                	je     5b0 <free+0x22>
 5f0:	89 08                	mov    %ecx,(%eax)
 5f2:	a3 ac 09 00 00       	mov    %eax,0x9ac
 5f7:	5b                   	pop    %ebx
 5f8:	5e                   	pop    %esi
 5f9:	5f                   	pop    %edi
 5fa:	5d                   	pop    %ebp
 5fb:	c3                   	ret    

000005fc <malloc>:
 5fc:	55                   	push   %ebp
 5fd:	89 e5                	mov    %esp,%ebp
 5ff:	57                   	push   %edi
 600:	56                   	push   %esi
 601:	53                   	push   %ebx
 602:	83 ec 0c             	sub    $0xc,%esp
 605:	8b 45 08             	mov    0x8(%ebp),%eax
 608:	8d 58 07             	lea    0x7(%eax),%ebx
 60b:	c1 eb 03             	shr    $0x3,%ebx
 60e:	43                   	inc    %ebx
 60f:	8b 15 ac 09 00 00    	mov    0x9ac,%edx
 615:	85 d2                	test   %edx,%edx
 617:	74 24                	je     63d <malloc+0x41>
 619:	8b 02                	mov    (%edx),%eax
 61b:	8b 48 04             	mov    0x4(%eax),%ecx
 61e:	39 cb                	cmp    %ecx,%ebx
 620:	76 40                	jbe    662 <malloc+0x66>
 622:	89 de                	mov    %ebx,%esi
 624:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 62a:	73 05                	jae    631 <malloc+0x35>
 62c:	be 00 10 00 00       	mov    $0x1000,%esi
 631:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 638:	e9 81 00 00 00       	jmp    6be <malloc+0xc2>
 63d:	c7 05 ac 09 00 00 b0 	movl   $0x9b0,0x9ac
 644:	09 00 00 
 647:	c7 05 b0 09 00 00 b0 	movl   $0x9b0,0x9b0
 64e:	09 00 00 
 651:	c7 05 b4 09 00 00 00 	movl   $0x0,0x9b4
 658:	00 00 00 
 65b:	b8 b0 09 00 00       	mov    $0x9b0,%eax
 660:	eb c0                	jmp    622 <malloc+0x26>
 662:	39 cb                	cmp    %ecx,%ebx
 664:	74 1c                	je     682 <malloc+0x86>
 666:	29 d9                	sub    %ebx,%ecx
 668:	89 48 04             	mov    %ecx,0x4(%eax)
 66b:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 66e:	89 58 04             	mov    %ebx,0x4(%eax)
 671:	89 15 ac 09 00 00    	mov    %edx,0x9ac
 677:	83 c0 08             	add    $0x8,%eax
 67a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 67d:	5b                   	pop    %ebx
 67e:	5e                   	pop    %esi
 67f:	5f                   	pop    %edi
 680:	5d                   	pop    %ebp
 681:	c3                   	ret    
 682:	8b 08                	mov    (%eax),%ecx
 684:	89 0a                	mov    %ecx,(%edx)
 686:	eb e9                	jmp    671 <malloc+0x75>
 688:	83 ec 0c             	sub    $0xc,%esp
 68b:	57                   	push   %edi
 68c:	e8 7a fc ff ff       	call   30b <sbrk>
 691:	83 c4 10             	add    $0x10,%esp
 694:	83 f8 ff             	cmp    $0xffffffff,%eax
 697:	74 31                	je     6ca <malloc+0xce>
 699:	89 70 04             	mov    %esi,0x4(%eax)
 69c:	83 ec 0c             	sub    $0xc,%esp
 69f:	83 c0 08             	add    $0x8,%eax
 6a2:	50                   	push   %eax
 6a3:	e8 e6 fe ff ff       	call   58e <free>
 6a8:	8b 15 ac 09 00 00    	mov    0x9ac,%edx
 6ae:	83 c4 10             	add    $0x10,%esp
 6b1:	85 d2                	test   %edx,%edx
 6b3:	74 1c                	je     6d1 <malloc+0xd5>
 6b5:	8b 02                	mov    (%edx),%eax
 6b7:	8b 48 04             	mov    0x4(%eax),%ecx
 6ba:	39 d9                	cmp    %ebx,%ecx
 6bc:	73 a4                	jae    662 <malloc+0x66>
 6be:	39 05 ac 09 00 00    	cmp    %eax,0x9ac
 6c4:	74 c2                	je     688 <malloc+0x8c>
 6c6:	89 c2                	mov    %eax,%edx
 6c8:	eb eb                	jmp    6b5 <malloc+0xb9>
 6ca:	b8 00 00 00 00       	mov    $0x0,%eax
 6cf:	eb a9                	jmp    67a <malloc+0x7e>
 6d1:	b8 00 00 00 00       	mov    $0x0,%eax
 6d6:	eb a2                	jmp    67a <malloc+0x7e>
