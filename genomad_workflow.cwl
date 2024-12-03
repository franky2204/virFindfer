cwlVersion: v1.2
class: Workflow

inputs:
  #read1: File
  #read2: File
  fasta_file: File  
  database: Directory
  threads: int?
outputs:
  output_file:
    type: Directory
    outputSource: run_genomad/output_file
  

steps:
  #create_fasta:
  #  run: cwl/createFasta.cwl
  #  in:
  #    read1: read1
  #    read2: read2
  #  out: [fasta_file]
  create_fasta2:
    run: cwl/createFasta2.cwl
    in:
      read1: fasta_file
    out: [updated_fasta]
  run_genomad:
    run: cwl/genomad.cwl
    in:
        input_fasta: create_fasta2/updated_fasta
        database: database
        threads: threads
    out: [output_file]
  