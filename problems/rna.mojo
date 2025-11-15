from file_utils import read_from_downloads

fn transcribe(rna: String) -> String:
    return rna.replace("T", "U")

def main():
    input = read_from_downloads("rosalind_rna")
    
    output = transcribe(input)

    print(output)

    