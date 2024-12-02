from collections import Counter

left_list = []
right_list = []

with open('day1/input.txt', 'r') as file:
    for line in file:
        if line.strip():
            left_num, right_num = map(int, line.strip().split())
            left_list.append(left_num)
            right_list.append(right_num)

right_counts = Counter(right_list)

similarity_score = sum(num * right_counts.get(num, 0) for num in left_list)

print(similarity_score)
