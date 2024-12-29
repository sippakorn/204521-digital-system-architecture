add x18, x0, x0 # a = 0
addi x19, x0, 1 # b = 1
addi x20, x0, 8 # n = 8
bne x20, x0, else_if # if n != 0 goto else_if
add x21, x0, x18 # fib_n = a
j end_if
else_if:
addi x24, x0, 1 # 1 -> x24
bne x20, x24, else # if n != 1 goto else
add x21, x0, x19 # fib_n = b
j end_if
else:
addi x22, x0, 2 # i = 2
begin_loop:
bgt x22, x20, end_loop # if i > n goto exit_loop
add x23, x18, x19 # c = a + b
add x18, x0, x19 # a = b
add x19, x0, x23 # b = c
addi x22, x22, 1 # i++
j begin_loop
end_loop:
add x21, x0, x19 # fib_n = b
end_if:
add x23, x0, x0 # c = 0