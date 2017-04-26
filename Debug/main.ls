   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  63                     ; 6 void myDelay()
  63                     ; 7 {
  65                     	switch	.text
  66  0000               _myDelay:
  68  0000 5204          	subw	sp,#4
  69       00000004      OFST:	set	4
  72                     ; 9    for(i=0;i<1000;i++)
  74  0002 5f            	clrw	x
  75  0003 1f01          	ldw	(OFST-3,sp),x
  76  0005               L33:
  77                     ; 11        for(j=0;j<100;j++);    
  79  0005 5f            	clrw	x
  80  0006 1f03          	ldw	(OFST-1,sp),x
  81  0008               L14:
  85  0008 1e03          	ldw	x,(OFST-1,sp)
  86  000a 1c0001        	addw	x,#1
  87  000d 1f03          	ldw	(OFST-1,sp),x
  90  000f 9c            	rvf
  91  0010 1e03          	ldw	x,(OFST-1,sp)
  92  0012 a30064        	cpw	x,#100
  93  0015 2ff1          	jrslt	L14
  94                     ; 9    for(i=0;i<1000;i++)
  96  0017 1e01          	ldw	x,(OFST-3,sp)
  97  0019 1c0001        	addw	x,#1
  98  001c 1f01          	ldw	(OFST-3,sp),x
 101  001e 9c            	rvf
 102  001f 1e01          	ldw	x,(OFST-3,sp)
 103  0021 a303e8        	cpw	x,#1000
 104  0024 2fdf          	jrslt	L33
 105                     ; 13 }   
 108  0026 5b04          	addw	sp,#4
 109  0028 81            	ret
 133                     ; 15 main()   
 133                     ; 16 {            
 134                     	switch	.text
 135  0029               _main:
 139                     ; 17      GPIOD->DDR |= 0x01;  // PD.0 as Output
 141  0029 72105011      	bset	20497,#0
 142                     ; 18      GPIOD->CR1 |= 0x01;  // PD.0 as Push Pull Type Output
 144  002d 72105012      	bset	20498,#0
 145  0031               L75:
 146                     ; 21             GPIOD->ODR |=1<<0;  // PD.o = 1             
 148  0031 7210500f      	bset	20495,#0
 149                     ; 22             myDelay();                          
 151  0035 adc9          	call	_myDelay
 153                     ; 23             GPIOD->ODR &= ~(1<<0); // PD.0 = 0
 155  0037 7211500f      	bres	20495,#0
 156                     ; 24             myDelay();
 158  003b adc3          	call	_myDelay
 161  003d 20f2          	jra	L75
 174                     	xdef	_main
 175                     	xdef	_myDelay
 194                     	end
