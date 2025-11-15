from file_utils import read_from_downloads

fn reverse_complement(dna: String) -> String:
    var result = String()
    for c in dna.strip().codepoint_slices():
    
        complement = String()
        if c == "A": complement = "T"
        elif c == "G": complement = "C"
        elif c == "C": complement = "G"
        elif c == "T": complement = "A"
        result = complement + result

    return result

def main():
    input = read_from_downloads("rosalind_revc.txt")
    # input = "GTCA"
    
    output = reverse_complement(input)

    print(output)

    