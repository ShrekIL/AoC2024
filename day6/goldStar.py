from enum import Enum
from collections import defaultdict

class Direction(Enum):
    UP = 0
    RIGHT = 1
    DOWN = 2
    LEFT = 3
    
    def turn_right(self):
        return Direction((self.value + 1) % 4)

def get_next_pos(pos, direction):
    x, y = pos
    if direction == Direction.UP:
        return (x, y-1)
    elif direction == Direction.RIGHT:
        return (x+1, y)
    elif direction == Direction.DOWN:
        return (x, y+1)
    else:  # LEFT
        return (x-1, y)

class GuardSimulator:
    def __init__(self, grid):
        self.grid = grid
        self.height = len(grid)
        self.width = len(grid[0])
        self.start_pos = self.find_start()
        self.visited_with_dir = set()
        self.path_history = []
        
    def find_start(self):
        for y in range(self.height):
            for x in range(self.width):
                if self.grid[y][x] == '^':
                    return (x, y)
        return None
        
    def simulate(self, pos, direction, obstacle_pos=None):
        current_pos = pos
        current_dir = direction
        visited_states = set()
        
        while True:
            state = (current_pos, current_dir)
            if state in visited_states:
                return True
                
            visited_states.add(state)
            next_pos = get_next_pos(current_pos, current_dir)
            
            # Check boundaries
            if not (0 <= next_pos[0] < self.width and 0 <= next_pos[1] < self.height):
                return False

            if next_pos == obstacle_pos or self.grid[next_pos[1]][next_pos[0]] == '#':
                current_dir = current_dir.turn_right()
                continue
                
            current_pos = next_pos
            
            if len(visited_states) > self.width * self.height * 4:
                return False
                
    def count_loop_positions(self):
        count = 0
        start_pos = self.start_pos
        
        for y in range(self.height):
            for x in range(len(self.grid[0])):
                if self.grid[y][x] == '.' and (x,y) != start_pos:
                    # Try placing obstacle here
                    if self.simulate(start_pos, Direction.UP, (x,y)):
                        count += 1
                        
        return count

def solve(input_text):
    grid = [list(line) for line in input_text.splitlines()]
    simulator = GuardSimulator(grid)
    return simulator.count_loop_positions()

with open('R/day6/input.txt') as f:
    input_text = f.read()
result = solve(input_text)
print(f"Number of possible positions: {result}")