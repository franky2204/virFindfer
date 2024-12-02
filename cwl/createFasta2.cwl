cwlVersion: v1.2
class: CommandLineTool

baseCommand: ["awk"]

requirements:
  - class: DockerRequirement
    dockerPull: "debian:stable-slim"  # Immagine Docker leggera con awk

inputs:
  read1:
    type: File
    inputBinding:
      position: 2  # Il file di input è il secondo argomento

outputs:
  updated_fasta:
    type: File
    outputBinding:
      glob: $(inputs.read1.nameroot + "_noDup.fasta")  # Nome file basato su read1.nameroot

arguments:
  - valueFrom: |
      '/^>/{if($0 ~ / 1:/) print $1"_1"; else if($0 ~ / 2:/) print $1"_2"; else print $0} !/^>/'
    position: 1  # Lo script awk è il primo argomento
  - valueFrom: ">"
    position: 3  # Reindirizzamento dell'output
  - valueFrom: $(inputs.read1.nameroot + ".fasta")
    position: 4  # Nome file di output basato su read1.nameroot
