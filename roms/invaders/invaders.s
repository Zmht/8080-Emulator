0000	NOP	
0001	NOP	
0002	NOP	
0003	JMP     #$18d4	
0006	NOP	
0007	NOP	
0008	PUSH    PSW	
0009	PUSH    B	
000a	PUSH    D	
000b	PUSH    H	
000c	JMP     #$008c	
000f	NOP	
0010	PUSH    PSW	
0011	PUSH    B	
0012	PUSH    D	
0013	PUSH    H	
0014	MVI     A,#$80	
0016	STA     #$2072	
0019	LXI     H,#$20c0	
001c	DCR     M	
001d	CALL    #$17cd	
0020	IN      #$01	
0022	RRC	
0023	JC      #$0067	
0026	LDA     #$20ea	
0029	ANA     A	
002a	JZ      #$0042	
002d	LDA     #$20eb	
0030	CPI		#$99	
0032	JZ      #$003e	
0035	ADI     #$01	
0036	LXI     B,#$3227	
0039	XCHG	
003a	RIM	
003b	CALL    #$1947	
003e	XRA     A	
003f	STA     #$20ea	
0042	LDA     #$20e9	
0045	ANA     A	
0046	JZ      #$0082	
0049	LDA     #$20ef	
004c	ANA     A	
004d	JNZ     #$006f	
0050	LDA     #$20eb	
0053	ANA     A	
0054	JNZ     #$005d	
0057	CALL    #$0abf	
005a	JMP     #$0082	
005d	LDA     #$2093	
0060	ANA     A	
0061	JNZ     #$0082	
0064	JMP     #$0765	
0067	MVI     A,#$01	
0069	STA     #$20ea	
006c	JMP     #$003f	
006f	CALL    #$1740	
0072	LDA     #$2032	
0075	STA     #$2080	
0078	CALL    #$0100	
007b	CALL    #$0248	
007e	CALL    #$0913	
0081	NOP	
0082	POP     H	
0083	POP     D	
0084	POP     B	
0085	POP     PSW	
0086	EI	
0087	RET	
0088	NOP	
0089	NOP	
008a	NOP	
008b	NOP	
008c	XRA     A	
008d	STA     #$2072	
0090	LDA     #$20e9	
0093	ANA     A	
0094	JZ      #$0082	
0097	LDA     #$20ef	
009a	ANA     A	
009b	JNZ     #$00a5	
009e	LDA     #$20c1	
00a1	RRC	
00a2	JNC     #$0082	
00a5	LXI     H,#$2020	
00a8	CALL    #$024b	
00ab	CALL    #$0141	
00ae	JMP     #$0082	
00b1	CALL    #$0886	
00b4	PUSH    H	
00b5	MOV     A,M	
00b6	INX     H	
00b7	MOV     H,M	
00b8	MOV     L,A	
00b9	SHLD    $2009	
00bc	SHLD    $200b	
00bf	POP     H	
00c0	DCX     H	
00c1	MOV     A,M	
00c2	CPI		#$03	
00c4	JNZ     #$00c8	
00c7	DCR     A	
00c8	STA     #$2008	
00cb	CPI		#$fe	
00cd	MVI     A,#$00	
00cf	JNZ     #$00d3	
00d2	INR     A	
00d3	STA     #$200d	
00d6	RET	
00d7	MVI     A,#$02	
00d9	STA     #$21fb	
00dc	STA     #$22fb	
00df	JMP     #$08e4	
00e2	NOP	
00e3	NOP	
00e4	NOP	
00e5	NOP	
00e6	NOP	
00e7	NOP	
00e8	NOP	
00e9	NOP	
00ea	NOP	
00eb	NOP	
00ec	NOP	
00ed	NOP	
00ee	NOP	
00ef	NOP	
00f0	NOP	
00f1	NOP	
00f2	NOP	
00f3	NOP	
00f4	NOP	
00f5	NOP	
00f6	NOP	
00f7	NOP	
00f8	NOP	
00f9	NOP	
00fa	NOP	
00fb	NOP	
00fc	NOP	
00fd	NOP	
00fe	NOP	
00ff	NOP	
0100	LXI     H,#$2002	
0103	MOV     A,M	
0104	ANA     A	
0105	JNZ     #$1538	
0108	PUSH    H	
0109	LDA     #$2006	
010c	MOV     L,A	
010d	LDA     #$2067	
0110	MOV     H,A	
0111	MOV     A,M	
0112	ANA     A	
0113	POP     H	
0114	JZ      #$0136	
0117	INX     H	
0118	INX     H	
0119	MOV     A,M	
011a	INX     H	
011b	MOV     B,M	
011c	ANI     #$fe	
011f	RLC	
0120	RLC	
0121	MOV     E,A	
0122	MVI     D,#$00	
0124	LXI     H,#$1c00	
0127	DAD     D	
0128	XCHG	
0129	MOV     A,B	
012a	ANA     A	
012b	CNZ     #$013b	
012e	LHLD    #$200b	
0131	MVI     B,#$10	
0132	NOP	
0133	CALL    #$15d3	
0136	XRA     A	
0137	STA     #$2000	
013a	RET	
013b	LXI     H,#$0030	
013e	DAD     D	
013f	XCHG	
0140	RET	
0141	LDA     #$2068	
0144	ANA     A	
0145	RZ	
0146	LDA     #$2000	
0149	ANA     A	
014a	RNZ	
014b	LDA     #$2067	
014e	MOV     H,A	
014f	LDA     #$2006	
0152	MVI     D,#$02	
0154	INR     A	
0155	CPI		#$37	
0157	CZ      #$01a1	
015a	MOV     L,A	
015b	MOV     B,M	
015c	DCR     B	
015d	JNZ     #$0154	
0160	STA     #$2006	
0163	CALL    #$017a	
0166	MOV     H,C	
0167	SHLD    $200b	
016a	MOV     A,L	
016b	CPI		#$28	
016d	JC      #$1971	
0170	MOV     A,D	
0171	STA     #$2004	
0174	MVI     A,#$01	
0176	STA     #$2000	
0179	RET	
017a	MVI     D,#$00	
017c	MOV     A,L	
017d	LXI     H,#$2009	
0180	MOV     B,M	
0181	INX     H	
0182	MOV     C,M	
0183	CPI		#$0b	
0185	JM      #$0194	
0188	SBI     #$0b	
018a	MOV     E,A	
018b	MOV     A,B	
018c	ADI     #$10	
018d	NOP	
018e	MOV     B,A	
018f	MOV     A,E	
0190	INR     D	
0191	JMP     #$0183	
0194	MOV     L,B	
0195	ANA     A	
0196	RZ	
0197	MOV     E,A	
0198	MOV     A,C	
0199	ADI     #$10	
019a	NOP	
019b	MOV     C,A	
019c	MOV     A,E	
019d	DCR     A	
019e	JMP     #$0195	
01a1	DCR     D	
01a2	JZ      #$01cd	
01a5	LXI     H,#$2006	
01a8	MVI     M,#$00	
01aa	INX     H	
01ab	MOV     C,M	
01ac	MVI     M,#$00	
01ae	CALL    #$01d9	
01b1	LXI     H,#$2005	
01b4	MOV     A,M	
01b5	INR     A	
01b6	ANI     #$01	
01b9	XRA     A	
01ba	LXI     H,#$2067	
01bd	MOV     H,M	
01be	RET	
01bf	NOP	
01c0	LXI     H,#$2100	
01c3	MVI     B,#$37	
01c4	STC	
01c5	MVI     M,#$01	
01c7	INX     H	
01c8	DCR     B	
01c9	JNZ     #$01c5	
01cc	RET	
01cd	POP     H	
01ce	RET	
01cf	MVI     A,#$01	
01d1	MVI     B,#$e0	
01d2	RPO	
01d3	LXI     H,#$2402	
01d6	JMP     #$14cc	
01d9	INX     H	
01da	MOV     B,M	
01db	INX     H	
01dc	MOV     A,C	
01dd	ADD     M	
01de	MOV     M,A	
01df	INX     H	
01e0	MOV     A,B	
01e1	ADD     M	
01e2	MOV     M,A	
01e3	RET	
01e4	MVI     B,#$c0	
01e5	RNZ	
01e6	LXI     D,#$1b00	
01e9	LXI     H,#$2000	
01ec	JMP     #$1a32	
01ef	LXI     H,#$2142	
01f2	JMP     #$01f8	
01f5	LXI     H,#$2242	
01f8	MVI     C,#$04	
01fa	LXI     D,#$1d20	
01fd	PUSH    D	
01fe	MVI     B,#$2c	
01ff	INR     L	
0200	CALL    #$1a32	
0203	POP     D	
0204	DCR     C	
0205	JNZ     #$01fd	
0208	RET	
0209	MVI     A,#$01	
020b	JMP     #$021b	
020e	MVI     A,#$01	
0210	JMP     #$0214	
0213	XRA     A	
0214	LXI     D,#$2242	
0217	JMP     #$021e	
021a	XRA     A	
021b	LXI     D,#$2142	
021e	STA     #$2081	
0221	LXI     B,#$1602	
0224	LXI     H,#$2806	
0227	MVI     A,#$04	
0229	PUSH    PSW	
022a	PUSH    B	
022b	LDA     #$2081	
022e	ANA     A	
022f	JNZ     #$0242	
0232	CALL    #$1a69	
0235	POP     B	
0236	POP     PSW	
0237	DCR     A	
0238	RZ	
0239	PUSH    D	
023a	LXI     D,#$02e0	
023d	DAD     D	
023e	POP     D	
023f	JMP     #$0229	
0242	CALL    #$147c	
0245	JMP     #$0235	
0248	LXI     H,#$2010	
024b	MOV     A,M	
024c	CPI		#$ff	
024e	RZ	
024f	CPI		#$fe	
0251	JZ      #$0281	
0254	INX     H	
0255	MOV     B,M	
0256	MOV     C,A	
0257	ORA     B	
0258	MOV     A,C	
0259	JNZ     #$0277	
025c	INX     H	
025d	MOV     A,M	
025e	ANA     A	
025f	JNZ     #$0288	
0262	INX     H	
0263	MOV     E,M	
0264	INX     H	
0265	MOV     D,M	
0266	PUSH    H	
0267	XCHG	
0268	PUSH    H	
0269	LXI     H,#$026f	
026c	XTHL	
026d	PUSH    D	
026e	PCHL	
026f	POP     H	
0270	LXI     D,#$000c	
0273	DAD     D	
0274	JMP     #$024b	
0277	DCR     B	
0278	INR     B	
0279	JNZ     #$027d	
027c	DCR     A	
027d	DCR     B	
027e	MOV     M,B	
027f	DCX     H	
0280	MOV     M,A	
0281	LXI     D,#$0010	
0284	DAD     D	
0285	JMP     #$024b	
0288	DCR     M	
0289	DCX     H	
028a	DCX     H	
028b	JMP     #$0281	
028e	POP     H	
028f	INX     H	
0290	MOV     A,M	
0291	CPI		#$ff	
0293	JZ      #$033b	
0296	INX     H	
0297	DCR     M	
0298	RNZ	
0299	MOV     B,A	
029a	XRA     A	
029b	STA     #$2068	
029e	STA     #$2069	
02a1	MVI     A,#$30	
02a3	STA     #$206a	
02a6	MOV     A,B	
02a7	MVI     M,#$05	
02a9	INX     H	
02aa	DCR     M	
02ab	JNZ     #$039b	
02ae	LHLD    #$201a	
02b1	MVI     B,#$10	
02b2	NOP	
02b3	CALL    #$1424	
02b6	LXI     H,#$2010	
02b9	LXI     D,#$1b10	
02bc	MVI     B,#$10	
02bd	NOP	
02be	CALL    #$1a32	
02c1	MVI     B,#$00	
02c2	NOP	
02c3	CALL    #$19dc	
02c6	LDA     #$206d	
02c9	ANA     A	
02ca	RNZ	
02cb	LDA     #$20ef	
02ce	ANA     A	
02cf	RZ	
02d0	LXI     SP, #$2400	
02d3	EI	
02d4	CALL    #$19d7	
02d7	CALL    #$092e	
02da	ANA     A	
02db	JZ      #$166d	
02de	CALL    #$18e7	
02e1	MOV     A,M	
02e2	ANA     A	
02e3	JZ      #$032c	
02e6	LDA     #$20ce	
02e9	ANA     A	
02ea	JZ      #$032c	
02ed	LDA     #$2067	
02f0	PUSH    PSW	
02f1	RRC	
02f2	JC      #$0332	
02f5	CALL    #$020e	
02f8	CALL    #$0878	
02fb	MOV     M,E	
02fc	INX     H	
02fd	MOV     M,D	
02fe	DCX     H	
02ff	DCX     H	
0300	MOV     M,B	
0301	NOP	
0302	CALL    #$01e4	
0305	POP     PSW	
0306	RRC	
0307	MVI     A,#$21	
0309	MVI     B,#$00	
030a	NOP	
030b	JNC     #$0312	
030e	MVI     B,#$20	
030f	RIM	
0310	MVI     A,#$22	
0312	STA     #$2067	
0315	CALL    #$0ab6	
0318	XRA     A	
0319	STA     #$2011	
031c	MOV     A,B	
031d	OUT     #$05	
031f	INR     A	
0320	STA     #$2098	
0323	CALL    #$09d6	
0326	CALL    #$1a7f	
0329	JMP     #$07f9	
032c	CALL    #$1a7f	
032f	JMP     #$0817	
0332	CALL    #$0209	
0335	JMP     #$02f8	
0338	NOP	
0339	NOP	
033a	NOP	
033b	LXI     H,#$2068	
033e	MVI     M,#$01	
0340	INX     H	
0341	MOV     A,M	
0342	ANA     A	
0343	JMP     #$03b0	
0346	NOP	
0347	DCX     H	
0348	MVI     M,#$01	
034a	LDA     #$201b	
034d	MOV     B,A	
034e	LDA     #$20ef	
0351	ANA     A	
0352	JNZ     #$0363	
0355	LDA     #$201d	
0358	RRC	
0359	JC      #$0381	
035c	RRC	
035d	JC      #$038e	
0360	JMP     #$036f	
0363	CALL    #$17c0	
0366	RLC	
0367	RLC	
0368	JC      #$0381	
036b	RLC	
036c	JC      #$038e	
036f	LXI     H,#$2018	
0372	CALL    #$1a3b	
0375	CALL    #$1a47	
0378	CALL    #$1439	
037b	MVI     A,#$00	
037d	STA     #$2012	
0380	RET	
0381	MOV     A,B	
0382	CPI		#$d9	
0384	JZ      #$036f	
0387	INR     A	
0388	STA     #$201b	
038b	JMP     #$036f	
038e	MOV     A,B	
038f	CPI		#$30	
0391	JZ      #$036f	
0394	DCR     A	
0395	STA     #$201b	
0398	JMP     #$036f	
039b	INR     A	
039c	ANI     #$01	
039f	DCR     D	
03a0	RIM	
03a1	RLC	
03a2	RLC	
03a3	RLC	
03a4	RLC	
03a5	LXI     H,#$1c70	
03a8	ADD     L	
03a9	MOV     L,A	
03aa	SHLD    $2018	
03ad	JMP     #$036f	
03b0	JNZ     #$034a	
03b3	INX     H	
03b4	DCR     M	
03b5	JNZ     #$034a	
03b8	JMP     #$0346	
03bb	LXI     D,#$202a	
03be	CALL    #$1a06	
03c1	POP     H	
03c2	RNC	    1	
03c3	INX     H	
03c4	MOV     A,M	
03c5	ANA     A	
03c6	RZ	
03c7	CPI		#$01	
03c9	JZ      #$03fa	
03cc	CPI		#$02	
03ce	JZ      #$040a	
03d1	INX     H	
03d2	CPI		#$03	
03d4	JNZ     #$042a	
03d7	DCR     M	
03d8	JZ      #$0436	
03db	MOV     A,M	
03dc	CPI		#$0f	
03de	RNZ	
03df	PUSH    H	
03e0	CALL    #$0430	
03e3	CALL    #$1452	
03e6	POP     H	
03e7	INX     H	
03e8	INR     M	
03e9	INX     H	
03ea	INX     H	
03eb	DCR     M	
03ec	DCR     M	
03ed	INX     H	
03ee	DCR     M	
03ef	DCR     M	
03f0	DCR     M	
03f1	INX     H	
03f2	MVI     M,#$08	
03f4	CALL    #$0430	
03f7	JMP     #$1400	
03fa	INR     A	
03fb	MOV     M,A	
03fc	LDA     #$201b	
03ff	ADI     #$08	
0400	NOP	
0401	STA     #$202a	
0404	CALL    #$0430	
0407	JMP     #$1400	
040a	CALL    #$0430	
040d	PUSH    D	
040e	PUSH    H	
040f	PUSH    B	
0410	CALL    #$1452	
0413	POP     B	
0414	POP     H	
0415	POP     D	
0416	LDA     #$202c	
0419	ADD     L	
041a	MOV     L,A	
041b	STA     #$2029	
041e	CALL    #$1491	
0421	LDA     #$2061	
0424	ANA     A	
0425	RZ	
0426	STA     #$2002	
0429	RET	
042a	CPI		#$05	
042c	RZ	
042d	JMP     #$0436	
0430	LXI     H,#$2027	
0433	JMP     #$1a3b	
0436	CALL    #$0430	
0439	CALL    #$1452	
043c	LXI     H,#$2025	
043f	LXI     D,#$1b25	
0442	MVI     B,#$07	
0443	RLC	
0444	CALL    #$1a32	
0447	LHLD    #$208d	
044a	INR     L	
044b	MOV     A,L	
044c	CPI		#$63	
044e	JC      #$0453	
0451	MVI     L, #$54	
0453	SHLD    $208d	
0456	LHLD    #$208f	
0459	INR     L	
045a	SHLD    $208f	
045d	LDA     #$2084	
0460	ANA     A	
0461	RNZ	
0462	MOV     A,M	
0463	ANI     #$01	
0466	DAD     H	
0467	STAX    B	
0468	JNZ     #$046e	
046b	LXI     B,#$fee0	
046e	LXI     H,#$208a	
0471	MOV     M,C	
0472	INX     H	
0473	INX     H	
0474	MOV     M,B	
0475	RET	
0476	POP     H	
0477	LDA     #$1b32	
047a	STA     #$2032	
047d	LHLD    #$2038	
0480	MOV     A,L	
0481	ORA     H	
0482	JNZ     #$048a	
0485	DCX     H	
0486	SHLD    $2038	
0489	RET	
048a	LXI     D,#$2035	
048d	MVI     A,#$f9	
048f	CALL    #$0550	
0492	LDA     #$2046	
0495	STA     #$2070	
0498	LDA     #$2056	
049b	STA     #$2071	
049e	CALL    #$0563	
04a1	LDA     #$2078	
04a4	ANA     A	
04a5	LXI     H,#$2035	
04a8	JNZ     #$055b	
04ab	LXI     D,#$1b30	
04ae	LXI     H,#$2030	
04b1	MVI     B,#$10	
04b2	NOP	
04b3	JMP     #$1a32	
04b6	POP     H	
04b7	LDA     #$206e	
04ba	ANA     A	
04bb	RNZ	
04bc	LDA     #$2080	
04bf	CPI		#$01	
04c1	RNZ	
04c2	LXI     D,#$2045	
04c5	MVI     A,#$ed	
04c7	CALL    #$0550	
04ca	LDA     #$2036	
04cd	STA     #$2070	
04d0	LDA     #$2056	
04d3	STA     #$2071	
04d6	CALL    #$0563	
04d9	LDA     #$2076	
04dc	CPI		#$10	
04de	JC      #$04e7	
04e1	LDA     #$1b48	
04e4	STA     #$2076	
04e7	LDA     #$2078	
04ea	ANA     A	
04eb	LXI     H,#$2045	
04ee	JNZ     #$055b	
04f1	LXI     D,#$1b40	
04f4	LXI     H,#$2040	
04f7	MVI     B,#$10	
04f8	NOP	
04f9	CALL    #$1a32	
04fc	LDA     #$2082	
04ff	DCR     A	
0500	JNZ     #$0508	
0503	MVI     A,#$01	
0505	STA     #$206e	
0508	LHLD    #$2076	
050b	JMP     #$067e	
050e	POP     H	
050f	LXI     D,#$2055	
0512	MVI     A,#$db	
0514	CALL    #$0550	
0517	LDA     #$2046	
051a	STA     #$2070	
051d	LDA     #$2036	
0520	STA     #$2071	
0523	CALL    #$0563	
0526	LDA     #$2076	
0529	CPI		#$15	
052b	JC      #$0534	
052e	LDA     #$1b58	
0531	STA     #$2076	
0534	LDA     #$2078	
0537	ANA     A	
0538	LXI     H,#$2055	
053b	JNZ     #$055b	
053e	LXI     D,#$1b50	
0541	LXI     H,#$2050	
0544	MVI     B,#$10	
0545	NOP	
0546	CALL    #$1a32	
0549	LHLD    #$2076	
054c	SHLD    $2058	
054f	RET	
0550	STA     #$207f	
0553	LXI     H,#$2073	
0556	MVI     B,#$0b	
0557	DCX     B	
0558	JMP     #$1a32	
055b	LXI     D,#$2073	
055e	MVI     B,#$0b	
055f	DCX     B	
0560	JMP     #$1a32	
0563	LXI     H,#$2073	
0566	MOV     A,M	
0567	ANI     #$80	
056a	POP     B	
056b	DCR     B	
056c	LDA     #$20c1	
056f	CPI		#$04	
0571	LDA     #$2069	
0574	JZ      #$05b7	
0577	ANA     A	
0578	RZ	
0579	INX     H	
057a	MVI     M,#$00	
057c	LDA     #$2070	
057f	ANA     A	
0580	JZ      #$0589	
0583	MOV     B,A	
0584	LDA     #$20cf	
0587	CMP     B	
0588	RNC	    1	
0589	LDA     #$2071	
058c	ANA     A	
058d	JZ      #$0596	
0590	MOV     B,A	
0591	LDA     #$20cf	
0594	CMP     B	
0595	RNC	    1	
0596	INX     H	
0597	MOV     A,M	
0598	ANA     A	
0599	JZ      #$061b	
059c	LHLD    #$2076	
059f	MOV     C,M	
05a0	INX     H	
05a1	NOP	
05a2	SHLD    $2076	
05a5	CALL    #$062f	
05a8	RNC	    1	
05a9	CALL    #$017a	
05ac	MOV     A,C	
05ad	ADI     #$07	
05ae	RLC	
05af	MOV     H,A	
05b0	MOV     A,L	
05b1	SUI     #$0a	
05b3	MOV     L,A	
05b4	SHLD    $207b	
05b7	LXI     H,#$2073	
05ba	MOV     A,M	
05bb	ORI     #$80	
05be	INX     H	
05bf	INR     M	
05c0	RET	
05c1	LXI     D,#$207c	
05c4	CALL    #$1a06	
05c7	RNC	    1	
05c8	INX     H	
05c9	MOV     A,M	
05ca	ANI     #$01	
05cd	MOV     B,H	
05ce	MVI     B,#$23	
05cf	INX     H	
05d0	INR     M	
05d1	CALL    #$0675	
05d4	LDA     #$2079	
05d7	ADI     #$03	
05d8	INX		B	
05d9	LXI     H,#$207f	
05dc	CMP     M	
05dd	JC      #$05e2	
05e0	SUI     #$0c	
05e2	STA     #$2079	
05e5	LDA     #$207b	
05e8	MOV     B,A	
05e9	LDA     #$207e	
05ec	ADD     B	
05ed	STA     #$207b	
05f0	CALL    #$066c	
05f3	LDA     #$207b	
05f6	CPI		#$15	
05f8	JC      #$0612	
05fb	LDA     #$2061	
05fe	ANA     A	
05ff	RZ	
0600	LDA     #$207b	
0603	CPI		#$1e	
0605	JC      #$0612	
0608	CPI		#$27	
060a	NOP	
060b	JNC     #$0612	
060e	SUB     A	
060f	STA     #$2015	
0612	LDA     #$2073	
0615	ORI     #$01	
0618	MOV     M,E	
0619	RIM	
061a	RET	
061b	LDA     #$201b	
061e	ADI     #$08	
061f	NOP	
0620	MOV     H,A	
0621	CALL    #$156f	
0624	MOV     A,C	
0625	CPI		#$0c	
0627	JC      #$05a5	
062a	MVI     C,#$0b	
062c	JMP     #$05a5	
062f	DCR     C	
0630	LDA     #$2067	
0633	MOV     H,A	
0634	MOV     L,C	
0635	MVI     D,#$05	
0637	MOV     A,M	
0638	ANA     A	
0639	STC	
063a	RNZ	
063b	MOV     A,L	
063c	ADI     #$0b	
063d	DCX     B	
063e	MOV     L,A	
063f	DCR     D	
0640	JNZ     #$0637	
0643	RET	
0644	LXI     H,#$2078	
0647	DCR     M	
0648	MOV     A,M	
0649	CPI		#$03	
064b	JNZ     #$0667	
064e	CALL    #$0675	
0651	LXI     H,#$1cdc	
0654	SHLD    $2079	
0657	LXI     H,#$207c	
065a	DCR     M	
065b	DCR     M	
065c	DCX     H	
065d	DCR     M	
065e	DCR     M	
065f	MVI     A,#$06	
0661	STA     #$207d	
0664	JMP     #$066c	
0667	ANA     A	
0668	RNZ	
0669	JMP     #$0675	
066c	LXI     H,#$2079	
066f	CALL    #$1a3b	
0672	JMP     #$1491	
0675	LXI     H,#$2079	
0678	CALL    #$1a3b	
067b	JMP     #$1452	
067e	SHLD    $2048	
0681	RET	
0682	POP     H	
0683	LDA     #$2080	
0686	CPI		#$02	
0688	RNZ	
0689	LXI     H,#$2083	
068c	MOV     A,M	
068d	ANA     A	
068e	JZ      #$050f	
0691	LDA     #$2056	
0694	ANA     A	
0695	JNZ     #$050f	
0698	INX     H	
0699	MOV     A,M	
069a	ANA     A	
069b	JNZ     #$06ab	
069e	LDA     #$2082	
06a1	CPI		#$08	
06a3	JC      #$050f	
06a6	MVI     M,#$01	
06a8	CALL    #$073c	
06ab	LXI     D,#$208a	
06ae	CALL    #$1a06	
06b1	RNC	    1	
06b2	LXI     H,#$2085	
06b5	MOV     A,M	
06b6	ANA     A	
06b7	JNZ     #$06d6	
06ba	LXI     H,#$208a	
06bd	MOV     A,M	
06be	INX     H	
06bf	INX     H	
06c0	ADD     M	
06c1	STA     #$208a	
06c4	CALL    #$073c	
06c7	LXI     H,#$208a	
06ca	MOV     A,M	
06cb	CPI		#$28	
06cd	JC      #$06f9	
06d0	CPI		#$e1	
06d2	JNC     #$06f9	
06d5	RET	
06d6	MVI     B,#$fe	
06d7	CPI		#$cd	
06d9	CC      #$2319	
06dc	DCR     M	
06dd	MOV     A,M	
06de	CPI		#$1f	
06e0	JZ      #$074b	
06e3	CPI		#$18	
06e5	JZ      #$070c	
06e8	ANA     A	
06e9	RNZ	
06ea	MVI     B,#$ef	
06eb	RST     5	
06ec	LXI     H,#$2098	
06ef	MOV     A,M	
06f0	ANA     B	
06f1	MOV     M,A	
06f2	ANI     #$20	
06f5	DCR     B	
06f6	NOP	
06f7	NOP	
06f8	NOP	
06f9	CALL    #$0742	
06fc	CALL    #$14cb	
06ff	LXI     H,#$2083	
0702	MVI     B,#$0a	
0703	LDAX	
0704	CALL    #$075f	
0707	MVI     B,#$fe	
0708	CPI		#$c3	
070a	CC      #$3e19	
070d	LXI     B,#$f132	
0710	RIM	
0711	LHLD    #$208d	
0714	MOV     B,M	
0715	MVI     C,#$04	
0717	LXI     H,#$1d50	
071a	LXI     D,#$1d4c	
071d	LDAX    D	
071e	CMP     B	
071f	JZ      #$0728	
0722	INX     H	
0723	INX     D	
0724	DCR     C	
0725	JNZ     #$071d	
0728	MOV     A,M	
0729	STA     #$2087	
072c	MVI     H,#$00	
072d	NOP	
072e	MOV     L,B	
072f	DAD     H	
0730	DAD     H	
0731	DAD     H	
0732	DAD     H	
0733	SHLD    $20f2	
0736	CALL    #$0742	
0739	JMP     #$08f1	
073c	CALL    #$0742	
073f	JMP     #$1439	
0742	LXI     H,#$2087	
0745	CALL    #$1a3b	
0748	JMP     #$1a47	
074b	MVI     B,#$10	
074c	NOP	
074d	LXI     H,#$2098	
0750	MOV     A,M	
0751	ORA     B	
0752	MOV     M,A	
0753	CALL    #$1770	
0756	LXI     H,#$1d7c	
0759	SHLD    $2087	
075c	JMP     #$073c	
075f	LXI     D,#$1b83	
0762	JMP     #$1a32	
0765	MVI     A,#$01	
0767	STA     #$2093	
076a	LXI     SP, #$2400	
076d	EI	
076e	CALL    #$1979	
0771	CALL    #$09d6	
0774	LXI     H,#$3013	
0777	LXI     D,#$1ff3	
077a	MVI     C,#$04	
077c	CALL    #$08f3	
077f	LDA     #$20eb	
0782	DCR     A	
0783	LXI     H,#$2810	
0786	MVI     C,#$14	
0788	JNZ     #$0857	
078b	LXI     D,#$1acf	
078e	CALL    #$08f3	
0791	IN      #$01	
0793	ANI     #$04	
0796	MOV     A,A	
0797	RLC	
0798	MVI     B,#$99	
0799	SBB     C	
079a	XRA     A	
079b	STA     #$20ce	
079e	LDA     #$20eb	
07a1	ADD     B	
07a2	DAA	
07a3	STA     #$20eb	
07a6	CALL    #$1947	
07a9	LXI     H,#$0000	
07ac	SHLD    $20f8	
07af	SHLD    $20fc	
07b2	CALL    #$1925	
07b5	CALL    #$192b	
07b8	CALL    #$19d7	
07bb	LXI     H,#$0101	
07be	MOV     A,H	
07bf	STA     #$20ef	
07c2	SHLD    $20e7	
07c5	SHLD    $20e5	
07c8	CALL    #$1956	
07cb	CALL    #$01ef	
07ce	CALL    #$01f5	
07d1	CALL    #$08d1	
07d4	STA     #$21ff	
07d7	STA     #$22ff	
07da	CALL    #$00d7	
07dd	XRA     A	
07de	STA     #$21fe	
07e1	STA     #$22fe	
07e4	CALL    #$01c0	
07e7	CALL    #$1904	
07ea	LXI     H,#$3878	
07ed	SHLD    $21fc	
07f0	SHLD    $22fc	
07f3	CALL    #$01e4	
07f6	CALL    #$1a7f	
07f9	CALL    #$088d	
07fc	CALL    #$09d6	
07ff	NOP	
0800	XRA     A	
0801	STA     #$20c1	
0804	CALL    #$01cf	
0807	LDA     #$2067	
080a	RRC	
080b	JC      #$0872	
080e	CALL    #$0213	
0811	CALL    #$01cf	
0814	CALL    #$00b1	
0817	CALL    #$19d1	
081a	MVI     B,#$20	
081b	RIM	
081c	CALL    #$18fa	
081f	CALL    #$1618	
0822	CALL    #$190a	
0825	CALL    #$15f3	
0828	CALL    #$0988	
082b	LDA     #$2082	
082e	ANA     A	
082f	JZ      #$09ef	
0832	CALL    #$170e	
0835	CALL    #$0935	
0838	CALL    #$08d8	
083b	CALL    #$172c	
083e	CALL    #$0a59	
0841	JZ      #$0849	
0844	MVI     B,#$04	
0845	INR     B	
0846	CALL    #$18fa	
0849	CALL    #$1775	
084c	OUT     #$06	
084e	CALL    #$1804	
0851	JMP     #$081f	
0854	NOP	
0855	NOP	
0856	NOP	
0857	LXI     D,#$1aba	
085a	CALL    #$08f3	
085d	MVI     B,#$98	
085e	SBB     B	
085f	IN      #$01	
0861	RRC	
0862	RRC	
0863	JC      #$086d	
0866	RRC	
0867	JC      #$0798	
086a	JMP     #$077f	
086d	MVI     A,#$01	
086f	JMP     #$079b	
0872	CALL    #$021a	
0875	JMP     #$0814	
0878	LDA     #$2008	
087b	MOV     B,A	
087c	LHLD    #$2009	
087f	XCHG	
0880	JMP     #$0886	
0883	NOP	
0884	NOP	
0885	NOP	
0886	LDA     #$2067	
0889	MOV     H,A	
088a	MVI     L, #$fc	
088c	RET	
088d	LXI     H,#$2b11	
0890	LXI     D,#$1b70	
0893	MVI     C,#$0e	
0895	CALL    #$08f3	
0898	LDA     #$2067	
089b	RRC	
089c	MVI     A,#$1c	
089e	LXI     H,#$3711	
08a1	CNC     #$08ff	
08a4	MVI     A,#$b0	
08a6	STA     #$20c0	
08a9	LDA     #$20c0	
08ac	ANA     A	
08ad	RZ	
08ae	ANI     #$04	
08b1	CMP     H	
08b2	NOP	
08b3	CALL    #$09ca	
08b6	CALL    #$1931	
08b9	JMP     #$08a9	
08bc	MVI     B,#$20	
08bd	RIM	
08be	LXI     H,#$271c	
08c1	LDA     #$2067	
08c4	RRC	
08c5	JC      #$08cb	
08c8	LXI     H,#$391c	
08cb	CALL    #$14cb	
08ce	JMP     #$08a9	
08d1	IN      #$02	
08d3	ANI     #$03	
08d6	INX		B	
08d7	RET	
08d8	LDA     #$2082	
08db	CPI		#$09	
08dd	RNC	    1	
08de	MVI     A,#$fb	
08e0	STA     #$207e	
08e3	RET	
08e4	LDA     #$20ce	
08e7	ANA     A	
08e8	RNZ	
08e9	LXI     H,#$391c	
08ec	MVI     B,#$20	
08ed	RIM	
08ee	JMP     #$14cb	
08f1	MVI     C,#$03	
08f3	LDAX    D	
08f4	PUSH    D	
08f5	CALL    #$08ff	
08f8	POP     D	
08f9	INX     D	
08fa	DCR     C	
08fb	JNZ     #$08f3	
08fe	RET	
08ff	LXI     D,#$1e00	
0902	PUSH    H	
0903	MVI     H,#$00	
0904	NOP	
0905	MOV     L,A	
0906	DAD     H	
0907	DAD     H	
0908	DAD     H	
0909	DAD     D	
090a	XCHG	
090b	POP     H	
090c	MVI     B,#$08	
090d	NOP	
090e	OUT     #$06	
0910	JMP     #$1439	
0913	LDA     #$2009	
0916	CPI		#$78	
0918	RNC	    1	
0919	LHLD    #$2091	
091c	MOV     A,L	
091d	ORA     H	
091e	JNZ     #$0929	
0921	LXI     H,#$0600	
0924	MVI     A,#$01	
0926	STA     #$2083	
0929	DCX     H	
092a	SHLD    $2091	
092d	RET	
092e	CALL    #$1611	
0931	MVI     L, #$ff	
0933	MOV     A,M	
0934	RET	
0935	CALL    #$1910	
0938	DCX     H	
0939	DCX     H	
093a	MOV     A,M	
093b	ANA     A	
093c	RZ	
093d	MVI     B,#$15	
093e	DCR     D	
093f	IN      #$02	
0941	ANI     #$08	
0944	MOV     C,B	
0945	DAD	
0946	MVI     B,#$10	
0947	NOP	
0948	CALL    #$09ca	
094b	INX     H	
094c	MOV     A,M	
094d	CMP     B	
094e	RC	
094f	CALL    #$092e	
0952	INR     M	
0953	MOV     A,M	
0954	PUSH    PSW	
0955	LXI     H,#$2501	
0958	INR     H	
0959	INR     H	
095a	DCR     A	
095b	JNZ     #$0958	
095e	MVI     B,#$10	
095f	NOP	
0960	LXI     D,#$1c60	
0963	CALL    #$1439	
0966	POP     PSW	
0967	INR     A	
0968	CALL    #$1a8b	
096b	CALL    #$1910	
096e	DCX     H	
096f	DCX     H	
0970	MVI     M,#$00	
0972	MVI     A,#$ff	
0974	STA     #$2099	
0977	MVI     B,#$10	
0978	NOP	
0979	JMP     #$18fa	
097c	LXI     H,#$1da0	
097f	CPI		#$02	
0981	RC	
0982	INX     H	
0983	CPI		#$04	
0985	RC	
0986	INX     H	
0987	RET	
0988	CALL    #$09ca	
098b	LDA     #$20f1	
098e	ANA     A	
098f	RZ	
0990	XRA     A	
0991	STA     #$20f1	
0994	PUSH    H	
0995	LHLD    #$20f2	
0998	XCHG	
0999	POP     H	
099a	MOV     A,M	
099b	ADD     E	
099c	DAA	
099d	MOV     M,A	
099e	MOV     E,A	
099f	INX     H	
09a0	MOV     A,M	
09a1	ADC     D	
09a2	DAA	
09a3	MOV     M,A	
09a4	MOV     D,A	
09a5	INX     H	
09a6	MOV     A,M	
09a7	INX     H	
09a8	MOV     H,M	
09a9	MOV     L,A	
09aa	JMP     #$09ad	
09ad	MOV     A,D	
09ae	CALL    #$09b2	
09b1	MOV     A,E	
09b2	PUSH    D	
09b3	PUSH    PSW	
09b4	RRC	
09b5	RRC	
09b6	RRC	
09b7	RRC	
09b8	ANI     #$0f	
09bb	PUSH    B	
09bc	DAD	
09bd	POP     PSW	
09be	ANI     #$0f	
09c1	PUSH    B	
09c2	DAD	
09c3	POP     D	
09c4	RET	
09c5	ADI     #$1a	
09c6	LDAX    D	
09c7	JMP     #$08ff	
09ca	LDA     #$2067	
09cd	RRC	
09ce	LXI     H,#$20f8	
09d1	RC	
09d2	LXI     H,#$20fc	
09d5	RET	
09d6	LXI     H,#$2402	
09d9	MVI     M,#$00	
09db	INX     H	
09dc	MOV     A,L	
09dd	ANI     #$1f	
09e0	INR     E	
09e1	JC      #$09e8	
09e4	LXI     D,#$0006	
09e7	DAD     D	
09e8	MOV     A,H	
09e9	CPI		#$40	
09eb	JC      #$09d9	
09ee	RET	
09ef	CALL    #$0a3c	
09f2	XRA     A	
09f3	STA     #$20e9	
09f6	CALL    #$09d6	
09f9	LDA     #$2067	
09fc	PUSH    PSW	
09fd	CALL    #$01e4	
0a00	POP     PSW	
0a01	STA     #$2067	
0a04	LDA     #$2067	
0a07	MOV     H,A	
0a08	PUSH    H	
0a09	MVI     L, #$fe	
0a0b	MOV     A,M	
0a0c	ANI     #$07	
0a0f	MOV     M,A	
0a10	LXI     H,#$1da2	
0a13	INX     H	
0a14	DCR     A	
0a15	JNZ     #$0a13	
0a18	MOV     A,M	
0a19	POP     H	
0a1a	MVI     L, #$fc	
0a1c	MOV     M,A	
0a1d	INX     H	
0a1e	MVI     M,#$38	
0a20	MOV     A,H	
0a21	RRC	
0a22	JC      #$0a33	
0a25	MVI     A,#$21	
0a27	STA     #$2098	
0a2a	CALL    #$01f5	
0a2d	CALL    #$1904	
0a30	JMP     #$0804	
0a33	CALL    #$01ef	
0a36	CALL    #$01c0	
0a39	JMP     #$0804	
0a3c	CALL    #$0a59	
0a3f	JNZ     #$0a52	
0a42	MVI     A,#$30	
0a44	STA     #$20c0	
0a47	LDA     #$20c0	
0a4a	ANA     A	
0a4b	RZ	
0a4c	CALL    #$0a59	
0a4f	JZ      #$0a47	
0a52	CALL    #$0a59	
0a55	JNZ     #$0a52	
0a58	RET	
0a59	LDA     #$2015	
0a5c	CPI		#$ff	
0a5e	RET	
0a5f	LDA     #$20ef	
0a62	ANA     A	
0a63	JZ      #$0a7c	
0a66	MOV     C,B	
0a67	MVI     B,#$08	
0a68	NOP	
0a69	CALL    #$18fa	
0a6c	MOV     B,C	
0a6d	MOV     A,B	
0a6e	CALL    #$097c	
0a71	MOV     A,M	
0a72	LXI     H,#$20f3	
0a75	MVI     M,#$00	
0a77	DCX     H	
0a78	MOV     M,A	
0a79	DCX     H	
0a7a	MVI     M,#$01	
0a7c	LXI     H,#$2062	
0a7f	RET	
0a80	MVI     A,#$02	
0a82	STA     #$20c1	
0a85	OUT     #$06	
0a87	LDA     #$20cb	
0a8a	ANA     A	
0a8b	JZ      #$0a85	
0a8e	XRA     A	
0a8f	STA     #$20c1	
0a92	RET	
0a93	PUSH    D	
0a94	LDAX    D	
0a95	CALL    #$08ff	
0a98	POP     D	
0a99	MVI     A,#$07	
0a9b	STA     #$20c0	
0a9e	LDA     #$20c0	
0aa1	DCR     A	
0aa2	JNZ     #$0a9e	
0aa5	INX     D	
0aa6	DCR     C	
0aa7	JNZ     #$0a93	
0aaa	RET	
0aab	LXI     H,#$2050	
0aae	JMP     #$024b	
0ab1	MVI     A,#$40	
0ab3	JMP     #$0ad7	
0ab6	MVI     A,#$80	
0ab8	JMP     #$0ad7	
0abb	POP     H	
0abc	JMP     #$0072	
0abf	LDA     #$20c1	
0ac2	RRC	
0ac3	JC      #$0abb	
0ac6	RRC	
0ac7	JC      #$1868	
0aca	RRC	
0acb	JC      #$0aab	
0ace	RET	
0acf	LXI     H,#$2b14	
0ad2	MVI     C,#$0f	
0ad4	JMP     #$0a93	
0ad7	STA     #$20c0	
0ada	LDA     #$20c0	
0add	ANA     A	
0ade	JNZ     #$0ada	
0ae1	RET	
0ae2	LXI     H,#$20c2	
0ae5	MVI     B,#$0c	
0ae6	INR     C	
0ae7	JMP     #$1a32	
0aea	XRA     A	
0aeb	OUT     #$03	
0aed	OUT     #$05	
0aef	CALL    #$1982	
0af2	EI	
0af3	CALL    #$0ab1	
0af6	LDA     #$20ec	
0af9	ANA     A	
0afa	LXI     H,#$3017	
0afd	MVI     C,#$04	
0aff	JNZ     #$0be8	
0b02	LXI     D,#$1cfa	
0b05	CALL    #$0a93	
0b08	LXI     D,#$1daf	
0b0b	CALL    #$0acf	
0b0e	CALL    #$0ab1	
0b11	CALL    #$1815	
0b14	CALL    #$0ab6	
0b17	LDA     #$20ec	
0b1a	ANA     A	
0b1b	JNZ     #$0b4a	
0b1e	LXI     D,#$1a95	
0b21	CALL    #$0ae2	
0b24	CALL    #$0a80	
0b27	LXI     D,#$1bb0	
0b2a	CALL    #$0ae2	
0b2d	CALL    #$0a80	
0b30	CALL    #$0ab1	
0b33	LXI     D,#$1fc9	
0b36	CALL    #$0ae2	
0b39	CALL    #$0a80	
0b3c	CALL    #$0ab1	
0b3f	LXI     H,#$33b7	
0b42	MVI     B,#$0a	
0b43	LDAX	
0b44	CALL    #$14cb	
0b47	CALL    #$0ab6	
0b4a	CALL    #$09d6	
0b4d	LDA     #$21ff	
0b50	ANA     A	
0b51	JNZ     #$0b5d	
0b54	CALL    #$08d1	
0b57	STA     #$21ff	
0b5a	CALL    #$1a7f	
0b5d	CALL    #$01e4	
0b60	CALL    #$01c0	
0b63	CALL    #$01ef	
0b66	CALL    #$021a	
0b69	MVI     A,#$01	
0b6b	STA     #$20c1	
0b6e	CALL    #$01cf	
0b71	CALL    #$1618	
0b74	CALL    #$0bf1	
0b77	OUT     #$06	
0b79	CALL    #$0a59	
0b7c	JZ      #$0b71	
0b7f	XRA     A	
0b80	STA     #$2025	
0b83	CALL    #$0a59	
0b86	JNZ     #$0b83	
0b89	XRA     A	
0b8a	STA     #$20c1	
0b8d	CALL    #$0ab1	
0b90	CALL    #$1988	
0b93	MVI     C,#$0c	
0b95	LXI     H,#$2c11	
0b98	LXI     D,#$1f90	
0b9b	CALL    #$08f3	
0b9e	LDA     #$20ec	
0ba1	CPI		#$00	
0ba3	JNZ     #$0bae	
0ba6	LXI     H,#$3311	
0ba9	MVI     A,#$02	
0bab	CALL    #$08ff	
0bae	LXI     B,#$1f9c	
0bb1	CALL    #$1856	
0bb4	CALL    #$184c	
0bb7	IN      #$02	
0bb9	RLC	
0bba	JC      #$0bc3	
0bbd	LXI     B,#$1fa0	
0bc0	CALL    #$183a	
0bc3	CALL    #$0ab6	
0bc6	LDA     #$20ec	
0bc9	CPI		#$00	
0bcb	JNZ     #$0bda	
0bce	LXI     D,#$1fd5	
0bd1	CALL    #$0ae2	
0bd4	CALL    #$0a80	
0bd7	CALL    #$189e	
0bda	LXI     H,#$20ec	
0bdd	MOV     A,M	
0bde	INR     A	
0bdf	ANI     #$01	
0be2	CALL    #$09d6	
0be5	JMP     #$18df	
0be8	LXI     D,#$1dab	
0beb	CALL    #$0a93	
0bee	JMP     #$0b0b	
0bf1	CALL    #$190a	
0bf4	JMP     #$199a	
0bf7	INX     D	
0bf8	NOP	
0bf9	NOP	
0bfa	INX     D	
0bfb	MVI     C,#$26	
0bfd	STAX    B	
0bfe	MVI     C,#$0f	
0c00	NOP	
0c01	NOP	
0c02	NOP	
0c03	NOP	
0c04	NOP	
0c05	NOP	
0c06	NOP	
0c07	NOP	
0c08	NOP	
0c09	NOP	
0c0a	NOP	
0c0b	NOP	
0c0c	NOP	
0c0d	NOP	
0c0e	NOP	
0c0f	NOP	
0c10	NOP	
0c11	NOP	
0c12	NOP	
0c13	NOP	
0c14	NOP	
0c15	NOP	
0c16	NOP	
0c17	NOP	
0c18	NOP	
0c19	NOP	
0c1a	NOP	
0c1b	NOP	
0c1c	NOP	
0c1d	NOP	
0c1e	NOP	
0c1f	NOP	
0c20	NOP	
0c21	NOP	
0c22	NOP	
0c23	NOP	
0c24	NOP	
0c25	NOP	
0c26	NOP	
0c27	NOP	
0c28	NOP	
0c29	NOP	
0c2a	NOP	
0c2b	NOP	
0c2c	NOP	
0c2d	NOP	
0c2e	NOP	
0c2f	NOP	
0c30	NOP	
0c31	NOP	
0c32	NOP	
0c33	NOP	
0c34	NOP	
0c35	NOP	
0c36	NOP	
0c37	NOP	
0c38	NOP	
0c39	NOP	
0c3a	NOP	
0c3b	NOP	
0c3c	NOP	
0c3d	NOP	
0c3e	NOP	
0c3f	NOP	
0c40	NOP	
0c41	NOP	
0c42	NOP	
0c43	NOP	
0c44	NOP	
0c45	NOP	
0c46	NOP	
0c47	NOP	
0c48	NOP	
0c49	NOP	
0c4a	NOP	
0c4b	NOP	
0c4c	NOP	
0c4d	NOP	
0c4e	NOP	
0c4f	NOP	
0c50	NOP	
0c51	NOP	
0c52	NOP	
0c53	NOP	
0c54	NOP	
0c55	NOP	
0c56	NOP	
0c57	NOP	
0c58	NOP	
0c59	NOP	
0c5a	NOP	
0c5b	NOP	
0c5c	NOP	
0c5d	NOP	
0c5e	NOP	
0c5f	NOP	
0c60	NOP	
0c61	NOP	
0c62	NOP	
0c63	NOP	
0c64	NOP	
0c65	NOP	
0c66	NOP	
0c67	NOP	
0c68	NOP	
0c69	NOP	
0c6a	NOP	
0c6b	NOP	
0c6c	NOP	
0c6d	NOP	
0c6e	NOP	
0c6f	NOP	
0c70	NOP	
0c71	NOP	
0c72	NOP	
0c73	NOP	
0c74	NOP	
0c75	NOP	
0c76	NOP	
0c77	NOP	
0c78	NOP	
0c79	NOP	
0c7a	NOP	
0c7b	NOP	
0c7c	NOP	
0c7d	NOP	
0c7e	NOP	
0c7f	NOP	
0c80	NOP	
0c81	NOP	
0c82	NOP	
0c83	NOP	
0c84	NOP	
0c85	NOP	
0c86	NOP	
0c87	NOP	
0c88	NOP	
0c89	NOP	
0c8a	NOP	
0c8b	NOP	
0c8c	NOP	
0c8d	NOP	
0c8e	NOP	
0c8f	NOP	
0c90	NOP	
0c91	NOP	
0c92	NOP	
0c93	NOP	
0c94	NOP	
0c95	NOP	
0c96	NOP	
0c97	NOP	
0c98	NOP	
0c99	NOP	
0c9a	NOP	
0c9b	NOP	
0c9c	NOP	
0c9d	NOP	
0c9e	NOP	
0c9f	NOP	
0ca0	NOP	
0ca1	NOP	
0ca2	NOP	
0ca3	NOP	
0ca4	NOP	
0ca5	NOP	
0ca6	NOP	
0ca7	NOP	
0ca8	NOP	
0ca9	NOP	
0caa	NOP	
0cab	NOP	
0cac	NOP	
0cad	NOP	
0cae	NOP	
0caf	NOP	
0cb0	NOP	
0cb1	NOP	
0cb2	NOP	
0cb3	NOP	
0cb4	NOP	
0cb5	NOP	
0cb6	NOP	
0cb7	NOP	
0cb8	NOP	
0cb9	NOP	
0cba	NOP	
0cbb	NOP	
0cbc	NOP	
0cbd	NOP	
0cbe	NOP	
0cbf	NOP	
0cc0	NOP	
0cc1	NOP	
0cc2	NOP	
0cc3	NOP	
0cc4	NOP	
0cc5	NOP	
0cc6	NOP	
0cc7	NOP	
0cc8	NOP	
0cc9	NOP	
0cca	NOP	
0ccb	NOP	
0ccc	NOP	
0ccd	NOP	
0cce	NOP	
0ccf	NOP	
0cd0	NOP	
0cd1	NOP	
0cd2	NOP	
0cd3	NOP	
0cd4	NOP	
0cd5	NOP	
0cd6	NOP	
0cd7	NOP	
0cd8	NOP	
0cd9	NOP	
0cda	NOP	
0cdb	NOP	
0cdc	NOP	
0cdd	NOP	
0cde	NOP	
0cdf	NOP	
0ce0	NOP	
0ce1	NOP	
0ce2	NOP	
0ce3	NOP	
0ce4	NOP	
0ce5	NOP	
0ce6	NOP	
0ce7	NOP	
0ce8	NOP	
0ce9	NOP	
0cea	NOP	
0ceb	NOP	
0cec	NOP	
0ced	NOP	
0cee	NOP	
0cef	NOP	
0cf0	NOP	
0cf1	NOP	
0cf2	NOP	
0cf3	NOP	
0cf4	NOP	
0cf5	NOP	
0cf6	NOP	
0cf7	NOP	
0cf8	NOP	
0cf9	NOP	
0cfa	NOP	
0cfb	NOP	
0cfc	NOP	
0cfd	NOP	
0cfe	NOP	
0cff	NOP	
0d00	NOP	
0d01	NOP	
0d02	NOP	
0d03	NOP	
0d04	NOP	
0d05	NOP	
0d06	NOP	
0d07	NOP	
0d08	NOP	
0d09	NOP	
0d0a	NOP	
0d0b	NOP	
0d0c	NOP	
0d0d	NOP	
0d0e	NOP	
0d0f	NOP	
0d10	NOP	
0d11	NOP	
0d12	NOP	
0d13	NOP	
0d14	NOP	
0d15	NOP	
0d16	NOP	
0d17	NOP	
0d18	NOP	
0d19	NOP	
0d1a	NOP	
0d1b	NOP	
0d1c	NOP	
0d1d	NOP	
0d1e	NOP	
0d1f	NOP	
0d20	NOP	
0d21	NOP	
0d22	NOP	
0d23	NOP	
0d24	NOP	
0d25	NOP	
0d26	NOP	
0d27	NOP	
0d28	NOP	
0d29	NOP	
0d2a	NOP	
0d2b	NOP	
0d2c	NOP	
0d2d	NOP	
0d2e	NOP	
0d2f	NOP	
0d30	NOP	
0d31	NOP	
0d32	NOP	
0d33	NOP	
0d34	NOP	
0d35	NOP	
0d36	NOP	
0d37	NOP	
0d38	NOP	
0d39	NOP	
0d3a	NOP	
0d3b	NOP	
0d3c	NOP	
0d3d	NOP	
0d3e	NOP	
0d3f	NOP	
0d40	NOP	
0d41	NOP	
0d42	NOP	
0d43	NOP	
0d44	NOP	
0d45	NOP	
0d46	NOP	
0d47	NOP	
0d48	NOP	
0d49	NOP	
0d4a	NOP	
0d4b	NOP	
0d4c	NOP	
0d4d	NOP	
0d4e	NOP	
0d4f	NOP	
0d50	NOP	
0d51	NOP	
0d52	NOP	
0d53	NOP	
0d54	NOP	
0d55	NOP	
0d56	NOP	
0d57	NOP	
0d58	NOP	
0d59	NOP	
0d5a	NOP	
0d5b	NOP	
0d5c	NOP	
0d5d	NOP	
0d5e	NOP	
0d5f	NOP	
0d60	NOP	
0d61	NOP	
0d62	NOP	
0d63	NOP	
0d64	NOP	
0d65	NOP	
0d66	NOP	
0d67	NOP	
0d68	NOP	
0d69	NOP	
0d6a	NOP	
0d6b	NOP	
0d6c	NOP	
0d6d	NOP	
0d6e	NOP	
0d6f	NOP	
0d70	NOP	
0d71	NOP	
0d72	NOP	
0d73	NOP	
0d74	NOP	
0d75	NOP	
0d76	NOP	
0d77	NOP	
0d78	NOP	
0d79	NOP	
0d7a	NOP	
0d7b	NOP	
0d7c	NOP	
0d7d	NOP	
0d7e	NOP	
0d7f	NOP	
0d80	NOP	
0d81	NOP	
0d82	NOP	
0d83	NOP	
0d84	NOP	
0d85	NOP	
0d86	NOP	
0d87	NOP	
0d88	NOP	
0d89	NOP	
0d8a	NOP	
0d8b	NOP	
0d8c	NOP	
0d8d	NOP	
0d8e	NOP	
0d8f	NOP	
0d90	NOP	
0d91	NOP	
0d92	NOP	
0d93	NOP	
0d94	NOP	
0d95	NOP	
0d96	NOP	
0d97	NOP	
0d98	NOP	
0d99	NOP	
0d9a	NOP	
0d9b	NOP	
0d9c	NOP	
0d9d	NOP	
0d9e	NOP	
0d9f	NOP	
0da0	NOP	
0da1	NOP	
0da2	NOP	
0da3	NOP	
0da4	NOP	
0da5	NOP	
0da6	NOP	
0da7	NOP	
0da8	NOP	
0da9	NOP	
0daa	NOP	
0dab	NOP	
0dac	NOP	
0dad	NOP	
0dae	NOP	
0daf	NOP	
0db0	NOP	
0db1	NOP	
0db2	NOP	
0db3	NOP	
0db4	NOP	
0db5	NOP	
0db6	NOP	
0db7	NOP	
0db8	NOP	
0db9	NOP	
0dba	NOP	
0dbb	NOP	
0dbc	NOP	
0dbd	NOP	
0dbe	NOP	
0dbf	NOP	
0dc0	NOP	
0dc1	NOP	
0dc2	NOP	
0dc3	NOP	
0dc4	NOP	
0dc5	NOP	
0dc6	NOP	
0dc7	NOP	
0dc8	NOP	
0dc9	NOP	
0dca	NOP	
0dcb	NOP	
0dcc	NOP	
0dcd	NOP	
0dce	NOP	
0dcf	NOP	
0dd0	NOP	
0dd1	NOP	
0dd2	NOP	
0dd3	NOP	
0dd4	NOP	
0dd5	NOP	
0dd6	NOP	
0dd7	NOP	
0dd8	NOP	
0dd9	NOP	
0dda	NOP	
0ddb	NOP	
0ddc	NOP	
0ddd	NOP	
0dde	NOP	
0ddf	NOP	
0de0	NOP	
0de1	NOP	
0de2	NOP	
0de3	NOP	
0de4	NOP	
0de5	NOP	
0de6	NOP	
0de7	NOP	
0de8	NOP	
0de9	NOP	
0dea	NOP	
0deb	NOP	
0dec	NOP	
0ded	NOP	
0dee	NOP	
0def	NOP	
0df0	NOP	
0df1	NOP	
0df2	NOP	
0df3	NOP	
0df4	NOP	
0df5	NOP	
0df6	NOP	
0df7	NOP	
0df8	NOP	
0df9	NOP	
0dfa	NOP	
0dfb	NOP	
0dfc	NOP	
0dfd	NOP	
0dfe	NOP	
0dff	NOP	
0e00	NOP	
0e01	NOP	
0e02	NOP	
0e03	NOP	
0e04	NOP	
0e05	NOP	
0e06	NOP	
0e07	NOP	
0e08	NOP	
0e09	NOP	
0e0a	NOP	
0e0b	NOP	
0e0c	NOP	
0e0d	NOP	
0e0e	NOP	
0e0f	NOP	
0e10	NOP	
0e11	NOP	
0e12	NOP	
0e13	NOP	
0e14	NOP	
0e15	NOP	
0e16	NOP	
0e17	NOP	
0e18	NOP	
0e19	NOP	
0e1a	NOP	
0e1b	NOP	
0e1c	NOP	
0e1d	NOP	
0e1e	NOP	
0e1f	NOP	
0e20	NOP	
0e21	NOP	
0e22	NOP	
0e23	NOP	
0e24	NOP	
0e25	NOP	
0e26	NOP	
0e27	NOP	
0e28	NOP	
0e29	NOP	
0e2a	NOP	
0e2b	NOP	
0e2c	NOP	
0e2d	NOP	
0e2e	NOP	
0e2f	NOP	
0e30	NOP	
0e31	NOP	
0e32	NOP	
0e33	NOP	
0e34	NOP	
0e35	NOP	
0e36	NOP	
0e37	NOP	
0e38	NOP	
0e39	NOP	
0e3a	NOP	
0e3b	NOP	
0e3c	NOP	
0e3d	NOP	
0e3e	NOP	
0e3f	NOP	
0e40	NOP	
0e41	NOP	
0e42	NOP	
0e43	NOP	
0e44	NOP	
0e45	NOP	
0e46	NOP	
0e47	NOP	
0e48	NOP	
0e49	NOP	
0e4a	NOP	
0e4b	NOP	
0e4c	NOP	
0e4d	NOP	
0e4e	NOP	
0e4f	NOP	
0e50	NOP	
0e51	NOP	
0e52	NOP	
0e53	NOP	
0e54	NOP	
0e55	NOP	
0e56	NOP	
0e57	NOP	
0e58	NOP	
0e59	NOP	
0e5a	NOP	
0e5b	NOP	
0e5c	NOP	
0e5d	NOP	
0e5e	NOP	
0e5f	NOP	
0e60	NOP	
0e61	NOP	
0e62	NOP	
0e63	NOP	
0e64	NOP	
0e65	NOP	
0e66	NOP	
0e67	NOP	
0e68	NOP	
0e69	NOP	
0e6a	NOP	
0e6b	NOP	
0e6c	NOP	
0e6d	NOP	
0e6e	NOP	
0e6f	NOP	
0e70	NOP	
0e71	NOP	
0e72	NOP	
0e73	NOP	
0e74	NOP	
0e75	NOP	
0e76	NOP	
0e77	NOP	
0e78	NOP	
0e79	NOP	
0e7a	NOP	
0e7b	NOP	
0e7c	NOP	
0e7d	NOP	
0e7e	NOP	
0e7f	NOP	
0e80	NOP	
0e81	NOP	
0e82	NOP	
0e83	NOP	
0e84	NOP	
0e85	NOP	
0e86	NOP	
0e87	NOP	
0e88	NOP	
0e89	NOP	
0e8a	NOP	
0e8b	NOP	
0e8c	NOP	
0e8d	NOP	
0e8e	NOP	
0e8f	NOP	
0e90	NOP	
0e91	NOP	
0e92	NOP	
0e93	NOP	
0e94	NOP	
0e95	NOP	
0e96	NOP	
0e97	NOP	
0e98	NOP	
0e99	NOP	
0e9a	NOP	
0e9b	NOP	
0e9c	NOP	
0e9d	NOP	
0e9e	NOP	
0e9f	NOP	
0ea0	NOP	
0ea1	NOP	
0ea2	NOP	
0ea3	NOP	
0ea4	NOP	
0ea5	NOP	
0ea6	NOP	
0ea7	NOP	
0ea8	NOP	
0ea9	NOP	
0eaa	NOP	
0eab	NOP	
0eac	NOP	
0ead	NOP	
0eae	NOP	
0eaf	NOP	
0eb0	NOP	
0eb1	NOP	
0eb2	NOP	
0eb3	NOP	
0eb4	NOP	
0eb5	NOP	
0eb6	NOP	
0eb7	NOP	
0eb8	NOP	
0eb9	NOP	
0eba	NOP	
0ebb	NOP	
0ebc	NOP	
0ebd	NOP	
0ebe	NOP	
0ebf	NOP	
0ec0	NOP	
0ec1	NOP	
0ec2	NOP	
0ec3	NOP	
0ec4	NOP	
0ec5	NOP	
0ec6	NOP	
0ec7	NOP	
0ec8	NOP	
0ec9	NOP	
0eca	NOP	
0ecb	NOP	
0ecc	NOP	
0ecd	NOP	
0ece	NOP	
0ecf	NOP	
0ed0	NOP	
0ed1	NOP	
0ed2	NOP	
0ed3	NOP	
0ed4	NOP	
0ed5	NOP	
0ed6	NOP	
0ed7	NOP	
0ed8	NOP	
0ed9	NOP	
0eda	NOP	
0edb	NOP	
0edc	NOP	
0edd	NOP	
0ede	NOP	
0edf	NOP	
0ee0	NOP	
0ee1	NOP	
0ee2	NOP	
0ee3	NOP	
0ee4	NOP	
0ee5	NOP	
0ee6	NOP	
0ee7	NOP	
0ee8	NOP	
0ee9	NOP	
0eea	NOP	
0eeb	NOP	
0eec	NOP	
0eed	NOP	
0eee	NOP	
0eef	NOP	
0ef0	NOP	
0ef1	NOP	
0ef2	NOP	
0ef3	NOP	
0ef4	NOP	
0ef5	NOP	
0ef6	NOP	
0ef7	NOP	
0ef8	NOP	
0ef9	NOP	
0efa	NOP	
0efb	NOP	
0efc	NOP	
0efd	NOP	
0efe	NOP	
0eff	NOP	
0f00	NOP	
0f01	NOP	
0f02	NOP	
0f03	NOP	
0f04	NOP	
0f05	NOP	
0f06	NOP	
0f07	NOP	
0f08	NOP	
0f09	NOP	
0f0a	NOP	
0f0b	NOP	
0f0c	NOP	
0f0d	NOP	
0f0e	NOP	
0f0f	NOP	
0f10	NOP	
0f11	NOP	
0f12	NOP	
0f13	NOP	
0f14	NOP	
0f15	NOP	
0f16	NOP	
0f17	NOP	
0f18	NOP	
0f19	NOP	
0f1a	NOP	
0f1b	NOP	
0f1c	NOP	
0f1d	NOP	
0f1e	NOP	
0f1f	NOP	
0f20	NOP	
0f21	NOP	
0f22	NOP	
0f23	NOP	
0f24	NOP	
0f25	NOP	
0f26	NOP	
0f27	NOP	
0f28	NOP	
0f29	NOP	
0f2a	NOP	
0f2b	NOP	
0f2c	NOP	
0f2d	NOP	
0f2e	NOP	
0f2f	NOP	
0f30	NOP	
0f31	NOP	
0f32	NOP	
0f33	NOP	
0f34	NOP	
0f35	NOP	
0f36	NOP	
0f37	NOP	
0f38	NOP	
0f39	NOP	
0f3a	NOP	
0f3b	NOP	
0f3c	NOP	
0f3d	NOP	
0f3e	NOP	
0f3f	NOP	
0f40	NOP	
0f41	NOP	
0f42	NOP	
0f43	NOP	
0f44	NOP	
0f45	NOP	
0f46	NOP	
0f47	NOP	
0f48	NOP	
0f49	NOP	
0f4a	NOP	
0f4b	NOP	
0f4c	NOP	
0f4d	NOP	
0f4e	NOP	
0f4f	NOP	
0f50	NOP	
0f51	NOP	
0f52	NOP	
0f53	NOP	
0f54	NOP	
0f55	NOP	
0f56	NOP	
0f57	NOP	
0f58	NOP	
0f59	NOP	
0f5a	NOP	
0f5b	NOP	
0f5c	NOP	
0f5d	NOP	
0f5e	NOP	
0f5f	NOP	
0f60	NOP	
0f61	NOP	
0f62	NOP	
0f63	NOP	
0f64	NOP	
0f65	NOP	
0f66	NOP	
0f67	NOP	
0f68	NOP	
0f69	NOP	
0f6a	NOP	
0f6b	NOP	
0f6c	NOP	
0f6d	NOP	
0f6e	NOP	
0f6f	NOP	
0f70	NOP	
0f71	NOP	
0f72	NOP	
0f73	NOP	
0f74	NOP	
0f75	NOP	
0f76	NOP	
0f77	NOP	
0f78	NOP	
0f79	NOP	
0f7a	NOP	
0f7b	NOP	
0f7c	NOP	
0f7d	NOP	
0f7e	NOP	
0f7f	NOP	
0f80	NOP	
0f81	NOP	
0f82	NOP	
0f83	NOP	
0f84	NOP	
0f85	NOP	
0f86	NOP	
0f87	NOP	
0f88	NOP	
0f89	NOP	
0f8a	NOP	
0f8b	NOP	
0f8c	NOP	
0f8d	NOP	
0f8e	NOP	
0f8f	NOP	
0f90	NOP	
0f91	NOP	
0f92	NOP	
0f93	NOP	
0f94	NOP	
0f95	NOP	
0f96	NOP	
0f97	NOP	
0f98	NOP	
0f99	NOP	
0f9a	NOP	
0f9b	NOP	
0f9c	NOP	
0f9d	NOP	
0f9e	NOP	
0f9f	NOP	
0fa0	NOP	
0fa1	NOP	
0fa2	NOP	
0fa3	NOP	
0fa4	NOP	
0fa5	NOP	
0fa6	NOP	
0fa7	NOP	
0fa8	NOP	
0fa9	NOP	
0faa	NOP	
0fab	NOP	
0fac	NOP	
0fad	NOP	
0fae	NOP	
0faf	NOP	
0fb0	NOP	
0fb1	NOP	
0fb2	NOP	
0fb3	NOP	
0fb4	NOP	
0fb5	NOP	
0fb6	NOP	
0fb7	NOP	
0fb8	NOP	
0fb9	NOP	
0fba	NOP	
0fbb	NOP	
0fbc	NOP	
0fbd	NOP	
0fbe	NOP	
0fbf	NOP	
0fc0	NOP	
0fc1	NOP	
0fc2	NOP	
0fc3	NOP	
0fc4	NOP	
0fc5	NOP	
0fc6	NOP	
0fc7	NOP	
0fc8	NOP	
0fc9	NOP	
0fca	NOP	
0fcb	NOP	
0fcc	NOP	
0fcd	NOP	
0fce	NOP	
0fcf	NOP	
0fd0	NOP	
0fd1	NOP	
0fd2	NOP	
0fd3	NOP	
0fd4	NOP	
0fd5	NOP	
0fd6	NOP	
0fd7	NOP	
0fd8	NOP	
0fd9	NOP	
0fda	NOP	
0fdb	NOP	
0fdc	NOP	
0fdd	NOP	
0fde	NOP	
0fdf	NOP	
0fe0	NOP	
0fe1	NOP	
0fe2	NOP	
0fe3	NOP	
0fe4	NOP	
0fe5	NOP	
0fe6	NOP	
0fe7	NOP	
0fe8	NOP	
0fe9	NOP	
0fea	NOP	
0feb	NOP	
0fec	NOP	
0fed	NOP	
0fee	NOP	
0fef	NOP	
0ff0	NOP	
0ff1	NOP	
0ff2	NOP	
0ff3	NOP	
0ff4	NOP	
0ff5	NOP	
0ff6	NOP	
0ff7	NOP	
0ff8	NOP	
0ff9	NOP	
0ffa	NOP	
0ffb	NOP	
0ffc	NOP	
0ffd	NOP	
0ffe	NOP	
0fff	NOP	
1000	NOP	
1001	NOP	
1002	NOP	
1003	NOP	
1004	NOP	
1005	NOP	
1006	NOP	
1007	NOP	
1008	NOP	
1009	NOP	
100a	NOP	
100b	NOP	
100c	NOP	
100d	NOP	
100e	NOP	
100f	NOP	
1010	NOP	
1011	NOP	
1012	NOP	
1013	NOP	
1014	NOP	
1015	NOP	
1016	NOP	
1017	NOP	
1018	NOP	
1019	NOP	
101a	NOP	
101b	NOP	
101c	NOP	
101d	NOP	
101e	NOP	
101f	NOP	
1020	NOP	
1021	NOP	
1022	NOP	
1023	NOP	
1024	NOP	
1025	NOP	
1026	NOP	
1027	NOP	
1028	NOP	
1029	NOP	
102a	NOP	
102b	NOP	
102c	NOP	
102d	NOP	
102e	NOP	
102f	NOP	
1030	NOP	
1031	NOP	
1032	NOP	
1033	NOP	
1034	NOP	
1035	NOP	
1036	NOP	
1037	NOP	
1038	NOP	
1039	NOP	
103a	NOP	
103b	NOP	
103c	NOP	
103d	NOP	
103e	NOP	
103f	NOP	
1040	NOP	
1041	NOP	
1042	NOP	
1043	NOP	
1044	NOP	
1045	NOP	
1046	NOP	
1047	NOP	
1048	NOP	
1049	NOP	
104a	NOP	
104b	NOP	
104c	NOP	
104d	NOP	
104e	NOP	
104f	NOP	
1050	NOP	
1051	NOP	
1052	NOP	
1053	NOP	
1054	NOP	
1055	NOP	
1056	NOP	
1057	NOP	
1058	NOP	
1059	NOP	
105a	NOP	
105b	NOP	
105c	NOP	
105d	NOP	
105e	NOP	
105f	NOP	
1060	NOP	
1061	NOP	
1062	NOP	
1063	NOP	
1064	NOP	
1065	NOP	
1066	NOP	
1067	NOP	
1068	NOP	
1069	NOP	
106a	NOP	
106b	NOP	
106c	NOP	
106d	NOP	
106e	NOP	
106f	NOP	
1070	NOP	
1071	NOP	
1072	NOP	
1073	NOP	
1074	NOP	
1075	NOP	
1076	NOP	
1077	NOP	
1078	NOP	
1079	NOP	
107a	NOP	
107b	NOP	
107c	NOP	
107d	NOP	
107e	NOP	
107f	NOP	
1080	NOP	
1081	NOP	
1082	NOP	
1083	NOP	
1084	NOP	
1085	NOP	
1086	NOP	
1087	NOP	
1088	NOP	
1089	NOP	
108a	NOP	
108b	NOP	
108c	NOP	
108d	NOP	
108e	NOP	
108f	NOP	
1090	NOP	
1091	NOP	
1092	NOP	
1093	NOP	
1094	NOP	
1095	NOP	
1096	NOP	
1097	NOP	
1098	NOP	
1099	NOP	
109a	NOP	
109b	NOP	
109c	NOP	
109d	NOP	
109e	NOP	
109f	NOP	
10a0	NOP	
10a1	NOP	
10a2	NOP	
10a3	NOP	
10a4	NOP	
10a5	NOP	
10a6	NOP	
10a7	NOP	
10a8	NOP	
10a9	NOP	
10aa	NOP	
10ab	NOP	
10ac	NOP	
10ad	NOP	
10ae	NOP	
10af	NOP	
10b0	NOP	
10b1	NOP	
10b2	NOP	
10b3	NOP	
10b4	NOP	
10b5	NOP	
10b6	NOP	
10b7	NOP	
10b8	NOP	
10b9	NOP	
10ba	NOP	
10bb	NOP	
10bc	NOP	
10bd	NOP	
10be	NOP	
10bf	NOP	
10c0	NOP	
10c1	NOP	
10c2	NOP	
10c3	NOP	
10c4	NOP	
10c5	NOP	
10c6	NOP	
10c7	NOP	
10c8	NOP	
10c9	NOP	
10ca	NOP	
10cb	NOP	
10cc	NOP	
10cd	NOP	
10ce	NOP	
10cf	NOP	
10d0	NOP	
10d1	NOP	
10d2	NOP	
10d3	NOP	
10d4	NOP	
10d5	NOP	
10d6	NOP	
10d7	NOP	
10d8	NOP	
10d9	NOP	
10da	NOP	
10db	NOP	
10dc	NOP	
10dd	NOP	
10de	NOP	
10df	NOP	
10e0	NOP	
10e1	NOP	
10e2	NOP	
10e3	NOP	
10e4	NOP	
10e5	NOP	
10e6	NOP	
10e7	NOP	
10e8	NOP	
10e9	NOP	
10ea	NOP	
10eb	NOP	
10ec	NOP	
10ed	NOP	
10ee	NOP	
10ef	NOP	
10f0	NOP	
10f1	NOP	
10f2	NOP	
10f3	NOP	
10f4	NOP	
10f5	NOP	
10f6	NOP	
10f7	NOP	
10f8	NOP	
10f9	NOP	
10fa	NOP	
10fb	NOP	
10fc	NOP	
10fd	NOP	
10fe	NOP	
10ff	NOP	
1100	NOP	
1101	NOP	
1102	NOP	
1103	NOP	
1104	NOP	
1105	NOP	
1106	NOP	
1107	NOP	
1108	NOP	
1109	NOP	
110a	NOP	
110b	NOP	
110c	NOP	
110d	NOP	
110e	NOP	
110f	NOP	
1110	NOP	
1111	NOP	
1112	NOP	
1113	NOP	
1114	NOP	
1115	NOP	
1116	NOP	
1117	NOP	
1118	NOP	
1119	NOP	
111a	NOP	
111b	NOP	
111c	NOP	
111d	NOP	
111e	NOP	
111f	NOP	
1120	NOP	
1121	NOP	
1122	NOP	
1123	NOP	
1124	NOP	
1125	NOP	
1126	NOP	
1127	NOP	
1128	NOP	
1129	NOP	
112a	NOP	
112b	NOP	
112c	NOP	
112d	NOP	
112e	NOP	
112f	NOP	
1130	NOP	
1131	NOP	
1132	NOP	
1133	NOP	
1134	NOP	
1135	NOP	
1136	NOP	
1137	NOP	
1138	NOP	
1139	NOP	
113a	NOP	
113b	NOP	
113c	NOP	
113d	NOP	
113e	NOP	
113f	NOP	
1140	NOP	
1141	NOP	
1142	NOP	
1143	NOP	
1144	NOP	
1145	NOP	
1146	NOP	
1147	NOP	
1148	NOP	
1149	NOP	
114a	NOP	
114b	NOP	
114c	NOP	
114d	NOP	
114e	NOP	
114f	NOP	
1150	NOP	
1151	NOP	
1152	NOP	
1153	NOP	
1154	NOP	
1155	NOP	
1156	NOP	
1157	NOP	
1158	NOP	
1159	NOP	
115a	NOP	
115b	NOP	
115c	NOP	
115d	NOP	
115e	NOP	
115f	NOP	
1160	NOP	
1161	NOP	
1162	NOP	
1163	NOP	
1164	NOP	
1165	NOP	
1166	NOP	
1167	NOP	
1168	NOP	
1169	NOP	
116a	NOP	
116b	NOP	
116c	NOP	
116d	NOP	
116e	NOP	
116f	NOP	
1170	NOP	
1171	NOP	
1172	NOP	
1173	NOP	
1174	NOP	
1175	NOP	
1176	NOP	
1177	NOP	
1178	NOP	
1179	NOP	
117a	NOP	
117b	NOP	
117c	NOP	
117d	NOP	
117e	NOP	
117f	NOP	
1180	NOP	
1181	NOP	
1182	NOP	
1183	NOP	
1184	NOP	
1185	NOP	
1186	NOP	
1187	NOP	
1188	NOP	
1189	NOP	
118a	NOP	
118b	NOP	
118c	NOP	
118d	NOP	
118e	NOP	
118f	NOP	
1190	NOP	
1191	NOP	
1192	NOP	
1193	NOP	
1194	NOP	
1195	NOP	
1196	NOP	
1197	NOP	
1198	NOP	
1199	NOP	
119a	NOP	
119b	NOP	
119c	NOP	
119d	NOP	
119e	NOP	
119f	NOP	
11a0	NOP	
11a1	NOP	
11a2	NOP	
11a3	NOP	
11a4	NOP	
11a5	NOP	
11a6	NOP	
11a7	NOP	
11a8	NOP	
11a9	NOP	
11aa	NOP	
11ab	NOP	
11ac	NOP	
11ad	NOP	
11ae	NOP	
11af	NOP	
11b0	NOP	
11b1	NOP	
11b2	NOP	
11b3	NOP	
11b4	NOP	
11b5	NOP	
11b6	NOP	
11b7	NOP	
11b8	NOP	
11b9	NOP	
11ba	NOP	
11bb	NOP	
11bc	NOP	
11bd	NOP	
11be	NOP	
11bf	NOP	
11c0	NOP	
11c1	NOP	
11c2	NOP	
11c3	NOP	
11c4	NOP	
11c5	NOP	
11c6	NOP	
11c7	NOP	
11c8	NOP	
11c9	NOP	
11ca	NOP	
11cb	NOP	
11cc	NOP	
11cd	NOP	
11ce	NOP	
11cf	NOP	
11d0	NOP	
11d1	NOP	
11d2	NOP	
11d3	NOP	
11d4	NOP	
11d5	NOP	
11d6	NOP	
11d7	NOP	
11d8	NOP	
11d9	NOP	
11da	NOP	
11db	NOP	
11dc	NOP	
11dd	NOP	
11de	NOP	
11df	NOP	
11e0	NOP	
11e1	NOP	
11e2	NOP	
11e3	NOP	
11e4	NOP	
11e5	NOP	
11e6	NOP	
11e7	NOP	
11e8	NOP	
11e9	NOP	
11ea	NOP	
11eb	NOP	
11ec	NOP	
11ed	NOP	
11ee	NOP	
11ef	NOP	
11f0	NOP	
11f1	NOP	
11f2	NOP	
11f3	NOP	
11f4	NOP	
11f5	NOP	
11f6	NOP	
11f7	NOP	
11f8	NOP	
11f9	NOP	
11fa	NOP	
11fb	NOP	
11fc	NOP	
11fd	NOP	
11fe	NOP	
11ff	NOP	
1200	NOP	
1201	NOP	
1202	NOP	
1203	NOP	
1204	NOP	
1205	NOP	
1206	NOP	
1207	NOP	
1208	NOP	
1209	NOP	
120a	NOP	
120b	NOP	
120c	NOP	
120d	NOP	
120e	NOP	
120f	NOP	
1210	NOP	
1211	NOP	
1212	NOP	
1213	NOP	
1214	NOP	
1215	NOP	
1216	NOP	
1217	NOP	
1218	NOP	
1219	NOP	
121a	NOP	
121b	NOP	
121c	NOP	
121d	NOP	
121e	NOP	
121f	NOP	
1220	NOP	
1221	NOP	
1222	NOP	
1223	NOP	
1224	NOP	
1225	NOP	
1226	NOP	
1227	NOP	
1228	NOP	
1229	NOP	
122a	NOP	
122b	NOP	
122c	NOP	
122d	NOP	
122e	NOP	
122f	NOP	
1230	NOP	
1231	NOP	
1232	NOP	
1233	NOP	
1234	NOP	
1235	NOP	
1236	NOP	
1237	NOP	
1238	NOP	
1239	NOP	
123a	NOP	
123b	NOP	
123c	NOP	
123d	NOP	
123e	NOP	
123f	NOP	
1240	NOP	
1241	NOP	
1242	NOP	
1243	NOP	
1244	NOP	
1245	NOP	
1246	NOP	
1247	NOP	
1248	NOP	
1249	NOP	
124a	NOP	
124b	NOP	
124c	NOP	
124d	NOP	
124e	NOP	
124f	NOP	
1250	NOP	
1251	NOP	
1252	NOP	
1253	NOP	
1254	NOP	
1255	NOP	
1256	NOP	
1257	NOP	
1258	NOP	
1259	NOP	
125a	NOP	
125b	NOP	
125c	NOP	
125d	NOP	
125e	NOP	
125f	NOP	
1260	NOP	
1261	NOP	
1262	NOP	
1263	NOP	
1264	NOP	
1265	NOP	
1266	NOP	
1267	NOP	
1268	NOP	
1269	NOP	
126a	NOP	
126b	NOP	
126c	NOP	
126d	NOP	
126e	NOP	
126f	NOP	
1270	NOP	
1271	NOP	
1272	NOP	
1273	NOP	
1274	NOP	
1275	NOP	
1276	NOP	
1277	NOP	
1278	NOP	
1279	NOP	
127a	NOP	
127b	NOP	
127c	NOP	
127d	NOP	
127e	NOP	
127f	NOP	
1280	NOP	
1281	NOP	
1282	NOP	
1283	NOP	
1284	NOP	
1285	NOP	
1286	NOP	
1287	NOP	
1288	NOP	
1289	NOP	
128a	NOP	
128b	NOP	
128c	NOP	
128d	NOP	
128e	NOP	
128f	NOP	
1290	NOP	
1291	NOP	
1292	NOP	
1293	NOP	
1294	NOP	
1295	NOP	
1296	NOP	
1297	NOP	
1298	NOP	
1299	NOP	
129a	NOP	
129b	NOP	
129c	NOP	
129d	NOP	
129e	NOP	
129f	NOP	
12a0	NOP	
12a1	NOP	
12a2	NOP	
12a3	NOP	
12a4	NOP	
12a5	NOP	
12a6	NOP	
12a7	NOP	
12a8	NOP	
12a9	NOP	
12aa	NOP	
12ab	NOP	
12ac	NOP	
12ad	NOP	
12ae	NOP	
12af	NOP	
12b0	NOP	
12b1	NOP	
12b2	NOP	
12b3	NOP	
12b4	NOP	
12b5	NOP	
12b6	NOP	
12b7	NOP	
12b8	NOP	
12b9	NOP	
12ba	NOP	
12bb	NOP	
12bc	NOP	
12bd	NOP	
12be	NOP	
12bf	NOP	
12c0	NOP	
12c1	NOP	
12c2	NOP	
12c3	NOP	
12c4	NOP	
12c5	NOP	
12c6	NOP	
12c7	NOP	
12c8	NOP	
12c9	NOP	
12ca	NOP	
12cb	NOP	
12cc	NOP	
12cd	NOP	
12ce	NOP	
12cf	NOP	
12d0	NOP	
12d1	NOP	
12d2	NOP	
12d3	NOP	
12d4	NOP	
12d5	NOP	
12d6	NOP	
12d7	NOP	
12d8	NOP	
12d9	NOP	
12da	NOP	
12db	NOP	
12dc	NOP	
12dd	NOP	
12de	NOP	
12df	NOP	
12e0	NOP	
12e1	NOP	
12e2	NOP	
12e3	NOP	
12e4	NOP	
12e5	NOP	
12e6	NOP	
12e7	NOP	
12e8	NOP	
12e9	NOP	
12ea	NOP	
12eb	NOP	
12ec	NOP	
12ed	NOP	
12ee	NOP	
12ef	NOP	
12f0	NOP	
12f1	NOP	
12f2	NOP	
12f3	NOP	
12f4	NOP	
12f5	NOP	
12f6	NOP	
12f7	NOP	
12f8	NOP	
12f9	NOP	
12fa	NOP	
12fb	NOP	
12fc	NOP	
12fd	NOP	
12fe	NOP	
12ff	NOP	
1300	NOP	
1301	NOP	
1302	NOP	
1303	NOP	
1304	NOP	
1305	NOP	
1306	NOP	
1307	NOP	
1308	NOP	
1309	NOP	
130a	NOP	
130b	NOP	
130c	NOP	
130d	NOP	
130e	NOP	
130f	NOP	
1310	NOP	
1311	NOP	
1312	NOP	
1313	NOP	
1314	NOP	
1315	NOP	
1316	NOP	
1317	NOP	
1318	NOP	
1319	NOP	
131a	NOP	
131b	NOP	
131c	NOP	
131d	NOP	
131e	NOP	
131f	NOP	
1320	NOP	
1321	NOP	
1322	NOP	
1323	NOP	
1324	NOP	
1325	NOP	
1326	NOP	
1327	NOP	
1328	NOP	
1329	NOP	
132a	NOP	
132b	NOP	
132c	NOP	
132d	NOP	
132e	NOP	
132f	NOP	
1330	NOP	
1331	NOP	
1332	NOP	
1333	NOP	
1334	NOP	
1335	NOP	
1336	NOP	
1337	NOP	
1338	NOP	
1339	NOP	
133a	NOP	
133b	NOP	
133c	NOP	
133d	NOP	
133e	NOP	
133f	NOP	
1340	NOP	
1341	NOP	
1342	NOP	
1343	NOP	
1344	NOP	
1345	NOP	
1346	NOP	
1347	NOP	
1348	NOP	
1349	NOP	
134a	NOP	
134b	NOP	
134c	NOP	
134d	NOP	
134e	NOP	
134f	NOP	
1350	NOP	
1351	NOP	
1352	NOP	
1353	NOP	
1354	NOP	
1355	NOP	
1356	NOP	
1357	NOP	
1358	NOP	
1359	NOP	
135a	NOP	
135b	NOP	
135c	NOP	
135d	NOP	
135e	NOP	
135f	NOP	
1360	NOP	
1361	NOP	
1362	NOP	
1363	NOP	
1364	NOP	
1365	NOP	
1366	NOP	
1367	NOP	
1368	NOP	
1369	NOP	
136a	NOP	
136b	NOP	
136c	NOP	
136d	NOP	
136e	NOP	
136f	NOP	
1370	NOP	
1371	NOP	
1372	NOP	
1373	NOP	
1374	NOP	
1375	NOP	
1376	NOP	
1377	NOP	
1378	NOP	
1379	NOP	
137a	NOP	
137b	NOP	
137c	NOP	
137d	NOP	
137e	NOP	
137f	NOP	
1380	NOP	
1381	NOP	
1382	NOP	
1383	NOP	
1384	NOP	
1385	NOP	
1386	NOP	
1387	NOP	
1388	NOP	
1389	NOP	
138a	NOP	
138b	NOP	
138c	NOP	
138d	NOP	
138e	NOP	
138f	NOP	
1390	NOP	
1391	NOP	
1392	NOP	
1393	NOP	
1394	NOP	
1395	NOP	
1396	NOP	
1397	NOP	
1398	NOP	
1399	NOP	
139a	NOP	
139b	NOP	
139c	NOP	
139d	NOP	
139e	NOP	
139f	NOP	
13a0	NOP	
13a1	NOP	
13a2	NOP	
13a3	NOP	
13a4	NOP	
13a5	NOP	
13a6	NOP	
13a7	NOP	
13a8	NOP	
13a9	NOP	
13aa	NOP	
13ab	NOP	
13ac	NOP	
13ad	NOP	
13ae	NOP	
13af	NOP	
13b0	NOP	
13b1	NOP	
13b2	NOP	
13b3	NOP	
13b4	NOP	
13b5	NOP	
13b6	NOP	
13b7	NOP	
13b8	NOP	
13b9	NOP	
13ba	NOP	
13bb	NOP	
13bc	NOP	
13bd	NOP	
13be	NOP	
13bf	NOP	
13c0	NOP	
13c1	NOP	
13c2	NOP	
13c3	NOP	
13c4	NOP	
13c5	NOP	
13c6	NOP	
13c7	NOP	
13c8	NOP	
13c9	NOP	
13ca	NOP	
13cb	NOP	
13cc	NOP	
13cd	NOP	
13ce	NOP	
13cf	NOP	
13d0	NOP	
13d1	NOP	
13d2	NOP	
13d3	NOP	
13d4	NOP	
13d5	NOP	
13d6	NOP	
13d7	NOP	
13d8	NOP	
13d9	NOP	
13da	NOP	
13db	NOP	
13dc	NOP	
13dd	NOP	
13de	NOP	
13df	NOP	
13e0	NOP	
13e1	NOP	
13e2	NOP	
13e3	NOP	
13e4	NOP	
13e5	NOP	
13e6	NOP	
13e7	NOP	
13e8	NOP	
13e9	NOP	
13ea	NOP	
13eb	NOP	
13ec	NOP	
13ed	NOP	
13ee	NOP	
13ef	NOP	
13f0	NOP	
13f1	NOP	
13f2	NOP	
13f3	NOP	
13f4	NOP	
13f5	NOP	
13f6	NOP	
13f7	NOP	
13f8	NOP	
13f9	NOP	
13fa	NOP	
13fb	NOP	
13fc	NOP	
13fd	NOP	
13fe	NOP	
13ff	NOP	
1400	NOP	
1401	CALL    #$1474	
1404	NOP	
1405	PUSH    B	
1406	PUSH    H	
1407	LDAX    D	
1408	OUT     #$04	
140a	IN      #$03	
140c	ORA     M	
140d	MOV     M,A	
140e	INX     H	
140f	INX     D	
1410	XRA     A	
1411	OUT     #$04	
1413	IN      #$03	
1415	ORA     M	
1416	MOV     M,A	
1417	POP     H	
1418	LXI     B,#$0020	
141b	DAD	
141c	POP     B	
141d	DCR     B	
141e	JNZ     #$1405	
1421	RET	
1422	NOP	
1423	NOP	
1424	CALL    #$1474	
1427	PUSH    B	
1428	PUSH    H	
1429	XRA     A	
142a	MOV     M,A	
142b	INX     H	
142c	MOV     M,A	
142d	INX     H	
142e	POP     H	
142f	LXI     B,#$0020	
1432	DAD	
1433	POP     B	
1434	DCR     B	
1435	JNZ     #$1427	
1438	RET	
1439	PUSH    B	
143a	LDAX    D	
143b	MOV     M,A	
143c	INX     D	
143d	LXI     B,#$0020	
1440	DAD	
1441	POP     B	
1442	DCR     B	
1443	JNZ     #$1439	
1446	RET	
1447	NOP	
1448	NOP	
1449	NOP	
144a	NOP	
144b	NOP	
144c	NOP	
144d	NOP	
144e	NOP	
144f	NOP	
1450	NOP	
1451	NOP	
1452	CALL    #$1474	
1455	PUSH    B	
1456	PUSH    H	
1457	LDAX    D	
1458	OUT     #$04	
145a	IN      #$03	
145c	CMA	
145d	ANA     M	
145e	MOV     M,A	
145f	INX     H	
1460	INX     D	
1461	XRA     A	
1462	OUT     #$04	
1464	IN      #$03	
1466	CMA	
1467	ANA     M	
1468	MOV     M,A	
1469	POP     H	
146a	LXI     B,#$0020	
146d	DAD	
146e	POP     B	
146f	DCR     B	
1470	JNZ     #$1455	
1473	RET	
1474	MOV     A,L	
1475	ANI     #$07	
1478	STAX    B	
1479	JMP     #$1a47	
147c	PUSH    B	
147d	PUSH    H	
147e	MOV     A,M	
147f	STAX    D	
1480	INX     D	
1481	INX     H	
1482	DCR     C	
1483	JNZ     #$147e	
1486	POP     H	
1487	LXI     B,#$0020	
148a	DAD	
148b	POP     B	
148c	DCR     B	
148d	JNZ     #$147c	
1490	RET	
1491	CALL    #$1474	
1494	XRA     A	
1495	STA     #$2061	
1498	PUSH    B	
1499	PUSH    H	
149a	LDAX    D	
149b	OUT     #$04	
149d	IN      #$03	
149f	PUSH    PSW	
14a0	ANA     M	
14a1	JZ      #$14a9	
14a4	MVI     A,#$01	
14a6	STA     #$2061	
14a9	POP     PSW	
14aa	ORA     M	
14ab	MOV     M,A	
14ac	INX     H	
14ad	INX     D	
14ae	XRA     A	
14af	OUT     #$04	
14b1	IN      #$03	
14b3	PUSH    PSW	
14b4	ANA     M	
14b5	JZ      #$14bd	
14b8	MVI     A,#$01	
14ba	STA     #$2061	
14bd	POP     PSW	
14be	ORA     M	
14bf	MOV     M,A	
14c0	POP     H	
14c1	LXI     B,#$0020	
14c4	DAD	
14c5	POP     B	
14c6	DCR     B	
14c7	JNZ     #$1498	
14ca	RET	
14cb	XRA     A	
14cc	PUSH    B	
14cd	MOV     M,A	
14ce	LXI     B,#$0020	
14d1	DAD	
14d2	POP     B	
14d3	DCR     B	
14d4	JNZ     #$14cc	
14d7	RET	
14d8	LDA     #$2025	
14db	CPI		#$05	
14dd	RZ	
14de	CPI		#$02	
14e0	RNZ	
14e1	LDA     #$2029	
14e4	CPI		#$d8	
14e6	MOV     B,A	
14e7	JNC     #$1530	
14ea	LDA     #$2002	
14ed	ANA     A	
14ee	RZ	
14ef	MOV     A,B	
14f0	CPI		#$ce	
14f2	JNC     #$1579	
14f5	ADI     #$06	
14f6	MVI     B,#$47	
14f7	MOV     B,A	
14f8	LDA     #$2009	
14fb	CPI		#$90	
14fd	JNC     #$1504	
1500	CMP     B	
1501	JNC     #$1530	
1504	MOV     L,B	
1505	CALL    #$1562	
1508	LDA     #$202a	
150b	MOV     H,A	
150c	CALL    #$156f	
150f	SHLD    $2064	
1512	MVI     A,#$05	
1514	STA     #$2025	
1517	CALL    #$1581	
151a	MOV     A,M	
151b	ANA     A	
151c	JZ      #$1530	
151f	MVI     M,#$00	
1521	CALL    #$0a5f	
1524	CALL    #$1a3b	
1527	CALL    #$15d3	
152a	MVI     A,#$10	
152c	STA     #$2003	
152f	RET	
1530	MVI     A,#$03	
1532	STA     #$2025	
1535	JMP     #$154a	
1538	LXI     H,#$2003	
153b	DCR     M	
153c	RNZ	
153d	LHLD    #$2064	
1540	MVI     B,#$10	
1541	NOP	
1542	CALL    #$1424	
1545	MVI     A,#$04	
1547	STA     #$2025	
154a	XRA     A	
154b	STA     #$2002	
154e	MVI     B,#$f7	
154f	RST     6	
1550	JMP     #$19dc	
1553	NOP	
1554	MVI     C,#$00	
1556	CMP     H	
1557	CNC     #$1590	
155a	CMP     H	
155b	RNC	    1	
155c	ADI     #$10	
155d	NOP	
155e	INR     C	
155f	JMP     #$155a	
1562	LDA     #$2009	
1565	MOV     H,L	
1566	CALL    #$1554	
1569	MOV     B,C	
156a	DCR     B	
156b	SBI     #$10	
156d	MOV     L,A	
156e	RET	
156f	LDA     #$200a	
1572	CALL    #$1554	
1575	SBI     #$10	
1577	MOV     H,A	
1578	RET	
1579	MVI     A,#$01	
157b	STA     #$2085	
157e	JMP     #$1545	
1581	MOV     A,B	
1582	RLC	
1583	RLC	
1584	RLC	
1585	ADD     B	
1586	ADD     B	
1587	ADD     B	
1588	ADD     C	
1589	DCR     A	
158a	MOV     L,A	
158b	LDA     #$2067	
158e	MOV     H,A	
158f	RET	
1590	INR     C	
1591	ADI     #$10	
1592	NOP	
1593	JM      #$1590	
1596	RET	
1597	LDA     #$200d	
159a	ANA     A	
159b	JNZ     #$15b7	
159e	LXI     H,#$3ea4	
15a1	CALL    #$15c5	
15a4	RNC	    1	
15a5	MVI     B,#$fe	
15a6	CPI		#$3e	
15a8	LXI     B,#$0d32	
15ab	RIM	
15ac	MOV     A,B	
15ad	STA     #$2008	
15b0	LDA     #$200e	
15b3	STA     #$2007	
15b6	RET	
15b7	LXI     H,#$2524	
15ba	CALL    #$15c5	
15bd	RNC	    1	
15be	CALL    #$18f1	
15c1	XRA     A	
15c2	JMP     #$15a9	
15c5	MVI     B,#$17	
15c6	RAL	    1	
15c7	MOV     A,M	
15c8	ANA     A	
15c9	JNZ     #$166b	
15cc	INX     H	
15cd	DCR     B	
15ce	JNZ     #$15c7	
15d1	RET	
15d2	NOP	
15d3	CALL    #$1474	
15d6	PUSH    H	
15d7	PUSH    B	
15d8	PUSH    H	
15d9	LDAX    D	
15da	OUT     #$04	
15dc	IN      #$03	
15de	MOV     M,A	
15df	INX     H	
15e0	INX     D	
15e1	XRA     A	
15e2	OUT     #$04	
15e4	IN      #$03	
15e6	MOV     M,A	
15e7	POP     H	
15e8	LXI     B,#$0020	
15eb	DAD	
15ec	POP     B	
15ed	DCR     B	
15ee	JNZ     #$15d7	
15f1	POP     H	
15f2	RET	
15f3	CALL    #$1611	
15f6	LXI     B,#$3700	
15f9	MOV     A,M	
15fa	ANA     A	
15fb	JZ      #$15ff	
15fe	INR     C	
15ff	INX     H	
1600	DCR     B	
1601	JNZ     #$15f9	
1604	MOV     A,C	
1605	STA     #$2082	
1608	CPI		#$01	
160a	RNZ	
160b	LXI     H,#$206b	
160e	MVI     M,#$01	
1610	RET	
1611	MVI     L, #$00	
1613	LDA     #$2067	
1616	MOV     H,A	
1617	RET	
1618	LDA     #$2015	
161b	CPI		#$ff	
161d	RNZ	
161e	LXI     H,#$2010	
1621	MOV     A,M	
1622	INX     H	
1623	MOV     B,M	
1624	ORA     B	
1625	RNZ	
1626	LDA     #$2025	
1629	ANA     A	
162a	RNZ	
162b	LDA     #$20ef	
162e	ANA     A	
162f	JZ      #$1652	
1632	LDA     #$202d	
1635	ANA     A	
1636	JNZ     #$1648	
1639	CALL    #$17c0	
163c	ANI     #$10	
163f	MVI     A,#$01	
1641	STA     #$2025	
1644	STA     #$202d	
1647	RET	
1648	CALL    #$17c0	
164b	ANI     #$10	
164e	STA     #$202d	
1651	RET	
1652	LXI     H,#$2025	
1655	MVI     M,#$01	
1657	LHLD    #$20ed	
165a	INX     H	
165b	MOV     A,L	
165c	CPI		#$7e	
165e	JC      #$1663	
1661	MVI     L, #$74	
1663	SHLD    $20ed	
1666	MOV     A,M	
1667	STA     #$201d	
166a	RET	
166b	STC	
166c	RET	
166d	XRA     A	
166e	CALL    #$1a8b	
1671	CALL    #$1910	
1674	MVI     M,#$00	
1676	CALL    #$09ca	
1679	INX     H	
167a	LXI     D,#$20f5	
167d	LDAX    D	
167e	CMP     M	
167f	DCX     D	
1680	DCX     H	
1681	LDAX    D	
1682	JZ      #$168b	
1685	JNC     #$1698	
1688	JMP     #$168f	
168b	CMP     M	
168c	JNC     #$1698	
168f	MOV     A,M	
1690	STAX    D	
1691	INX     D	
1692	INX     H	
1693	MOV     A,M	
1694	STAX    D	
1695	CALL    #$1950	
1698	LDA     #$20ce	
169b	ANA     A	
169c	JZ      #$16c9	
169f	LXI     H,#$2803	
16a2	LXI     D,#$1aa6	
16a5	MVI     C,#$14	
16a7	CALL    #$0a93	
16aa	DCR     H	
16ab	DCR     H	
16ac	MVI     B,#$1b	
16ad	DCX     D	
16ae	LDA     #$2067	
16b1	RRC	
16b2	JC      #$16b7	
16b5	MVI     B,#$1c	
16b6	INR     E	
16b7	MOV     A,B	
16b8	CALL    #$08ff	
16bb	CALL    #$0ab1	
16be	CALL    #$18e7	
16c1	MOV     A,M	
16c2	ANA     A	
16c3	JZ      #$16c9	
16c6	JMP     #$02ed	
16c9	LXI     H,#$2d18	
16cc	LXI     D,#$1aa6	
16cf	MVI     C,#$0a	
16d1	CALL    #$0a93	
16d4	CALL    #$0ab6	
16d7	CALL    #$09d6	
16da	XRA     A	
16db	STA     #$20ef	
16de	OUT     #$05	
16e0	CALL    #$19d1	
16e3	JMP     #$0b89	
16e6	LXI     SP, #$2400	
16e9	EI	
16ea	XRA     A	
16eb	STA     #$2015	
16ee	CALL    #$14d8	
16f1	MVI     B,#$04	
16f2	INR     B	
16f3	CALL    #$18fa	
16f6	CALL    #$0a59	
16f9	JNZ     #$16ee	
16fc	CALL    #$19d7	
16ff	LXI     H,#$2701	
1702	CALL    #$19fa	
1705	XRA     A	
1706	CALL    #$1a8b	
1709	MVI     B,#$fb	
170a	EI	
170b	JMP     #$196b	
170e	CALL    #$09ca	
1711	INX     H	
1712	MOV     A,M	
1713	LXI     D,#$1cb8	
1716	LXI     H,#$1aa1	
1719	MVI     C,#$04	
171b	MOV     B,A	
171c	LDAX    D	
171d	CMP     B	
171e	JNC     #$1727	
1721	INX     H	
1722	INX     D	
1723	DCR     C	
1724	JNZ     #$171c	
1727	MOV     A,M	
1728	STA     #$20cf	
172b	RET	
172c	LDA     #$2025	
172f	CPI		#$00	
1731	JNZ     #$1739	
1734	MVI     B,#$fd	
1735	NOP	
1736	JMP     #$19dc	
1739	MVI     B,#$02	
173a	STAX    B	
173b	JMP     #$18fa	
173e	NOP	
173f	NOP	
1740	LXI     H,#$209b	
1743	DCR     M	
1744	CZ      #$176d	
1747	LDA     #$2068	
174a	ANA     A	
174b	JZ      #$176d	
174e	LXI     H,#$2096	
1751	DCR     M	
1752	RNZ	
1753	LXI     H,#$2098	
1756	MOV     A,M	
1757	OUT     #$05	
1759	LDA     #$2082	
175c	ANA     A	
175d	JZ      #$176d	
1760	DCX     H	
1761	MOV     A,M	
1762	DCX     H	
1763	MOV     M,A	
1764	DCX     H	
1765	MVI     M,#$01	
1767	MVI     A,#$04	
1769	STA     #$209b	
176c	RET	
176d	LDA     #$2098	
1770	ANI     #$30	
1773	DCR     B	
1774	RET	
1775	LDA     #$2095	
1778	ANA     A	
1779	JZ      #$17aa	
177c	LXI     H,#$1a11	
177f	LXI     D,#$1a21	
1782	LDA     #$2082	
1785	CMP     M	
1786	JNC     #$178e	
1789	INX     H	
178a	INX     D	
178b	JMP     #$1785	
178e	LDAX    D	
178f	STA     #$2097	
1792	LXI     H,#$2098	
1795	MOV     A,M	
1796	ANI     #$30	
1799	MOV     A,M	
179a	ANI     #$0f	
179d	CPI		#$10	
179f	JNZ     #$17a4	
17a2	MVI     A,#$01	
17a4	ORA     B	
17a5	MOV     M,A	
17a6	XRA     A	
17a7	STA     #$2095	
17aa	LXI     H,#$2099	
17ad	DCR     M	
17ae	RNZ	
17af	MVI     B,#$ef	
17b0	RST     5	
17b1	JMP     #$19dc	
17b4	MVI     B,#$ef	
17b5	RST     5	
17b6	LXI     H,#$2098	
17b9	MOV     A,M	
17ba	ANA     B	
17bb	MOV     M,A	
17bc	OUT     #$05	
17be	RET	
17bf	NOP	
17c0	LDA     #$2067	
17c3	RRC	
17c4	JNC     #$17ca	
17c7	IN      #$01	
17c9	RET	
17ca	IN      #$02	
17cc	RET	
17cd	IN      #$02	
17cf	ANI     #$04	
17d2	LDA     #$209a	
17d5	ANA     A	
17d6	RNZ	
17d7	LXI     SP, #$2400	
17da	MVI     B,#$04	
17db	INR     B	
17dc	CALL    #$09d6	
17df	DCR     B	
17e0	JNZ     #$17dc	
17e3	MVI     A,#$01	
17e5	STA     #$209a	
17e8	CALL    #$19d7	
17eb	EI	
17ec	LXI     D,#$1cbc	
17ef	LXI     H,#$3016	
17f2	MVI     C,#$04	
17f4	CALL    #$0a93	
17f7	CALL    #$0ab1	
17fa	XRA     A	
17fb	STA     #$209a	
17fe	STA     #$2093	
1801	JMP     #$16c9	
1804	LXI     H,#$2084	
1807	MOV     A,M	
1808	ANA     A	
1809	JZ      #$0707	
180c	INX     H	
180d	MOV     A,M	
180e	ANA     A	
180f	RNZ	
1810	MVI     B,#$01	
1811	LXI     B,#$fac3	
1814	NOP	
1815	LXI     H,#$2810	
1818	LXI     D,#$1ca3	
181b	MVI     C,#$15	
181d	CALL    #$08f3	
1820	MVI     A,#$0a	
1822	STA     #$206c	
1825	LXI     B,#$1dbe	
1828	CALL    #$1856	
182b	JC      #$1837	
182e	CALL    #$1844	
1831	JMP     #$1828	
1834	CALL    #$0ab1	
1837	LXI     B,#$1dcf	
183a	CALL    #$1856	
183d	RC	
183e	CALL    #$184c	
1841	JMP     #$183a	
1844	PUSH    B	
1845	MVI     B,#$10	
1846	NOP	
1847	CALL    #$1439	
184a	POP     B	
184b	RET	
184c	PUSH    B	
184d	LDA     #$206c	
1850	MOV     C,A	
1851	CALL    #$0a93	
1854	POP     B	
1855	RET	
1856	LDAX	
1857	CPI		#$ff	
1859	STC	
185a	RZ	
185b	MOV     L,A	
185c	INX		B	
185d	LDAX	
185e	MOV     H,A	
185f	INX		B	
1860	LDAX	
1861	MOV     E,A	
1862	INX		B	
1863	LDAX	
1864	MOV     D,A	
1865	INX		B	
1866	ANA     A	
1867	RET	
1868	LXI     H,#$20c2	
186b	INR     M	
186c	INX     H	
186d	MOV     C,M	
186e	CALL    #$01d9	
1871	MOV     B,A	
1872	LDA     #$20ca	
1875	CMP     B	
1876	JZ      #$1898	
1879	LDA     #$20c2	
187c	ANI     #$04	
187f	CZ      #$c220	
1882	ADC     B	
1883	NOP	
1884	LXI     D,#$0030	
1887	DAD     D	
1888	SHLD    $20c7	
188b	LXI     H,#$20c5	
188e	CALL    #$1a3b	
1891	XCHG	
1892	JMP     #$15d3	
1895	NOP	
1896	NOP	
1897	NOP	
1898	MVI     A,#$01	
189a	STA     #$20cb	
189d	RET	
189e	LXI     H,#$2050	
18a1	LXI     D,#$1bc0	
18a4	MVI     B,#$10	
18a5	NOP	
18a6	CALL    #$1a32	
18a9	MVI     A,#$02	
18ab	STA     #$2080	
18ae	MVI     A,#$ff	
18b0	STA     #$207e	
18b3	MVI     A,#$04	
18b5	STA     #$20c1	
18b8	LDA     #$2055	
18bb	ANI     #$01	
18be	CMP     B	
18bf	NOP	
18c0	LDA     #$2055	
18c3	ANI     #$01	
18c6	RNZ	
18c7	NOP	
18c8	LXI     H,#$3311	
18cb	MVI     A,#$26	
18cd	NOP	
18ce	CALL    #$08ff	
18d1	JMP     #$0ab6	
18d4	LXI     SP, #$2400	
18d7	MVI     B,#$00	
18d8	NOP	
18d9	CALL    #$01e6	
18dc	CALL    #$1956	
18df	MVI     A,#$08	
18e1	STA     #$20cf	
18e4	JMP     #$0aea	
18e7	LDA     #$2067	
18ea	LXI     H,#$20e7	
18ed	RRC	
18ee	RNC	    1	
18ef	INX     H	
18f0	RET	
18f1	MVI     B,#$02	
18f2	STAX    B	
18f3	LDA     #$2082	
18f6	DCR     A	
18f7	RNZ	
18f8	INR     B	
18f9	RET	
18fa	LDA     #$2094	
18fd	ORA     B	
18fe	STA     #$2094	
1901	OUT     #$03	
1903	RET	
1904	LXI     H,#$2200	
1907	JMP     #$01c3	
190a	CALL    #$14d8	
190d	JMP     #$1597	
1910	LXI     H,#$20e7	
1913	LDA     #$2067	
1916	RRC	
1917	RC	
1918	INX     H	
1919	RET	
191a	MVI     C,#$1c	
191c	LXI     H,#$241e	
191f	LXI     D,#$1ae4	
1922	JMP     #$08f3	
1925	LXI     H,#$20f8	
1928	JMP     #$1931	
192b	LXI     H,#$20fc	
192e	JMP     #$1931	
1931	MOV     E,M	
1932	INX     H	
1933	MOV     D,M	
1934	INX     H	
1935	MOV     A,M	
1936	INX     H	
1937	MOV     H,M	
1938	MOV     L,A	
1939	JMP     #$09ad	
193c	MVI     C,#$07	
193e	LXI     H,#$3501	
1941	LXI     D,#$1fa9	
1944	JMP     #$08f3	
1947	LDA     #$20eb	
194a	LXI     H,#$3c01	
194d	JMP     #$09b2	
1950	LXI     H,#$20f4	
1953	JMP     #$1931	
1956	CALL    #$1a5c	
1959	CALL    #$191a	
195c	CALL    #$1925	
195f	CALL    #$192b	
1962	CALL    #$1950	
1965	CALL    #$193c	
1968	JMP     #$1947	
196b	CALL    #$19dc	
196e	JMP     #$1671	
1971	MVI     A,#$01	
1973	STA     #$206d	
1976	JMP     #$16e6	
1979	CALL    #$19d7	
197c	CALL    #$1947	
197f	JMP     #$193c	
1982	STA     #$20c1	
1985	RET	
1986	ADC     E	
1987	DAD     D	
1988	JMP     #$09d6	
198b	LXI     H,#$2803	
198e	LXI     D,#$19be	
1991	MVI     C,#$13	
1993	JMP     #$08f3	
1996	NOP	
1997	NOP	
1998	NOP	
1999	NOP	
199a	LDA     #$201e	
199d	ANA     A	
199e	JNZ     #$19ac	
19a1	IN      #$01	
19a3	ANI     #$76	
19a6	MOV     M,D	
19a7	RNZ	
19a8	INR     A	
19a9	STA     #$201e	
19ac	IN      #$01	
19ae	ANI     #$76	
19b1	INR     M	
19b2	RNZ	
19b3	LXI     H,#$2e1b	
19b6	LXI     D,#$0bf7	
19b9	MVI     C,#$09	
19bb	JMP     #$08f3	
19be	NOP	
19bf	INX     D	
19c0	NOP	
19c1	NOP	
19c2	INX     D	
19c3	MVI     C,#$26	
19c5	STAX    B	
19c6	MVI     C,#$11	
19c8	RRC	
19c9	MVI     C,#$11	
19cb	NOP	
19cc	INX     D	
19cd	NOP	
19ce	MVI     C,#$0d	
19d0	NOP	
19d1	MVI     A,#$01	
19d3	STA     #$20e9	
19d6	RET	
19d7	XRA     A	
19d8	JMP     #$19d3	
19db	NOP	
19dc	LDA     #$2094	
19df	ANA     B	
19e0	STA     #$2094	
19e3	OUT     #$03	
19e5	RET	
19e6	LXI     H,#$2701	
19e9	JZ      #$19fa	
19ec	LXI     D,#$1c60	
19ef	MVI     B,#$10	
19f0	NOP	
19f1	MOV     C,A	
19f2	CALL    #$1439	
19f5	MOV     A,C	
19f6	DCR     A	
19f7	JNZ     #$19ec	
19fa	MVI     B,#$10	
19fb	NOP	
19fc	CALL    #$14cb	
19ff	MOV     A,H	
1a00	CPI		#$35	
1a02	JNZ     #$19fa	
1a05	RET	
1a06	LXI     H,#$2072	
1a09	MOV     B,M	
1a0a	LDAX    D	
1a0b	ANI     #$80	
1a0e	RNZ	
1a0f	STC	
1a10	RET	
1a11	STA     #$242b	
1a14	INR     E	
1a15	MVI     D,#$11	
1a17	DCR     C	
1a18	LDAX	
1a19	NOP	
1a1a	RLC	
1a1b	MVI     B,#$05	
1a1c	DCR     B	
1a1d	INR     B	
1a1e	INX		B	
1a1f	STAX    B	
1a20	LXI     B,#$2e34	
1a23	DAA	
1a24	SHLD    $181c	
1a27	DCR     D	
1a28	INX     D	
1a29	NOP	
1a2a	MVI     C,#$0d	
1a2c	INR     C	
1a2d	DCX     B	
1a2e	DAD	
1a2f	RLC	
1a30	DCR     B	
1a31	RST     7	
1a32	LDAX    D	
1a33	MOV     M,A	
1a34	INX     H	
1a35	INX     D	
1a36	DCR     B	
1a37	JNZ     #$1a32	
1a3a	RET	
1a3b	MOV     E,M	
1a3c	INX     H	
1a3d	MOV     D,M	
1a3e	INX     H	
1a3f	MOV     A,M	
1a40	INX     H	
1a41	MOV     C,M	
1a42	INX     H	
1a43	MOV     B,M	
1a44	MOV     H,C	
1a45	MOV     L,A	
1a46	RET	
1a47	PUSH    B	
1a48	MVI     B,#$03	
1a49	INX		B	
1a4a	MOV     A,H	
1a4b	RAR	
1a4c	MOV     H,A	
1a4d	MOV     A,L	
1a4e	RAR	
1a4f	MOV     L,A	
1a50	DCR     B	
1a51	JNZ     #$1a4a	
1a54	MOV     A,H	
1a55	ANI     #$3f	
1a58	RIM	
1a59	MOV     H,A	
1a5a	POP     B	
1a5b	RET	
1a5c	LXI     H,#$2400	
1a5f	MVI     M,#$00	
1a61	INX     H	
1a62	MOV     A,H	
1a63	CPI		#$40	
1a65	JNZ     #$1a5f	
1a68	RET	
1a69	PUSH    B	
1a6a	PUSH    H	
1a6b	LDAX    D	
1a6c	ORA     M	
1a6d	MOV     M,A	
1a6e	INX     D	
1a6f	INX     H	
1a70	DCR     C	
1a71	JNZ     #$1a6b	
1a74	POP     H	
1a75	LXI     B,#$0020	
1a78	DAD	
1a79	POP     B	
1a7a	DCR     B	
1a7b	JNZ     #$1a69	
1a7e	RET	
1a7f	CALL    #$092e	
1a82	ANA     A	
1a83	RZ	
1a84	PUSH    PSW	
1a85	DCR     A	
1a86	MOV     M,A	
1a87	CALL    #$19e6	
1a8a	POP     PSW	
1a8b	LXI     H,#$2501	
1a8e	ANI     #$0f	
1a91	PUSH    B	
1a92	DAD	
1a93	NOP	
1a94	NOP	
1a95	NOP	
1a96	NOP	
1a97	RST     7	
1a98	CMP     B	
1a99	CPI		#$20	
1a9b	INR     E	
1a9c	NOP	
1a9d	SBB     M	
1a9e	NOP	
1a9f	RIM	
1aa0	INR     E	
1aa1	SIM	
1aa2	NOP	
1aa3	DCX     B	
1aa4	NOP	
1aa5	RLC	
1aa6	MVI     B,#$00	
1aa7	NOP	
1aa8	INR     C	
1aa9	INR     B	
1aaa	MVI     H,#$0e	
1aab	MVI     C,#$15	
1aad	INR     B	
1aae	LXI     D,#$2626	
1ab1	RRC	
1ab2	DCX     B	
1ab3	NOP	
1ab4	NOP	
1ab5	INR     B	
1ab6	LXI     D,#$2624	
1ab9	DCR     H	
1aba	DCX     D	
1abb	MVI     H,#$0e	
1abc	MVI     C,#$11	
1abe	MVI     H,#$1c	
1abf	INR     E	
1ac0	RRC	
1ac1	DCX     B	
1ac2	NOP	
1ac3	NOP	
1ac4	INR     B	
1ac5	LXI     D,#$2612	
1ac8	LXI     B,#$1314	
1acb	INX     D	
1acc	MVI     C,#$0d	
1ace	MVI     H,#$0e	
1acf	MVI     C,#$0d	
1ad1	DCX     B	
1ad2	NOP	
1ad3	MVI     H,#$1b	
1ad4	DCX     D	
1ad5	RRC	
1ad6	DCX     B	
1ad7	NOP	
1ad8	NOP	
1ad9	INR     B	
1ada	LXI     D,#$2626	
1add	LXI     B,#$1314	
1ae0	INX     D	
1ae1	MVI     C,#$0d	
1ae3	MVI     H,#$26	
1ae4	MVI     H,#$12	
1ae5	STAX    D	
1ae6	STAX    B	
1ae7	MVI     C,#$11	
1ae9	INR     B	
1aea	INR     H	
1aeb	DCX     D	
1aec	DCR     H	
1aed	MVI     H,#$07	
1aee	RLC	
1aef	NOP	
1af0	CMC	
1af1	STAX    D	
1af2	STAX    B	
1af3	MVI     C,#$11	
1af5	INR     B	
1af6	MVI     H,#$12	
1af7	STAX    D	
1af8	STAX    B	
1af9	MVI     C,#$11	
1afb	INR     B	
1afc	INR     H	
1afd	INR     E	
1afe	DCR     H	
1aff	MVI     H,#$01	
1b00	LXI     B,#$0000	
1b03	NOP	
1b04	NOP	
1b05	NOP	
1b06	NOP	
1b07	NOP	
1b08	STAX    B	
1b09	MOV     A,B	
1b0a	NOP	
1b0b	MOV     A,B	
1b0c	NOP	
1b0d	NOP	
1b0e	RM	
1b0f	NOP	
1b10	NOP	
1b11	ADD     B	
1b12	NOP	
1b13	ADC     M	
1b14	STAX    B	
1b15	RST     7	
1b16	DCR     B	
1b17	INR     C	
1b18	MOV     H,B	
1b19	INR     E	
1b1a	RIM	
1b1b	SIM	
1b1c	NOP	
1b1d	LXI     B,#$0000	
1b20	NOP	
1b21	NOP	
1b22	NOP	
1b23	CMP     E	
1b24	INX		B	
1b25	NOP	
1b26	NOP	
1b27	SUB     B	
1b28	INR     E	
1b29	NOP	
1b2a	SIM	
1b2b	LXI     B,#$0004	
1b2e	RST     7	
1b2f	RST     7	
1b30	NOP	
1b31	NOP	
1b32	STAX    B	
1b33	HLT	
1b34	INR     B	
1b35	NOP	
1b36	NOP	
1b37	NOP	
1b38	NOP	
1b39	NOP	
1b3a	INR     B	
1b3b	XRI     #$1c	
1b3d	NOP	
1b3e	NOP	
1b3f	INX		B	
1b40	NOP	
1b41	NOP	
1b42	NOP	
1b43	ORA     M	
1b44	INR     B	
1b45	NOP	
1b46	NOP	
1b47	LXI     B,#$1d00	
1b4a	INR     B	
1b4b	JPO     #$001c	
1b4e	NOP	
1b4f	INX		B	
1b50	NOP	
1b51	NOP	
1b52	NOP	
1b53	ADD     D	
1b54	MVI     B,#$00	
1b55	NOP	
1b56	NOP	
1b57	LXI     B,#$1d06	
1b5a	INR     B	
1b5b	RNC	    1	
1b5c	INR     E	
1b5d	NOP	
1b5e	NOP	
1b5f	INX		B	
1b60	RST     7	
1b61	NOP	
1b62	RNZ	
1b63	INR     E	
1b64	NOP	
1b65	NOP	
1b66	NOP	
1b67	LXI     H,#$0001	
1b6a	SIM	
1b6b	NOP	
1b6c	STAX    D	
1b6d	NOP	
1b6e	NOP	
1b6f	NOP	
1b70	RRC	
1b71	DCX     B	
1b72	NOP	
1b73	NOP	
1b74	MVI     H,#$0f	
1b75	RRC	
1b76	DCX     B	
1b77	NOP	
1b78	NOP	
1b79	INR     B	
1b7a	LXI     D,#$1b24	
1b7d	DCR     H	
1b7e	CM      #$0100	
1b81	RST     7	
1b82	RST     7	
1b83	NOP	
1b84	NOP	
1b85	NOP	
1b86	RIM	
1b87	MOV     H,H	
1b88	DCR     E	
1b89	RNC	    1	
1b8a	DAD     H	
1b8b	NOP	
1b8c	STAX    B	
1b8d	MOV     D,H	
1b8e	DCR     E	
1b8f	NOP	
1b90	NOP	
1b91	NOP	
1b92	MVI     B,#$00	
1b93	NOP	
1b94	NOP	
1b95	LXI     B,#$0040	
1b98	LXI     B,#$0000	
1b9b	NOP	
1b9c	SBB     M	
1b9d	NOP	
1b9e	RIM	
1b9f	INR     E	
1ba0	NOP	
1ba1	INX		B	
1ba2	INR     B	
1ba3	MOV     A,B	
1ba4	INR     D	
1ba5	INX     D	
1ba6	NOP	
1ba7	LDAX    D	
1ba8	DCR     A	
1ba9	MOV     L,B	
1baa	CM      #$68fc	
1bad	DCR     A	
1bae	LDAX    D	
1baf	NOP	
1bb0	NOP	
1bb1	NOP	
1bb2	LXI     B,#$98b8	
1bb5	ANA     B	
1bb6	DCX     D	
1bb7	NOP	
1bb8	RST     7	
1bb9	NOP	
1bba	ANA     B	
1bbb	DCX     D	
1bbc	NOP	
1bbd	NOP	
1bbe	NOP	
1bbf	NOP	
1bc0	NOP	
1bc1	NOP	
1bc2	NOP	
1bc3	MVI     C,#$05	
1bc5	NOP	
1bc6	NOP	
1bc7	NOP	
1bc8	NOP	
1bc9	NOP	
1bca	RLC	
1bcb	RNC	    1	
1bcc	INR     E	
1bcd	RZ	
1bce	SBB     E	
1bcf	INX		B	
1bd0	NOP	
1bd1	NOP	
1bd2	INX		B	
1bd3	INR     B	
1bd4	MOV     A,B	
1bd5	INR     D	
1bd6	DCX     B	
1bd7	DAD     D	
1bd8	LDA     #$fa6d	
1bdb	JM      #$3a6d	
1bde	DAD     D	
1bdf	NOP	
1be0	NOP	
1be1	NOP	
1be2	NOP	
1be3	NOP	
1be4	NOP	
1be5	NOP	
1be6	NOP	
1be7	NOP	
1be8	NOP	
1be9	LXI     B,#$0000	
1bec	LXI     B,#$1f74	
1bef	NOP	
1bf0	ADD     B	
1bf1	NOP	
1bf2	NOP	
1bf3	NOP	
1bf4	NOP	
1bf5	NOP	
1bf6	INR     E	
1bf7	CMA	
1bf8	NOP	
1bf9	NOP	
1bfa	INR     E	
1bfb	DAA	
1bfc	NOP	
1bfd	NOP	
1bfe	INR     E	
1bff	DAD     SP	
1c00	NOP	
1c01	NOP	
1c02	DAD     SP	
1c03	MOV     A,C	
1c04	MOV     A,D	
1c05	MOV     L,M	
1c06	CPE     #$fafa	
1c09	CPE     #$7a6e	
1c0c	MOV     A,C	
1c0d	DAD     SP	
1c0e	NOP	
1c0f	NOP	
1c10	NOP	
1c11	NOP	
1c12	NOP	
1c13	MOV     A,B	
1c14	DCR     E	
1c15	CMP     M	
1c16	MOV     L,H	
1c17	INR     A	
1c18	INR     A	
1c19	INR     A	
1c1a	MOV     L,H	
1c1b	CMP     M	
1c1c	DCR     E	
1c1d	MOV     A,B	
1c1e	NOP	
1c1f	NOP	
1c20	NOP	
1c21	NOP	
1c22	NOP	
1c23	NOP	
1c24	DAD     D	
1c25	LDA     #$fa6d	
1c28	JM      #$3a6d	
1c2b	DAD     D	
1c2c	NOP	
1c2d	NOP	
1c2e	NOP	
1c2f	NOP	
1c30	NOP	
1c31	NOP	
1c32	NOP	
1c33	MOV     A,D	
1c34	MOV     A,A	
1c35	MOV     L,L	
1c36	CPE     #$fafa	
1c39	CPE     #$7f6d	
1c3c	MOV     A,D	
1c3d	NOP	
1c3e	NOP	
1c3f	NOP	
1c40	NOP	
1c41	NOP	
1c42	NOP	
1c43	MVI     C,#$18	
1c45	CMP     M	
1c46	MOV     L,L	
1c47	DCR     A	
1c48	INR     A	
1c49	DCR     A	
1c4a	MOV     L,L	
1c4b	CMP     M	
1c4c	NOP	
1c4d	MVI     C,#$00	
1c4f	NOP	
1c50	NOP	
1c51	NOP	
1c52	NOP	
1c53	NOP	
1c54	LDAX    D	
1c55	DCR     A	
1c56	MOV     L,B	
1c57	CM      #$68fc	
1c5a	DCR     A	
1c5b	LDAX    D	
1c5c	NOP	
1c5d	NOP	
1c5e	NOP	
1c5f	NOP	
1c60	NOP	
1c61	NOP	
1c62	RRC	
1c63	RAR	
1c64	RAR	
1c65	RAR	
1c66	RAR	
1c67	MOV     A,A	
1c68	RST     7	
1c69	MOV     A,A	
1c6a	RAR	
1c6b	RAR	
1c6c	RAR	
1c6d	RAR	
1c6e	RRC	
1c6f	NOP	
1c70	NOP	
1c71	INR     B	
1c72	LXI     B,#$0313	
1c75	RLC	
1c76	ORA     E	
1c77	RRC	
1c78	CMA	
1c79	INX		B	
1c7a	CMA	
1c7b	MOV     C,C	
1c7c	INR     B	
1c7d	INX		B	
1c7e	NOP	
1c7f	LXI     B,#$0840	
1c82	DCR     B	
1c83	ANA     E	
1c84	LDAX	
1c85	INX		B	
1c86	MOV     E,E	
1c87	RRC	
1c88	DAA	
1c89	DAA	
1c8a	DCX     B	
1c8b	MOV     C,E	
1c8c	MOV     B,B	
1c8d	ADD     H	
1c8e	LXI     D,#$0f48	
1c91	SBB     C	
1c92	INR     A	
1c93	MOV     A,M	
1c94	DCR     A	
1c95	CMP     H	
1c96	MVI     A,#$7c	
1c98	SBB     C	
1c99	DAA	
1c9a	DCX     D	
1c9b	LDAX    D	
1c9c	MVI     H,#$0f	
1c9d	RRC	
1c9e	MVI     C,#$08	
1ca0	DCR     C	
1ca1	INX     D	
1ca2	STAX    D	
1ca3	NOP	
1ca4	STAX    D	
1ca5	STAX    B	
1ca6	MVI     C,#$11	
1ca8	INR     B	
1ca9	MVI     H,#$00	
1caa	NOP	
1cab	INX		B	
1cac	DCR     D	
1cad	NOP	
1cae	DCR     C	
1caf	STAX    B	
1cb0	INR     B	
1cb1	MVI     H,#$13	
1cb2	INX     D	
1cb3	NOP	
1cb4	LXI     B,#$040b	
1cb7	NOP	
1cb8	STAX    B	
1cb9	NOP	
1cba	RIM	
1cbb	SIM	
1cbc	INX     D	
1cbd	NOP	
1cbe	DCX     B	
1cbf	INX     D	
1cc0	NOP	
1cc1	NOP	
1cc2	MOV     C,C	
1cc3	SHLD    $8114	
1cc6	MOV     B,D	
1cc7	NOP	
1cc8	MOV     B,D	
1cc9	ADD     C	
1cca	INR     D	
1ccb	SHLD    $0849	
1cce	NOP	
1ccf	NOP	
1cd0	MOV     B,H	
1cd1	XRA     D	
1cd2	NOP	
1cd3	ADC     B	
1cd4	MOV     D,H	
1cd5	SHLD    $aa10	
1cd8	MOV     B,H	
1cd9	SHLD    $8854	
1cdc	MOV     C,D	
1cdd	DCR     D	
1cde	CMP     M	
1cdf	CMC	
1ce0	MOV     E,M	
1ce1	DCR     H	
1ce2	INR     B	
1ce3	CM      #$1004	
1ce6	CM      #$2010	
1ce9	CM      #$8020	
1cec	CM      #$0080	
1cef	CPI		#$00	
1cf1	INR     H	
1cf2	CPI		#$12	
1cf4	NOP	
1cf5	CPI		#$00	
1cf7	MOV     C,B	
1cf8	CPI		#$90	
1cfa	RRC	
1cfb	DCX     B	
1cfc	NOP	
1cfd	DAD     H	
1cfe	NOP	
1cff	NOP	
1d00	LXI     B,#$0107	
1d03	LXI     B,#$0401	
1d06	DCX     B	
1d07	LXI     B,#$0306	
1d0a	LXI     B,#$0b01	
1d0d	DAD	
1d0e	STAX    B	
1d0f	NOP	
1d10	STAX    B	
1d11	DCX     B	
1d12	INR     B	
1d13	RLC	
1d14	LDAX	
1d15	DCR     B	
1d16	STAX    B	
1d17	DCR     B	
1d18	INR     B	
1d19	MVI     B,#$07	
1d1a	RLC	
1d1b	NOP	
1d1c	LDAX	
1d1d	MVI     B,#$0a	
1d1e	LDAX	
1d1f	INX		B	
1d20	RST     7	
1d21	RRC	
1d22	RST     7	
1d23	RAR	
1d24	RST     7	
1d25	CMC	
1d26	RST     7	
1d27	MOV     A,A	
1d28	RST     7	
1d29	RST     7	
1d2a	CM      #$f8ff	
1d2d	RST     7	
1d2e	RP	
1d2f	RST     7	
1d30	RP	
1d31	RST     7	
1d32	RP	
1d33	RST     7	
1d34	RP	
1d35	RST     7	
1d36	RP	
1d37	RST     7	
1d38	RP	
1d39	RST     7	
1d3a	RP	
1d3b	RST     7	
1d3c	RM	
1d3d	RST     7	
1d3e	CM      #$ffff	
1d41	RST     7	
1d42	RST     7	
1d43	RST     7	
1d44	RST     7	
1d45	MOV     A,A	
1d46	RST     7	
1d47	CMC	
1d48	RST     7	
1d49	RAR	
1d4a	RST     7	
1d4b	RRC	
1d4c	DCR     B	
1d4d	NOP	
1d4e	DCR     D	
1d4f	SIM	
1d50	SUB     H	
1d51	SUB     A	
1d52	SBB     D	
1d53	SBB     L	
1d54	NOP	
1d55	DCR     B	
1d56	DCR     B	
1d57	NOP	
1d58	DCR     D	
1d59	NOP	
1d5a	NOP	
1d5b	DCR     B	
1d5c	SIM	
1d5d	NOP	
1d5e	NOP	
1d5f	NOP	
1d60	DCR     B	
1d61	DCR     D	
1d62	NOP	
1d63	DCR     B	
1d64	NOP	
1d65	NOP	
1d66	NOP	
1d67	NOP	
1d68	INR     B	
1d69	INR     C	
1d6a	MVI     E,#$37	
1d6c	MVI     A,#$7c	
1d6e	MOV     M,H	
1d6f	MOV     A,M	
1d70	MOV     A,M	
1d71	MOV     M,H	
1d72	MOV     A,H	
1d73	MVI     A,#$37	
1d75	MVI     E,#$0c	
1d77	INR     B	
1d78	NOP	
1d79	NOP	
1d7a	NOP	
1d7b	NOP	
1d7c	NOP	
1d7d	SHLD    $a500	
1d80	MOV     B,B	
1d81	NOP	
1d82	SBB     B	
1d83	DCR     A	
1d84	ORA     M	
1d85	INR     A	
1d86	MVI     M,#$1d	
1d88	NOP	
1d89	MOV     C,B	
1d8a	MOV     H,D	
1d8b	ORA     M	
1d8c	DCR     E	
1d8d	SBB     B	
1d8e	NOP	
1d8f	MOV     B,D	
1d90	SUB     B	
1d91	NOP	
1d92	NOP	
1d93	NOP	
1d94	MVI     H,#$1f	
1d95	RAR	
1d96	LDAX    D	
1d97	DCX     D	
1d98	LDAX    D	
1d99	LDAX    D	
1d9a	DCX     D	
1d9b	RAR	
1d9c	LDAX    D	
1d9d	DCR     E	
1d9e	LDAX    D	
1d9f	LDAX    D	
1da0	NOP	
1da1	RIM	
1da2	SIM	
1da3	MOV     H,B	
1da4	MOV     D,B	
1da5	MOV     C,B	
1da6	MOV     C,B	
1da7	MOV     C,B	
1da8	MOV     B,B	
1da9	MOV     B,B	
1daa	MOV     B,B	
1dab	RRC	
1dac	DCX     B	
1dad	NOP	
1dae	NOP	
1daf	STAX    D	
1db0	RRC	
1db1	NOP	
1db2	STAX    B	
1db3	INR     B	
1db4	MVI     H,#$26	
1db5	MVI     H,#$08	
1db6	NOP	
1db7	DCR     C	
1db8	DCR     D	
1db9	NOP	
1dba	INX		B	
1dbb	INR     B	
1dbc	LXI     D,#$0e12	
1dbf	INR     L	
1dc0	MOV     L,B	
1dc1	DCR     E	
1dc2	INR     C	
1dc3	INR     L	
1dc4	RIM	
1dc5	INR     E	
1dc6	LDAX	
1dc7	INR     L	
1dc8	MOV     B,B	
1dc9	INR     E	
1dca	NOP	
1dcb	INR     L	
1dcc	NOP	
1dcd	INR     E	
1dce	RST     7	
1dcf	MVI     C,#$2e	
1dd1	RPO	
1dd2	DCR     E	
1dd3	INR     C	
1dd4	MVI     L, #$ea	
1dd6	DCR     E	
1dd7	LDAX	
1dd8	MVI     L, #$f4	
1dda	DCR     E	
1ddb	NOP	
1ddc	MVI     L, #$99	
1dde	INR     E	
1ddf	RST     7	
1de0	DAA	
1de1	NOP	
1de2	MVI     H,#$0c	
1de3	INR     C	
1de4	NOP	
1de5	STAX    D	
1de6	INX     D	
1de7	INR     B	
1de8	LXI     D,#$2718	
1deb	DCR     E	
1dec	LDAX    D	
1ded	MVI     H,#$0f	
1dee	RRC	
1def	MVI     C,#$08	
1df1	DCR     C	
1df2	INX     D	
1df3	STAX    D	
1df4	DAA	
1df5	INR     E	
1df6	LDAX    D	
1df7	MVI     H,#$0f	
1df8	RRC	
1df9	MVI     C,#$08	
1dfb	DCR     C	
1dfc	INX     D	
1dfd	STAX    D	
1dfe	NOP	
1dff	NOP	
1e00	NOP	
1e01	RAR	
1e02	INR     H	
1e03	MOV     B,H	
1e04	INR     H	
1e05	RAR	
1e06	NOP	
1e07	NOP	
1e08	NOP	
1e09	MOV     A,A	
1e0a	MOV     C,C	
1e0b	MOV     C,C	
1e0c	MOV     C,C	
1e0d	MVI     M,#$00	
1e0f	NOP	
1e10	NOP	
1e11	MVI     A,#$41	
1e13	MOV     B,C	
1e14	MOV     B,C	
1e15	SHLD    $0000	
1e18	NOP	
1e19	MOV     A,A	
1e1a	MOV     B,C	
1e1b	MOV     B,C	
1e1c	MOV     B,C	
1e1d	MVI     A,#$00	
1e1f	NOP	
1e20	NOP	
1e21	MOV     A,A	
1e22	MOV     C,C	
1e23	MOV     C,C	
1e24	MOV     C,C	
1e25	MOV     B,C	
1e26	NOP	
1e27	NOP	
1e28	NOP	
1e29	MOV     A,A	
1e2a	MOV     C,B	
1e2b	MOV     C,B	
1e2c	MOV     C,B	
1e2d	MOV     B,B	
1e2e	NOP	
1e2f	NOP	
1e30	NOP	
1e31	MVI     A,#$41	
1e33	MOV     B,C	
1e34	MOV     B,L	
1e35	MOV     B,A	
1e36	NOP	
1e37	NOP	
1e38	NOP	
1e39	MOV     A,A	
1e3a	NOP	
1e3b	NOP	
1e3c	NOP	
1e3d	MOV     A,A	
1e3e	NOP	
1e3f	NOP	
1e40	NOP	
1e41	NOP	
1e42	MOV     B,C	
1e43	MOV     A,A	
1e44	MOV     B,C	
1e45	NOP	
1e46	NOP	
1e47	NOP	
1e48	NOP	
1e49	STAX    B	
1e4a	LXI     B,#$0101	
1e4d	MOV     A,M	
1e4e	NOP	
1e4f	NOP	
1e50	NOP	
1e51	MOV     A,A	
1e52	NOP	
1e53	INR     D	
1e54	SHLD    $0041	
1e57	NOP	
1e58	NOP	
1e59	MOV     A,A	
1e5a	LXI     B,#$0101	
1e5d	LXI     B,#$0000	
1e60	NOP	
1e61	MOV     A,A	
1e62	RIM	
1e63	NOP	
1e64	RIM	
1e65	MOV     A,A	
1e66	NOP	
1e67	NOP	
1e68	NOP	
1e69	MOV     A,A	
1e6a	NOP	
1e6b	NOP	
1e6c	INR     B	
1e6d	MOV     A,A	
1e6e	NOP	
1e6f	NOP	
1e70	NOP	
1e71	MVI     A,#$41	
1e73	MOV     B,C	
1e74	MOV     B,C	
1e75	MVI     A,#$00	
1e77	NOP	
1e78	NOP	
1e79	MOV     A,A	
1e7a	MOV     C,B	
1e7b	MOV     C,B	
1e7c	MOV     C,B	
1e7d	SIM	
1e7e	NOP	
1e7f	NOP	
1e80	NOP	
1e81	MVI     A,#$41	
1e83	MOV     B,L	
1e84	MOV     B,D	
1e85	DCR     A	
1e86	NOP	
1e87	NOP	
1e88	NOP	
1e89	MOV     A,A	
1e8a	MOV     C,B	
1e8b	MOV     C,H	
1e8c	MOV     C,D	
1e8d	LXI     SP, #$0000	
1e90	NOP	
1e91	STA     #$4949	
1e94	MOV     C,C	
1e95	MVI     H,#$00	
1e96	NOP	
1e97	NOP	
1e98	NOP	
1e99	MOV     B,B	
1e9a	MOV     B,B	
1e9b	MOV     A,A	
1e9c	MOV     B,B	
1e9d	MOV     B,B	
1e9e	NOP	
1e9f	NOP	
1ea0	NOP	
1ea1	MOV     A,M	
1ea2	LXI     B,#$0101	
1ea5	MOV     A,M	
1ea6	NOP	
1ea7	NOP	
1ea8	NOP	
1ea9	MOV     A,H	
1eaa	STAX    B	
1eab	LXI     B,#$7c02	
1eae	NOP	
1eaf	NOP	
1eb0	NOP	
1eb1	MOV     A,A	
1eb2	STAX    B	
1eb3	INR     C	
1eb4	STAX    B	
1eb5	MOV     A,A	
1eb6	NOP	
1eb7	NOP	
1eb8	NOP	
1eb9	MOV     H,E	
1eba	INR     D	
1ebb	NOP	
1ebc	INR     D	
1ebd	MOV     H,E	
1ebe	NOP	
1ebf	NOP	
1ec0	NOP	
1ec1	MOV     H,B	
1ec2	NOP	
1ec3	RRC	
1ec4	NOP	
1ec5	MOV     H,B	
1ec6	NOP	
1ec7	NOP	
1ec8	NOP	
1ec9	MOV     B,E	
1eca	MOV     B,L	
1ecb	MOV     C,C	
1ecc	MOV     D,C	
1ecd	MOV     H,C	
1ece	NOP	
1ecf	NOP	
1ed0	NOP	
1ed1	MVI     A,#$45	
1ed3	MOV     C,C	
1ed4	MOV     D,C	
1ed5	MVI     A,#$00	
1ed7	NOP	
1ed8	NOP	
1ed9	NOP	
1eda	LXI     H,#$017f	
1edd	NOP	
1ede	NOP	
1edf	NOP	
1ee0	NOP	
1ee1	INX     H	
1ee2	MOV     B,L	
1ee3	MOV     C,C	
1ee4	MOV     C,C	
1ee5	LXI     SP, #$0000	
1ee8	NOP	
1ee9	MOV     B,D	
1eea	MOV     B,C	
1eeb	MOV     C,C	
1eec	MOV     E,C	
1eed	MOV     H,M	
1eee	NOP	
1eef	NOP	
1ef0	NOP	
1ef1	INR     C	
1ef2	INR     D	
1ef3	INR     H	
1ef4	MOV     A,A	
1ef5	INR     B	
1ef6	NOP	
1ef7	NOP	
1ef8	NOP	
1ef9	MOV     M,D	
1efa	MOV     D,C	
1efb	MOV     D,C	
1efc	MOV     D,C	
1efd	MOV     C,M	
1efe	NOP	
1eff	NOP	
1f00	NOP	
1f01	MVI     E,#$29	
1f03	MOV     C,C	
1f04	MOV     C,C	
1f05	MOV     B,M	
1f06	NOP	
1f07	NOP	
1f08	NOP	
1f09	MOV     B,B	
1f0a	MOV     B,A	
1f0b	MOV     C,B	
1f0c	MOV     D,B	
1f0d	MOV     H,B	
1f0e	NOP	
1f0f	NOP	
1f10	NOP	
1f11	MVI     M,#$49	
1f13	MOV     C,C	
1f14	MOV     C,C	
1f15	MVI     M,#$00	
1f17	NOP	
1f18	NOP	
1f19	LXI     SP, #$4949	
1f1c	MOV     C,D	
1f1d	INR     A	
1f1e	NOP	
1f1f	NOP	
1f20	NOP	
1f21	NOP	
1f22	INR     D	
1f23	SHLD    $0041	
1f26	NOP	
1f27	NOP	
1f28	NOP	
1f29	NOP	
1f2a	MOV     B,C	
1f2b	SHLD    $0814	
1f2e	NOP	
1f2f	NOP	
1f30	NOP	
1f31	NOP	
1f32	NOP	
1f33	NOP	
1f34	NOP	
1f35	NOP	
1f36	NOP	
1f37	NOP	
1f38	NOP	
1f39	INR     D	
1f3a	INR     D	
1f3b	INR     D	
1f3c	INR     D	
1f3d	INR     D	
1f3e	NOP	
1f3f	NOP	
1f40	NOP	
1f41	SHLD    $7f14	
1f44	INR     D	
1f45	SHLD    $0000	
1f48	NOP	
1f49	INX		B	
1f4a	INR     B	
1f4b	MOV     A,B	
1f4c	INR     B	
1f4d	INX		B	
1f4e	NOP	
1f4f	NOP	
1f50	INR     H	
1f51	DCX     D	
1f52	MVI     H,#$0e	
1f53	MVI     C,#$11	
1f55	MVI     H,#$1c	
1f56	INR     E	
1f57	MVI     H,#$0f	
1f58	RRC	
1f59	DCX     B	
1f5a	NOP	
1f5b	NOP	
1f5c	INR     B	
1f5d	LXI     D,#$2512	
1f60	MVI     H,#$26	
1f61	MVI     H,#$28	
1f62	NOP	
1f63	DCX     D	
1f64	MVI     H,#$0f	
1f65	RRC	
1f66	DCX     B	
1f67	NOP	
1f68	NOP	
1f69	INR     B	
1f6a	LXI     D,#$2626	
1f6d	DCX     D	
1f6e	MVI     H,#$02	
1f6f	STAX    B	
1f70	MVI     C,#$08	
1f72	DCR     C	
1f73	MVI     H,#$01	
1f74	LXI     B,#$0001	
1f77	NOP	
1f78	LXI     B,#$0200	
1f7b	LXI     B,#$0200	
1f7e	LXI     B,#$6000	
1f81	NOP	
1f82	RRC	
1f83	NOP	
1f84	MOV     H,B	
1f85	SIM	
1f86	NOP	
1f87	LDAX    D	
1f88	DCR     A	
1f89	MOV     L,B	
1f8a	CM      #$68fc	
1f8d	DCR     A	
1f8e	LDAX    D	
1f8f	NOP	
1f90	NOP	
1f91	DCR     C	
1f92	STAX    D	
1f93	INR     B	
1f94	LXI     D,#$2613	
1f97	MVI     H,#$02	
1f98	STAX    B	
1f99	MVI     C,#$08	
1f9b	DCR     C	
1f9c	DCR     C	
1f9d	LHLD    #$1f50	
1fa0	LDAX	
1fa1	LHLD    #$1f62	
1fa4	RLC	
1fa5	LHLD    #$1fe1	
1fa8	RST     7	
1fa9	STAX    B	
1faa	LXI     D,#$0304	
1fad	NOP	
1fae	INX     D	
1faf	MVI     H,#$00	
1fb0	NOP	
1fb1	MOV     H,B	
1fb2	NOP	
1fb3	RRC	
1fb4	NOP	
1fb5	MOV     H,B	
1fb6	NOP	
1fb7	DAD     D	
1fb8	LDA     #$fa6d	
1fbb	JM      #$3a6d	
1fbe	DAD     D	
1fbf	NOP	
1fc0	NOP	
1fc1	RIM	
1fc2	MOV     B,B	
1fc3	MOV     C,L	
1fc4	MOV     D,B	
1fc5	RIM	
1fc6	NOP	
1fc7	NOP	
1fc8	NOP	
1fc9	NOP	
1fca	NOP	
1fcb	RST     7	
1fcc	CMP     B	
1fcd	RST     7	
1fce	ADD     B	
1fcf	RAR	
1fd0	NOP	
1fd1	SUB     A	
1fd2	NOP	
1fd3	ADD     B	
1fd4	RAR	
1fd5	NOP	
1fd6	NOP	
1fd7	LXI     B,#$22d0	
1fda	RIM	
1fdb	INR     E	
1fdc	NOP	
1fdd	SUB     H	
1fde	NOP	
1fdf	RIM	
1fe0	INR     E	
1fe1	NOP	
1fe2	INR     E	
1fe3	MVI     H,#$0f	
1fe4	RRC	
1fe5	DCX     B	
1fe6	NOP	
1fe7	NOP	
1fe8	INR     B	
1fe9	LXI     D,#$2612	
1fec	INR     E	
1fed	MVI     H,#$02	
1fee	STAX    B	
1fef	MVI     C,#$08	
1ff1	DCR     C	
1ff2	STAX    D	
1ff3	RRC	
1ff4	INR     D	
1ff5	STAX    D	
1ff6	RLC	
1ff7	MVI     H,#$00	
1ff8	NOP	
1ff9	NOP	
1ffa	NOP	
1ffb	NOP	
1ffc	NOP	
1ffd	NOP	
1ffe	NOP	
1fff	NOP	
