.data
str1: .asciiz "Chao ban! Ban la sinh vien nam thu may?\n"
str2: .asciiz "Hihi, minh la sinh vien nam thu 1 ^-^\n"

input_space: .space 100

.text
.globl main
main:	
	#in chuoi 1
	la $a0 str1
	li $v0 4
	syscall
	#in ra chouoi 2
	la $a0 str2
	li $v0 4
	syscall
	
	#doc vao mot chuoi va xuat ra chuoi do
	la $a0 input_space
	li $a1 100
	li $v0 8
	syscall
	li $v0 4
	la $a0 input_space
	syscall
	
	#nhap vao 2 so nguyen va xuat ra tong
	li $v0 5
	syscall
	move $t0 $v0
	
	li $v0 5
	syscall
	move $t1 $v0
	
	add $a0 $t0 $t1
	li $v0 1
	syscall
	
	
	# ket thuc chuong trinh
	li $v0 10
	syscall
