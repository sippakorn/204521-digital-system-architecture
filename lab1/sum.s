# n = 10;
# sum = 0;
addi x18, x0, 10 # n
addi x19, x0, 0 # sum
addi x20, x0, 0 # i = 0
begin_loop:
bge x20, x18, end_loop
addi x21, x20, 1
add x19, x19, x21
addi x20, x20, 1 # i = i + 1
j begin_loop
end_loop:
addi x18, x18, 1