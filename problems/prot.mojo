from file_utils import read_from_downloads

def translate(rna: String) -> String:
    protein_table_string = """
    UUU F      CUU L      AUU I      GUU V
    UUC F      CUC L      AUC I      GUC V
    UUA L      CUA L      AUA I      GUA V
    UUG L      CUG L      AUG M      GUG V
    UCU S      CCU P      ACU T      GCU A
    UCC S      CCC P      ACC T      GCC A
    UCA S      CCA P      ACA T      GCA A
    UCG S      CCG P      ACG T      GCG A
    UAU Y      CAU H      AAU N      GAU D
    UAC Y      CAC H      AAC N      GAC D
    UAA Stop   CAA Q      AAA K      GAA E
    UAG Stop   CAG Q      AAG K      GAG E
    UGU C      CGU R      AGU S      GGU G
    UGC C      CGC R      AGC S      GGC G
    UGA Stop   CGA R      AGA R      GGA G
    UGG W      CGG R      AGG R      GGG G 
    """
    split_things = protein_table_string.split()
    rna_to_prot_dict = Dict[String, String]()
    for i in range(start=0,end=len(split_things), step=2):
        rna_to_prot_dict[String(split_things[i])] = String(split_things[i+1])

    result = String()
    for i in range(0, len(rna), 3):
        protein = String(rna_to_prot_dict[rna[i:i+3]])
        if protein == "Stop":
            break
        result += protein
    return result

def main():
    input = read_from_downloads("rosalind_prot")
    # input = "AUGGCCUGAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA"
    
    output = translate(input)

    print(output)

    