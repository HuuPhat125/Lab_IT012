.data
# Mảng có thể chứa tối đa 100 phần tử
array: .space 400
prompt:     .asciiz "Nhap so phan tu cua mang: "
element_prompt: .asciiz "Nhap gia tri cho phan tu thu "
max_msg:    .asciiz "Gia tri lon nhat: "
min_msg:    .asciiz "\nGia tri nho nhat: "
sum_msg:    .asciiz "\nTong cac phan tu: "
index_prompt: .asciiz "\nNhap chi so cua phan tu muon in: "
element_msg: .asciiz "Gia tri cua phan tu co chi so duoc nhap: "

.text
.globl main

main:
#nhap vao so phan tu cua mang
li $v0, 4
la $a0, prompt
syscall
li $v0, 5
syscall
addu $t0, $v0, $zero
# Khởi tạo biến tạm để lưu giá trị lớn nhất và nhỏ nhất
li $t1, -32768 # gia tri lon nhat
li $t2, 32767  # gia trị nho nhat
# Khởi tạo biến tổng các phần tử
li $t3, 0
# Khởi tạo hỉ số của phần tử muốn in ra
li $t4, 0   

la $t5, array    # Đặt địa chỉ của mảng vào $t1    
li $t6, 0        # Khởi tạo đếm
update_max:
	addu $t1, $v0, $zero
	j continue
update_min:
	addu $t2, $v0, $zero
	j continue
loop_input:
        # Xuất ra yêu cầu nhập giá trị cho phần tử thứ i
        li $v0, 4
        la $a0, element_prompt
        syscall
        move $a0, $t6   # In ra chỉ số phần tử
        li $v0, 1
        syscall
        
        # Nhập giá trị từ người dùng
        li $v0, 5
        syscall
        #tinh tong
        add $t3, $t3, $v0
        # cap nhat so lon nhat
        bgt $v0, $t1, update_max
        
        #cap nhat so nho nhat
        bgt $t2, $v0, update_min
continue:
        sw $v0, 0($t5)   # Lưu giá trị vào mảng
        
        # Tăng biến đếm lên 1
        addi $t6, $t6, 1
        
        # Tăng con trỏ mảng lên 4 bytes
        addi $t5, $t5, 4
        
        # Kiểm tra xem đã nhập đủ số phần tử chưa
        bne $t6, $t0, loop_input
li $v0, 1
addu $a0, $t1, $zero
syscall

