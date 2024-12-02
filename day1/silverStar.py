with open('day1/input.txt', 'r') as file:
    left_list = []
    right_list = []
    for line in file:
        if line.strip():
            left_num, right_num = map(int, line.strip().split())
            left_list.append(left_num)
            right_list.append(right_num)

left_list.sort()
right_list.sort()

total_distance = sum(abs(l - r) for l, r in zip(left_list, right_list))

print(total_distance)