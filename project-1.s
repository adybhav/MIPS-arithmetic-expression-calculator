#REQUEST YOU TO RUN THE CODE STEP WISE, 1000 STEPS DOES THE JOB for 3 operands
#converts INFIX TO POSTIFX, then pushes elements onto stack and calculates
#result also stored in t1
#if brackets are present does calculations only inside brackets


#t0 stores current string value
#t5 counter
#t1 lhs
#s0 string length
#a1 points to 1st mem loc of temp
#s2 stack counter
#s1 value at a1
#s3 value of t5+1
#t2 parser for multi digit number



.globl main
.data
v:	.half 12
w: 	.half 13
x:      .half 15
y:	.half 67
z:	.half 13
str:    .asciiz "x=x+13"


temp:	.asciiz ""
.text
main:
lui $a0,0x1000
addi $a0,$a0,10
lbu $t0,($a0) #reading from str 
add $0,$0,$0
add $0,$t0,$0
addi $s0,$0,0

strlen:
beq $t0,$0,cont
add $0,$0,$0
addi $a0,$a0,1
addi $s0,$s0,1
lbu $t0,($a0)
add $0,$0,$0
add $0,$t0,$0
j strlen
add $0,$0,$0


cont: #continue after stringlength calc
add $a1,$a0,$0
lbu $s1,($a1)
add $0,$0,$0
add $0,$s1,$0
lui $a0,0x1000
lbu $t0,10($a0)
add $0,$0,$0
add $0,$t0,$0
addi $t5,$a0,4 # counter1

addi $t1,$0,120 #if x in $t1 120 dec is 78 in hex
beq $t1,$t0,l1
add $0,$0,$0

addi $t1,$0,118  #if v in $t1
beq $t1,$t0,l1
add $0,$0,$0

addi $t1,$0,119	# if w in t1 
beq $t1,$t0,l1
add $0,$0,$0

addi $t1,$0,121 # if y 
beq $t1,$t0,l1
add $0,$0,$0


addi $t1,$0,122	# if z 
beq $t1,$t0,l1
add $0,$0,$0

bne $t1,$t0,end #error in code
add $0,$0,$0

l1:		#if(after)lhs is v,w,x,y,z: 
addi $t5,$t5,7
lbu $t0,($t5)
add $0,$0,$0
add $0,$t0,$0
addi $t2,$0,61
beq $t2,$t0,l3 # if = is true
add $0,$0,$0
add $s2,$0,$0
j end


l3:
addi $t5,$t5,1
lbu $t0,($t5)
add $0,$0,$0
add $0,$t0,$0
#compare if string character is any variable then convert variable to integer value and push to stack
beq $t0,118,conv #if char=v
add $0,$0,$0
beq $t0,119,conw #w
add $0,$0,$0
beq $t0,120,conx	#x
add $0,$0,$0
beq $t0,121,cony #y
add $0,$0,$0
beq $t0,122,conz #z
add $0,$0,$0
beq $t0,40,ob #open bracket
add $0,$0,$0
beq $t0,41,cb #close b
add $0,$0,$0
beq $t0,47,opr	#/
add $0,$0,$0
beq $t0,42,opr	#*
add $0,$0,$0
beq $t0,45,opr	#-
add $0,$0,$0
beq $t0,43,opr	#+
add $0,$0,$0
beq $t0,48,num	#0
add $0,$0,$0
beq $t0,49,num	#1
add $0,$0,$0
beq $t0,50,num	#2
add $0,$0,$0
beq $t0,51,num	#3
add $0,$0,$0
beq $t0,52,num	#4
add $0,$0,$0
beq $t0,53,num	#5
add $0,$0,$0
beq $t0,54,num	#6
add $0,$0,$0
beq $t0,55,num	#7
add $0,$0,$0
beq $t0,56,num	#8
add $0,$0,$0
beq $t0,57,num	#9
add $0,$0,$0
lbu $t0,($sp)
add $0,$0,$0
add $0,$t0,$0
bne $t0,$0,pop
add $0,$0,$0
j new
add $0,$0,$0

pop:
lbu $t0,($sp)
add $0,$0,$0
add $0,$t0,$0
beq $t0,$0,l3
add $0,$0,$0
sb $t0,($a1)
sw $0,($sp)
addi $sp,$sp,4
addi $a1,$a1,1
j pop
add $0,$0,$0

