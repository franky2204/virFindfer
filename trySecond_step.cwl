cwlVersion: v1.2
class: Workflow

inputs:
    fasta_file: File
outputs:
  output_file:
    type: File
    outputSource:  create_fasta2/updated_fasta
  

steps:
  create_fasta2:
    run: cwl/createFasta2.cwl
    in:
      read1: fasta_file
    out: [updated_fasta]

  