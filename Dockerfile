FROM ubuntu:mantic-20230926

ARG FASTQC_VER="0.11.8"

# install dependencies; cleanup apt garbage
RUN apt-get update && apt-get install -y \
 unzip \
 wget \
 make \
 perl \
 default-jre && \
 apt-get autoclean && rm -rf /var/lib/apt/lists/*

# install fastqc
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${FASTQC_VER}.zip && \
    unzip fastqc_v${FASTQC_VER}.zip && \
    rm fastqc_v${FASTQC_VER}.zip && \
    chmod +x FastQC/fastqc
ENV PATH="${PATH}:/FastQC/"

# install cellranger
# https://www.10xgenomics.com/support/software/cell-ranger/downloads
RUN wget -O cellranger-7.2.0.tar.gz 
"https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.2.0.tar.gz?Expires=1696501677&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=Taqy-nHIt22BhhMQwqkl767WGDmkuVpu-Q9wQ4qIenGgHE9Y~UhTtfuKaDyH0NMCYw~oUPJM2Q-2Yk6tZA~Gk~jCM~4J183pOfRUNHW~LePHtgK~aQuzLObi~mHP8N7efBflOrI4dZxZGmbP388x-S6Cy43dCutHQzJV0flI2dmFoqIJZn9uYcyyjWz4wYUvagtDcm0c9pF4GjbyvTdE1s2r4IO5I3unWRO9ZrubzcFa3ygt~5gbRgcp59SmxvASakWeXdics92hgUL-vaQzG7B77nMAi9fNgmpJOSCjFPWeUSXbDcUPINaiDDiF1m0RYNNkLG1jSWukZjzQxxwXDA__" 
&& \
    tar -zxvf cellranger-7.2.0.tar.gz && \
    cd cellranger-7.2.0
ENV PATH="${PATH}:/cellranger-7.2.0/"

# set working directory
WORKDIR /home
