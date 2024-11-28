cwlVersion: v1.2
class: Workflow

inputs:
#  read1: File
#  read2: File
  fasta_file: File
outputs:
  output_file:
    type: File
    outputSource: run_ppr/output_file
  

steps:
#  create_fasta:
#    run: cwl/createFasta.cwl
#    in:
#      read1: read1
#      read2: read2
#   out: [fasta_file]
  run_ppr:
    run: cwl/PPRMeta.cwl
    in:
      input_fasta: fasta_file
    out: [output_file]
  
