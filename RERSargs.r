#  @author Dr Milto Miltiadou
#  @date 2nd March 2021
#  @version 2.0
#  @brief script that takes as input a multiline .csv file and exports and a line graph
#  @brief how to run: RERSargs.r <input.csv> <graph.png> <title> <xAxisTitle> <yAxisTitle> <width> <height>
#  @brief example: Rscript "/home/milto/Documents/ASTARTE/Scripts/WP6/RGraphs/RERSargs.r" "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level5/ERS-1/ERS-1_allHeight.csv"  "/home/milto/Documents/ASTARTE/ASTARTE_sample_data/level5/ERS-1/ERS-1.png" "Average Seasonal Backscattered Coefficient Values Between May 1992 and October 1994 using ERS-1 data" "Months" "Average Backscattered Coefficient (DB)" 900 400

args = commandArgs(trailingOnly=TRUE)

if (length(args)!=7) {
  stop("Exactly 7 parameters should be given as input as follow:\nRERSargs.r <input.csv> <graph.png> <title> <xAxisTitle> <yAxisTitle> ", call.=FALSE)
} 

### User defined Variables ###
# The name of the imported .csv file
fileName = args[1]
# The name of the image where the graph will be stored
exportFileName = args[2]
# The title that appears on the top of the graph
mainTitle  = args[3]
# The tile of the x-axis
xAxisTitle = args[4]
# The title of the y-axis
yAxisTitle = args[5]

w = as.integer(args[6])
h = as.integer(args[7])



# Read the .csv file
data <- read.csv(file=fileName,row.names=1, head=TRUE,sep=",",check.names=FALSE)

# extracts two lists with the labels of the axes
rowNames = row.names(data)
colNames = colnames(data)

png(filename=exportFileName, width = w, height = h)

# plot graph with the given titles
matplot(t(data), type="l", lty=1, lwd=2, main= mainTitle, xlab=xAxisTitle, ylab=yAxisTitle)


# modify numbering\labels of the axes to agree with the inserted table of the .csv file
axis(1, at=1:length(colNames), lab=colNames)

# Add legend to the table
legend("topleft", inset=0.01, legend=rowNames, col=c(1:6), bg= ("white"), horiz=F, lty=1)

dev.off()


