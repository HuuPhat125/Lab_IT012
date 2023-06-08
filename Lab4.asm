.data
str1: .asciiz "Nhap ky tu: "
str2: .asciiz "\nKy tu truoc: "
str3: .asciiz "\nKy tu sau: "
char1: .space 1
.text
.globl main
main:
#4a.1
	la $a0 str1
	li $v0 4
	syscall
	
	li $v0 12
	syscall
	move $t1, $v0
	
	la $a0 str2
	li $v0 4
	syscall
	

	sub $a0, $t1, 1
	li $v0 11
	syscall
	
	la $a0 str3
	li $v0 4
	syscall
	
	add $a0, $t1, 1    
    	li $v0, 11     
    	syscall         