num:
add $s3,$t5,$0
beq $t0,48,num0
add $0,$0,$0
beq $t0,49,num1
add $0,$0,$0
beq $t0,50,num2
add $0,$0,$0
beq $t0,51,num3
add $0,$0,$0
beq $t0,52,num4
add $0,$0,$0
beq $t0,53,num5
add $0,$0,$0
beq $t0,54,num6
add $0,$0,$0
beq $t0,55,num7
add $0,$0,$0
beq $t0,56,num8
add $0,$0,$0
beq $t0,57,num9
add $0,$0,$0
j l3
add $0,$0,$0


sno:
addi $t0,$t0,-48
sll $t0,$t0,3
sll $s7,$t0,1
add $t0,$t0,$s7
lbu $s7,2($t5)
add $0,$0,$0
add $0,$s7,$0
beq $s7,48,sno1
add $0,$0,$0
beq $s7,49,sno1
add $0,$0,$0
beq $s7,50,sno1
add $0,$0,$0
beq $s7,51,sno1
add $0,$0,$0
beq $s7,52,sno1
add $0,$0,$0
beq $s7,53,sno1
add $0,$0,$0
beq $s7,54,sno1
add $0,$0,$0
beq $s7,55,sno1
add $0,$0,$0
beq $s7,56,sno1
add $0,$0,$0
beq $s7,57,sno1
add $0,$0,$0
j num
add $0,$0,$0

sno1:
sll $t0,$t0,3
sll $s7,$t0,1
add $t0,$t0,$s7
lbu $s7,3($t5)
add $0,$0,$0
add $0,$s7,$0
beq $s7,48,sno2
add $0,$0,$0
beq $s7,49,sno2
add $0,$0,$0
beq $s7,50,sno2
add $0,$0,$0
beq $s7,51,sno2
add $0,$0,$0
beq $s7,52,sno2
add $0,$0,$0
beq $s7,53,sno2
add $0,$0,$0
beq $s7,54,sno2
add $0,$0,$0
beq $s7,55,sno2
add $0,$0,$0
beq $s7,56,sno2
add $0,$0,$0
beq $s7,57,sno2
add $0,$0,$0
j num
add $0,$0,$0


num0:
addi $t0,$0,0
addi $s3,$s3,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0


num1:
addi $t0,$0,1
addi $s3,$t5,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0

num2:
addi $t0,$0,2
addi $s3,$t5,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0

num3:
addi $t0,$0,3
addi $s3,$t5,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0

num4:
addi $t0,$0,4
addi $s3,$t5,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0

num5:
addi $t0,$0,5
addi $s3,$t5,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0

num6:
addi $t0,$0,6
addi $s3,$t5,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0

num7:
addi $t0,$0,7
addi $s3,$t5,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0

num8:
addi $t0,$0,8
addi $s3,$t5,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0

num9:
addi $t0,$0,9
addi $s3,$t5,1 
lbu $t2,($s3)	#multidigit parser
add $0,$0,$0
add $0,$t2,$0
beq $t2,48,sno
add $0,$0,$0
beq $t2,49,sno
add $0,$0,$0
beq $t2,50,sno
add $0,$0,$0
beq $t2,51,sno
add $0,$0,$0
beq $t2,52,sno
add $0,$0,$0
beq $t2,53,sno
add $0,$0,$0
beq $t2,54,sno
add $0,$0,$0
beq $t2,55,sno
add $0,$0,$0
beq $t2,56,sno
add $0,$0,$0
beq $t2,57,sno
add $0,$0,$0
j strnum
add $0,$0,$0

strnum:
sb $t0,($a1) 
add $0,$0,$0
addi $a1,$a1,1
j l3
add $0,$0,$0

opr: 	#main for operator
lbu $t0,($sp)
add $0,$0,$0
add $0,$t0,$0
beq $t0,40,opr1
add $0,$0,$0
beq $t0,$0,opr1
add $0,$0,$0
beq $t0,47,muldiv
add $0,$0,$0
beq $t0,42,muldiv
add $0,$0,$0
beq $t0,43,common
add $0,$0,$0
beq $t0,45,common
add $0,$0,$0
j l3
add $0,$0,$0

muldiv:
lbu $t0,($t5)
add $0,$0,$0
add $0,$t0,$0
beq $t0,43,common
add $0,$0,$0
beq $t0,45,common
add $0,$0,$0
j end
add $0,$0,$0

