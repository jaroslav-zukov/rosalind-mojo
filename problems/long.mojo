from file_utils import read_from_downloads
from string_parse_utils import parse_FASTA_to_dict

## Understanding problem: 5 min
## Coding: ±3h

def main():
    input = read_from_downloads("rosalind_long_2")
    # input = """
    # >Rosalind_56
    # ATTAGACCTG
    # >Rosalind_57
    # CCTGCCGGAA
    # >Rosalind_58
    # AGACCTGCCG
    # >Rosalind_59
    # GCCGGAATAC
    # """
    
    reads = parse_FASTA_to_dict(input)

    overlap_dict = Dict[String, List[Tuple[String, Int]]]()

    for suff_read in reads.items():
        for pref_read in reads.items():            
            var min_k = max(len(suff_read.value)//2, len(pref_read.value)//2)
            var max_k = min(len(suff_read.value), len(pref_read.value))

            for k in range(min_k, max_k):
                if suff_read.value[-k:] == pref_read.value[:k] and suff_read.value != pref_read.value:
                    if suff_read.key not in overlap_dict:
                        overlap_dict[suff_read.key] = List[Tuple[String, Int]]()
                    overlap_dict[suff_read.key].append((pref_read.key, k))


    for elem in overlap_dict.items():
        if len(elem.value) > 0:
            for overlap_tuple in elem.value:
                read_id, k_val = overlap_tuple
                print(elem.key, "->", read_id, "k =", k_val)
    
    ## nodes is a collection of contigs
    ## [(start_id,end_id,dna)]
    contigs = List[Tuple[String, String, String]]()

    ## Initialize with monotigs, single read_id
    for read in reads.items():
        contigs.append(Tuple(read.key, read.key, read.value))

    # suffix_id, prefix_id, overlap size k
    ambiguous_overlaps = List[Tuple[String, String, Int]]()
    ## Join the overlaps without ambiguity
    for overlap in overlap_dict.items():
        if len(overlap.value) == 1:
            edge_end_id, k = overlap.value[0]
            start_contig = Tuple(String(), String(), String())
            end_contig = Tuple(String(), String(), String())
            
            i = 0
            for contig in contigs:
                if contig[1] == overlap.key:
                    start_contig = contigs.pop(i)
                    break
                i += 1

            i = 0
            for contig in contigs:
                if contig[0] == edge_end_id:
                    end_contig = contigs.pop(i)
                i+=1

            new_start_id = start_contig[0]
            new_end_id = end_contig[1]
            new_dna = start_contig[2] + end_contig[2][k:]
            new_contig = Tuple(new_start_id, new_end_id, new_dna)
            
            contigs.append(new_contig)
        else:
            for target in overlap.value:
                ambiguous_overlaps.append(Tuple(overlap.key, target[0], target[1]))
        
        # print("Current state of contigs:")
        # for contig in contigs:
        #     print(contig[0], contig[1], contig[2])
        # print()

    if len(contigs) == 1:
        print("It's just one contig")
        print(contigs[0][2])

    

    # print("Resolving ambiguous overlaps")


    
    




    # for contig in contigs:
    #     print(contig[2])
    