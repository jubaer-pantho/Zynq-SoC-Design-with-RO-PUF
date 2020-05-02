# Zynq-SoC-Design-with-RO-PUF 

In this work, an RO PUF with 64 bits response has been implemented on Zybo-z7 10 FPGA. From the response, the quality metrics reliability and randomness have been measured.

The RO-PUF is connected to a zynq processor to read out the response. We improved the intra-hamming distance of the RO-PUF response by sampling and thresholding on the software.

The intra-hamming distance achieved is 0.5% and the average bit flip for changing one bit of challenge is 33.85%.
