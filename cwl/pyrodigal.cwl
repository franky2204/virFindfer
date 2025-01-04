cwlVersion: v1.2
class: CommandLineTool
hints:
  ResourceRequirement:
    coresMax: $(inputs.threads)
  DockerRequirement:
    dockerPull: fpant/pyrodigal

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing: 
      - entry: $(inputs.input_fasta)
        writable: True

baseCommand: [pyrodigal-gv]
inputs:
  input_fasta:
    type: File
    inputBinding:
      position: 1
      prefix: -i
  threads:
    type: int
    default: 5
    inputBinding:
      prefix: -j

outputs:
  annotated_file:
    type: File
    outputBinding:
      glob: "*_annotate.fasta"
  proteins:
    type: File
    outputBinding:
      glob: "*protein*"



arguments:
  - prefix: -o
    valueFrom: $(inputs.input_fasta.nameroot + "_annotate.fasta")
  - prefix: -a
    valueFrom: "protein"
  - prefix: --pool
    valueFrom: "thread"


