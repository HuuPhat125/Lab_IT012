.data
prompt1: .asciiz "Nhap so thu nhat: "
prompt2: .asciiz "Nhap so thu hai: "
greater_msg: .asciiz "So lon hon: "
sum_msg: .asciiz "\nTong: "
diff_msg: .asciiz "\nHieu: "
product_msg: .asciiz "\nTich: "
quotient_msg: .asciiz "\nThuong: "

.text
.globl main

main:
    # In ra yêu cầu nhập số thứ nhất
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Nhận số thứ nhất từ người dùng
    li $v0, 5
    syscall
    move $t0, $v0
    
    # In ra yêu cầu nhập số thứ hai
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Nhận số thứ hai từ người dùng
    li $v0, 5
    syscall
    move $t1, $v0
    
    # In ra số lớn hơn
    bgt $t0, $t1, print_t0
    bgt $t1, $t0, print_t1
    li $v0, 4
    la $a0, greater_msg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    j print_end
    
print_t0:
    li $v0, 4
    la $a0, greater_msg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    j print_end
    
print_t1:
    li $v0, 4
    la $a0, greater_msg
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    j print_end

print_end:
    # Tính toán và in ra tổng, hiệu, tích và thương
    add $t2, $t0, $t1
    sub $t3, $t0, $t1
    mul $t4, $t0, $t1
    
    div $t0, $t1
    mflo $t0
    
    li $v0, 4
    la $a0, sum_msg
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 4
    la $a0, diff_msg
    syscall
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 4
    la $a0, product_msg
    syscall
    li $v0, 1
    move $a0, $t4
    syscall
    
    li $v0, 4
    la $a0, quotient_msg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Kết thúc chương trình
    li $v0, 10
    syscall