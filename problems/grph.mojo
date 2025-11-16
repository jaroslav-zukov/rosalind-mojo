from file_utils import read_from_downloads
from string_parse_utils import parse_FASTA_to_dict

## Understanding problem: 6 min
## Coding: 14 min

def main():
    input = read_from_downloads("rosalind_grph")
    # input = """
    # >Rosalind_0498
    # AAATAAA
    # >Rosalind_2391
    # AAATTTT
    # >Rosalind_2323
    # TTTTCCC
    # >Rosalind_0442
    # AAATCCC
    # >Rosalind_5013
    # GGGTGGG
    # """
    
    reads = parse_FASTA_to_dict(input)
    k = 3
    
    # for read in reads.items():
    #     print(read.key, read.value)

    adjasency_list = List[String]()
    for suff_read in reads.items():
        for pref_read in reads.items():
            if suff_read.value[-k:] == pref_read.value[:k] and suff_read.value != pref_read.value:
                adjasency_list.append(" ".join(suff_read.key, pref_read.key))
            
    for edge in adjasency_list:
        print(edge)

    # print(output)

    