opr1:
addi $sp,$sp,-8
lbu $t0,($t5)
add $0,$0,$0
add $0,$t0,$0
sw $t0,($sp)
addi $s2,$s2,1
j l3
add $0,$0,$0 

common:
lbu $t0,($sp)
add $0,$0,$0
add $0,$t0,$0
addi $sp,$sp,4
sb $t0,($a1)
sw $0,($sp)
addi $a1,$a1,1
addi $sp,$sp,4
lbu $t0,($sp)
add $0,$0,$0
add $0,$t0,$0
bne $t0,$0,opr3
add $0,$0,$0
add $0,$t0,$0
lbu $t0,($t5)
add $0,$0,$0
add $0,$t0,$0
addi $sp,$sp,-4
sb $t0,($sp)
j l3
add $0,$0,$0

opr3:
addi $sp,$sp,-4
j opr

cb:
addi $s2,$s2,-1
lbu $t0,($sp)
add $0,$0,$0
add $0,$t0,$0
bne $t0,40,cb1
add $0,$0,$0
sw $0,($sp)
j l3
add $0,$0,$0
cb1:
sb $t0,($a1)
sw $0,($sp)
addi $sp,$sp,4
addi $a1,$a1,1
j cb
add $0,$0,$0



ob:
add $sp,$sp,-4
sw $t0,($sp)
addi $s2,$s2,1
j l3
add $0,$0,$0


conv:
lhu $t0,($a0)
add $0,$0,$0
add $0,$t0,$0
sb $t0,($a1) #remove this and store to memory	#to parse through temp
addi $a1,$a1,1
j l3
add $0,$0,$0

conw:
lhu $t0,2($a0)
add $0,$0,$0
add $0,$t0,$0
sb $t0,($a1) 
add $0,$0,$0
addi $a1,$a1,1	#a1 stores mem loc of tempstr
j l3
add $0,$0,$0

conx:
lhu $t0,4($a0)
add $0,$0,$0
add $0,$t0,$0
sb $t0,($a1) #remove this and store to memory
addi $a1,$a1,1
j l3
add $0,$0,$0

cony:
lhu $t0,6($a0)
add $0,$0,$0
add $0,$t0,$0
sb $t0,($a1) #remove this and store to memory
addi $a1,$a1,1
j l3
add $0,$0,$0

conz:
lhu $t0,8($a0)
add $0,$0,$0
add $0,$t0,$0	
sb $t0,($a1) #remove this and store to memory
addi $a1,$a1,1
j l3
add $0,$0,$0

new:
lui $a0,0x1000
addi $s2,$0,0
addi $a0,$a0,10
add $a0,$a0,$s0
addi $s0,$s0,-2
#branch to push if not operator bne $t0,(,push
new1:
lbu $t0,($a0)
add $0,$0,$0
add $0,$t0,$0
beq $t0,47,pop1
add $0,$0,$0
beq $t0,37,pop1
add $0,$0,$0
beq $t0,42,pop1
add $0,$0,$0
beq $t0,43,pop1
add $0,$0,$0
beq $t0,45,pop1
add $0,$0,$0
bne $t0,47,divp
add $0,$0,$0

divp:
bne $t0,37,modp
add $0,$0,$0
modp:
bne $t0,42,mulp
add $0,$0,$0
mulp:
bne $t0,43,addp
add $0,$0,$0
addp:
bne $t0,45,subp
add $0,$0,$0
subp:
j push
add $0,$0,$0

push:
addi $sp,$sp,-4
sw $t0,($sp)
addi $a0,$a0,1
addi $s2,$s2,1
addi $s0,$s0,-1
bne $s0,$0,new1
add $0,$0,$0

pop1:
beq $t0,47,divr
add $0,$0,$0
beq $t0,37,modr
add $0,$0,$0
beq $t0,42,mulr
add $0,$0,$0
beq $t0,43,addr
add $0,$0,$0
beq $t0,45,subr
add $0,$0,$0

divr:
lbu $s1,($sp)#dividend
add $0,$0,$0
add $0,$s1,$0
sw $0,($sp)
addi $sp,$sp,4
lbu $s3,($sp)	#divisor
add $0,$0,$0
add $0,$s3,$0
sw $0,($sp)
addi $sp,$sp,4
add $s5,$0,$s1	#remainder
sll $s3,$s3,16 #adjusting divisor
add $t4,$0,$0	#quotient
addi $t6,$0,17	#initialise counter
divloop:
addi $t6,$t6,-1
sub $s5,$s5,$s3
bgez $t3,divmore
add $0,$0,$0 

