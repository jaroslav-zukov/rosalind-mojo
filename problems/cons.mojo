from file_utils import read_from_downloads
from string_parse_utils import parse_FASTA_to_dict

## Understanding problem: ~ 2 min
## Coding: 42 min

def main():
    input = read_from_downloads("rosalind_cons")
    # input = """
    # >Rosalind_1
    # ATCCAGCT
    # >Rosalind_2
    # GGGCAACT
    # >Rosalind_3
    # ATGGATCT
    # >Rosalind_4
    # AAGCAACC
    # >Rosalind_5
    # TTGGAACT
    # >Rosalind_6
    # ATGCCATT
    # >Rosalind_7
    # ATGGCACT
    # """
    
    reads = parse_FASTA_to_dict(input)

    # for read in reads.items():
    #     print(read.key, read.value)

    lengths = List[Int]()
    for read in reads.items():
        lengths.append(len(read.value))

    if lengths.count(lengths[0]) != len(lengths):
        raise Error("some of the dna has wrong length")
    else:
        n = lengths[0]

    profile = {
        "A": List[Int](length=n, fill=0),
        "C": List[Int](length=n, fill=0),
        "G": List[Int](length=n, fill=0),
        "T": List[Int](length=n, fill=0)
    }

    for read in reads.items():
        for i in range(n):
            profile[String(read.value[i])][i] += 1

    nucleotides = ["A", "C", "G", "T"]
    consensus = String()
    for i in range(n):
        temp = 0
        max_nuc = String()
        for nuc in nucleotides:
            if profile[nuc][i] > temp:
                temp = profile[nuc][i]
                max_nuc = nuc
        consensus += max_nuc


    ## Print the output
    print(consensus)
    for nuc_profile in profile.items():
        print("{}: {}".format(nuc_profile.key, " ".join(nuc_profile.value)))

    