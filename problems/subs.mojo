from file_utils import read_from_downloads

## Finish time: 5 mins
def main():
    input = read_from_downloads("rosalind_subs")
    # input = """
    # GATATATGCATATACTT
    # ATAT
    # """

    input_strings = input.split()
    s = input_strings[0]
    t = input_strings[1]

    result = List[Int]()
    
    for i in range(len(s)-len(t)+1):
        if s[i:i+len(t)] == t:
            result.append(i+1)
    
    output = " ".join(result)
    
    print(output)

    