divless:
add $s5,$s5,$s3
sll $t4,$t4,1
srl $s3,$s3,1
bgtz $t6,divloop
add $0,$0,$0
j end
add $0,$0,$0

divmore:
sll $t4,$t4,1
or $t4,1
srl $s3,$s3,1
bgtz $t6,divloop
add $0,$0,$0
j end
add $0,$0,$0

divend:
sw $t4,($sp)
addi $s2,$s2,-1 
addi $a0,$a0,1
lbu $t0,($a0)
add $0,$0,$0
add $0,$t0,$0
beq $t0,$0,lol
bne $s2,$0,new1
add $0,$0,$0

modr:
lbu $s1,($sp)#dividend
add $0,$0,$0
add $0,$s1,$0
sw $0,($sp)
addi $sp,$sp,4
lbu $s3,($sp)	#divisor
add $0,$0,$0
add $0,$s3,$0
sw $0,($sp)
addi $sp,$sp,4
add $s5,$0,$s1	#remainder
sll $s3,$s3,16 #adjusting divisor
add $t4,$0,$0	#quotient
addi $t6,$0,17	#initialise counter

modloop:
addi $t6,$t6,-1
sub $s5,$s5,$s3
bgez $t3,modmore
add $0,$0,$0 

modless:
add $s5,$s5,$s3
sll $t4,$t4,1
srl $s3,$s3,1
bgtz $t6,modloop
add $0,$0,$0
j end
add $0,$0,$0

modmore:
sll $t4,$t4,1
or $t4,1
srl $s3,$s3,1
bgtz $t6,modloop
add $0,$0,$0
j end
add $0,$0,$0

modend:
sw $s5,($sp)
addi $s2,$s2,-1 
addi $a0,$a0,1
lbu $t0,($a0)
add $0,$0,$0
add $0,$t0,$0
beq $t0,$0,lol
bne $s2,$0,new1
add $0,$0,$0

mulr:

addr: #s1 is opB s3 is opA -----------addition
lbu $s1,($sp)
add $0,$0,$0
add $0,$s1,$0
sw $0,($sp)
addi $sp,$sp,4
lbu $s3,($sp)
add $0,$0,$0
add $0,$s3,$0
add $s1,$s1,$s3
sw $0,($sp)
addi $sp,$sp,4
sw $s1,($sp)
addi $s2,$s2,-1
addi $a0,$a0,1
lbu $t0,($a0)
add $0,$0,$0
add $0,$t0,$0
beq $t0,$0,lol
bne $s2,$0,new1
add $0,$0,$0

subr:		#-------------------subtraction
lbu $s1,($sp)
add $0,$0,$0
add $0,$s1,$0
sw $0,($sp)
addi $sp,$sp,4
lbu $s3,($sp)
add $0,$0,$0
add $0,$s3,$0
sub $s1,$s3,$s1
sw $0,($sp)
addi $sp,$sp,4
sw $s1,($sp)
addi $s2,$s2,-1
addi $a0,$a0,1
lbu $t0,($a0)
add $0,$0,$0
add $0,$t0,$0
beq $t0,$0,lol
bne $s2,$0,new1
add $0,$0,$0



lol:
lbu $t1,($sp)
add $0,$0,$0
add $0,$t1,$0
add $a0,$0,$0
add $a1,$0,$0
lui $a0,0x1000
addi $a0,$a0,10
lui $a1,0x1000
lbu $t7,($a0)
add $0,$0,$0
add $0,$t7,$0
beq $t7,118,v1
add $0,$0,$0
beq $t7,119,w1
add $0,$0,$0
beq $t7,120,x1
add $0,$0,$0
beq $t7,121,y1
add $0,$0,$0
beq $t7,122,z1
add $0,$0,$0
j end
add $0,$0,$0


v1:
sh $t1,($a1)	
j end
add $0,$0,$0
w1:
sh $t1,2($a1)	
j end
add $0,$0,$0
x1:
sh $t1,4($a1)	
j end
add $0,$0,$0
y1:
sh $t1,6($a1)	
j end
add $0,$0,$0
z1:
sh $t1,8($a1)	
j end
add $0,$0,$0

end:


