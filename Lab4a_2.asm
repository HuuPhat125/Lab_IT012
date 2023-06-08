#4a.2
	.data
	prompt: .asciiz "Nhap mot ky tu: "
	lowercase_msg: .asciiz "\nChu thuong"
	uppercase_msg: .asciiz "\nChu hoa"
	 digit_msg: .asciiz "\nSo"
	invalid_msg: .asciiz "\nInvalid type."
	.text
	.globl main
	main:
	li $v0, 4        # in ra prompt
	la $a0, prompt
	syscall
	
	li $v0, 12	  # nhap ky tu tu ban phim
	syscall
	move $t0, $v0
	
    	li $t1, 'A'      # Kiem tra co phai la chu hoa khong
    	li $t2, 'Z'   
    	sle $t3, $t1, $t0   
    	sle $t4, $t0, $t2   
    	and $t5, $t3, $t4   
    	beqz $t5, lowercase_check
    
    	li $v0, 4	# In ra ket qua chu hoa
    	la $a0, uppercase_msg
    	syscall
    	j exit
	
	lowercase_check:  # kiem tra co phai la chu thuong khong
	li $t1, 'a'
	li $t2, 'z'
	sle $t3, $t1, $t0   
    	sle $t4, $t0, $t2   
    	and $t5, $t3, $t4   
    	beqz $t5, digit_check
    	
    	li $v0, 4	# In ra ket qua chu thuong
    	la $a0, lowercase_msg
    	syscall
    	j exit
    	
    	digit_check: # kiem tra chu so
    	li $t1, '0'
	li $t2, '9'
	sle $t3, $t1, $t0  
    	sle $t4, $t0, $t2   
    	and $t5, $t3, $t4   
    	beqz $t5, invalid
    	
    	# In ra kết quả là số
    li $v0, 4
    la $a0, digit_msg
    syscall
    j exit
    
invalid:
    # In ra thông báo không hợp lệ
    li $v0, 4
    la $a0, invalid_msg
    syscall
    
exit:
    # Kết thúc chương trình
    li $v0, 10
    syscall
	