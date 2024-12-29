.data # define 2 array
source: .word 3, 1, 4, 1, 5, 9, 0 # int source[] = {3, 1, 4, 1, 5, 9, 0}; [int => use .word => 4 byte + contain 7 elements]
dest: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # int dest[10];

.text
la x18, source # load starting address of source to x18 [la : load absolute address]
la x19, dest # load starting address of source to x19
addi x20, x0, 0 # k = 0
start_loop:
# load source[k] ; lw x20, offset(x18) # temp = source[k]
# calculate address for source[k] => address of soure (x18) + (k*4) [shift left == multiply]
slli x21, x20, 2 # tmp = k * 4
add x22, x21, x18 # x22 <=> address of source[k] = tmp + address of source
lw x22, 0(x22) # x22 <=> source[k]
beq x22, x0, end_loop # if source[k] == 0 goto exit_loop
# find address of dest[k]
add x23, x21, x19 # x23 <=> address of dest[k]
sw x22, 0(x23) # dest[k] (x23) = source[k] (x22) 
addi x20, x20, 1 # k++
j start_loop
end_loop:
add x0, x0, x0