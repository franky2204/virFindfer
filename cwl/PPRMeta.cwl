cwlVersion: v1.2
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerPull: shufangwu/ppr-meta:1.0
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.input_fasta)  
baseCommand: ["bash", "-c", "cd /home/PPR-Meta && ./PPR_Meta"]

inputs:
  input_fasta:
    type: File
    inputBinding:
      position: 1  

arguments:
  - valueFrom: "$(inputs.input_fasta.path) $(inputs.input_fasta.nameroot)_out"
    shellQuote: false

outputs:
  output_file:
    type: File
    outputBinding:
      glob: "*_out.csv"

stdout: log.txt
