from file_utils import read_from_downloads

def main():
    input = read_from_downloads("rosalind_hamm")

    lines = input.splitlines()

    if len(lines) != 2: 
        print("Invalid input")
        return
    
    counter = 0
    for i in range(len(lines[0])):
        if lines[0][i] != lines[1][i]:
            counter += 1

    print(counter)

    