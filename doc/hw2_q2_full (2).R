

# make sure R is in the proper working directory
# note that this will be a different path for every machine
#setwd("")

# first include the relevant libraries
# note that a loading error might mean that you have to
# install the package into your R distribution.  From the
# command line, type install.packages("pixmap")
library(pixmap)

# the list of pictures (note the absence of 14 means that 31 corresponds to yaleB32)
# the list of pictures (note the absence of 14 means that 31 corresponds to yaleB32)
pic_list = 1:38
view_list = c('P00A+000E+00', 'P00A+005E+10' , 'P00A+005E-10' , 'P00A+010E+00')

# get directory structure
dir_list_1 = dir(path="CroppedYale/",all.files=FALSE)
dir_list_2 = dir(path="CroppedYale/",all.files=FALSE,recursive=TRUE)


#################
# # Problem 2a
#################

# preallocate an empty list
pic_data = vector("list",length(pic_list)*length(view_list))
# preallocate an empty list to store the pgm for debugging
pic_data_pgm = vector("list",length(pic_list)*length(view_list))

# outer loop through the pictures 
for ( i in 1:length(pic_list) ){
	# inner loop over views
	for ( j in 1:length(view_list) ){
		# compile the correct file name
		# note that dir_list_1[pic_list[2]] should be "yaleB17" if pic_list[2] is B17
		this_filename = sprintf("CroppedYale/%s/%s_%s.pgm", dir_list_1[pic_list[i]] , dir_list_1[pic_list[i]] , view_list[j])
		# you can print out each name to help debug the code
		# print(this_filename)
		# load the data
		this_face = read.pnm(file = this_filename)
		this_face_matrix = getChannels(this_face)
		if((i==1)&&(j==1)){ # Preallocate matrix to store picture vectors, store sizes for computations
			original_size = dim(this_face_matrix)
			pic_vector_length = prod(original_size)
			pic_mat = mat.or.vec(length(pic_list)*length(view_list),pic_vector_length)
		}
		# store pgm as element of the list
		pic_data_pgm[[(i-1)*length(view_list)+j]] = this_face
		# store matrix as element of the list
		pic_data[[(i-1)*length(view_list)+j]] = this_face_matrix
		# make the face into a vector and include in the data matrix
		pic_mat[(i-1)*length(view_list)+j,] =  as.vector(this_face_matrix)
		# if you would like to plot each picture, run the following:
		#Sys.sleep(0.5)
		#plot(this_face)
	}	
}

pic_mat_size = dim(pic_mat)

# print the result in a nice format
print(sprintf('The matrix of all faces has size %d by %d' , pic_mat_size[1] , pic_mat_size[2] ))

