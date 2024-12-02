cwlVersion: v1.2
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerPull: "staphb/seqtk"
  - class: InlineJavascriptRequirement

baseCommand: ["bash", "-c"]  

inputs:
  read1:
    type: File
    inputBinding:
      position: 1
  read2:
    type: File
    inputBinding:
      position: 2

outputs:
  fasta_file:
    type: File
    outputBinding:
      glob: "*.fasta"  # Updated to reflect piped command output

arguments:
  - valueFrom: "seqtk mergepe $(inputs.read1.path) $(inputs.read2.path) | seqtk seq -A - > $(inputs.read1.nameroot).fasta"
    shellQuote: false

stdout: merged.log  # Redirect logs
