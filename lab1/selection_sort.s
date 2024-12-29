.data
arr:    .word 64, 25, 12, 22, 11, 3, 12, 55, 4, 28  # Initialize array

.text
# Load n (size of the array)
la x18, arr          # x18 = address of arr
addi x19, x0, 10
# lw t1, 0(x18)      # t1 = n (size of array, 10)
addi x20, x0, 0 # x20 = i (i = 0)
outer_loop:
# Check if i < n - 1
addi x21, x19, -1   # x21 = n - 1
bge x20, x21, end_loop   # if i >= n - 1, break the outer loop
# Set min_idx = i
addi x22, x20, 0         # x22 = min_idx = i
# Initialize j = i + 1
addi x23, x20, 1    # x23 = j = i + 1

inner_loop:
# Check if j < n
bge x23, t1, end_inner_loop   # if j >= n, break inner loop

# Load arr[j] and arr[min_idx] for comparison
la x24, arr        # x24 = address of arr
lw x25, 0(x24)      # x25 = arr[i] (value at arr[i])
lw x27, 0(x24)      # x27 = arr[min_idx] (value at arr[min_idx])

# Compare arr[j] and arr[min_idx]
bge x25, x27, inner_continue   # if arr[j] >= arr[min_idx], continue inner loop

# Update min_idx to j
addi x22, x23, 0         # min_idx = j

inner_continue:
    # Increment j
    addi x23, x23, 1    # j = j + 1
    j inner_loop      # Continue inner loop

end_inner_loop:

    # Check if min_idx != i (if min_idx is not the same as i, swap)
    bne x22, x20, swap_values

    # Increment i and continue to the next iteration of outer loop
    addi x20, x20, 1    # i = i + 1
    j outer_loop      # Continue outer loop

swap_values:
    # Swap arr[min_idx] and arr[i]
    la x24, arr        # Load address of arr
    addi x26, x0, 4
    mul x25, x22, x26     # x25 = min_idx * 4 (offset for arr[min_idx])
    add x25, x25, x24    # x25 = address of arr[min_idx]
    lw x27, 0(x25)      # x27 = arr[min_idx]

    mul x28, x20, x26     # x28 = i * 4 (offset for arr[i])
    add x28, x28, x24    # x28 = address of arr[i]
    lw x29, 0(x28)     # x29 = arr[i]

    # Swap the values
    sw x27, 0(x28)      # arr[i] = arr[min_idx]
    sw x29, 0(x25)     # arr[min_idx] = arr[i]

    # Increment i and continue to next iteration of outer loop
    addi x20, x20, 1    # i = i + 1
    j outer_loop      # Continue outer loop

end_loop:
add x0, x0, x0
