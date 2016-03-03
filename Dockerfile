#################################################################
# Dockerfile
#
# Version:          1
# Software:         NCBI BLAST+
# Software Version: 2.2.28-2
# Description:      basic local alignment search tool
# Website:
# http://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download
# Tags:             Genomics|Proteomics|Transcriptomics|General
# Provides:         blast 2.2.28-2
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/ncbi-blast 2.2.28-2/.
# Pull Cmd:         docker pull biodckr/ncbi-blast
# Run Cmd:          docker run --rm biodckr/ncbi-blast <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker:latest

LABEL ANNOT.Name="blast+" \
  ANNOT.Version="2.2.28" \
  ANNOT.Description="bla bla bla" \
  ANNOT.Homepage="http://bioinf.spbau.ru/en/spades" \
  ANNOT.Reference="['Anton Bankevich, Sergey Nurk, Dmitry Antipov, Alexey A. Gurevich, Mikhail Dvorkin, Alexander S. Kulikov, Valery M. Lesin, Sergey I. Nikolenko, Son Pham, Andrey D. Prjibelski, Alexey V. Pyshkin, Alexander V. Sirotkin, Nikolay Vyahhi, Glenn Tesler, Max A. Alekseyev, and Pavel A. Pevzner. SPAdes: A New Genome Assembly Algorithm and Its Applications to Single-Cell Sequencing. Journal of Computational Biology 19(5) (2012), 455-477. doi:10.1089/cmb.2012.0021']" \
  ANNOT.Vendor="Institut Pasteur" \
  ANNOT.EDAM_Operation="['operation_2520', 'operation_0310']" \
  ANNOT.EDAM_Topic="" \
  ANNOT.Requires="['boost/1_52_0', 'gcc/4.9.0', 'cmake/2.8.12.2']" \
  ANNOT.Provides="['dipspades.py', 'spades.py']"


################## BEGIN INSTALLATION ######################

USER root

# Install BLAST toolkit
#RUN apt-get update && \
#    apt-get install -y \
#      ncbi-blast+=2.2.28-2 && \
#    apt-get clean && \
#    apt-get purge && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y \
      apache2 && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#USER biodocker

CMD ["blastn", "-help"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Olivier Sallou <olivier.sallou@irisa.fr>

