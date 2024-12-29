.data
arr: .word 64, 25, 12, 22, 11, 3, 12, 55, 4, 28

.text
la x18, arr # x18 <=> address of arr
addi x19, x0, 10 # n = 10
lw x21, 0(x18) # min_val = arr[0];
addi x20, x0, 0 # i = 0
start_loop:
bge x20, x19, end_loop # if (i >= n) goto end_loop
# find address for arr[i] = (i * 4) + address arr
slli x22 ,x20, 2 # temp = i * 4
add x22, x22, x18 # temp <=> address for arr[i]
lw x22, 0(x22) # x22 <=> arr[i]
bge x22, x21, end_if_else # if (arr[i] >= min_val) goto end_if_else
add x21, x0, x22
end_if_else:
addi x20, x20, 1 # i++
j start_loop
end_loop:
add x0, x0, x0