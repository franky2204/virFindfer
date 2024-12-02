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
      glob: "*.fasta"

arguments:
  - valueFrom: |
      seqtk mergepe $(inputs.read1.path) $(inputs.read2.path) | \
      seqtk seq -A - > temp.fasta && \
      awk '/^>/{if($0 ~ / 1:/) print $1"_1"; else if($0 ~ / 2:/) print $1"_2"; else print $0} !/^>/' temp.fasta > $(inputs.read1.nameroot).fasta
    shellQuote: false

stdout: merged.log

