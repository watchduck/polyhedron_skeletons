// cube

#declare Factor = Scale * 3 * sqrt(2) / 2;
#declare Cub = array[8]{ <-Factor,-Factor,-Factor>, <-Factor,-Factor,Factor>, <-Factor,Factor,-Factor>, <-Factor,Factor,Factor>, <Factor,-Factor,-Factor>, <Factor,-Factor,Factor>, <Factor,Factor,-Factor>, <Factor,Factor,Factor>, }
#declare CubFaceNormalPoints = array[6]{<1, 0, 0>*Factor, <0, 0, -1>*Factor, <0, -1, 0>*Factor, <0, 0, 1>*Factor, <0, 1, 0>*Factor, <-1, 0, 0>*Factor};
#declare CubFaces = array[6]{array[5]{Cub[7], Cub[5], Cub[4], Cub[6], Cub[7]}, array[5]{Cub[0], Cub[2], Cub[6], Cub[4], Cub[0]}, array[5]{Cub[4], Cub[0], Cub[1], Cub[5], Cub[4]}, array[5]{Cub[1], Cub[5], Cub[7], Cub[3], Cub[1]}, array[5]{Cub[7], Cub[3], Cub[2], Cub[6], Cub[7]}, array[5]{Cub[0], Cub[2], Cub[3], Cub[1], Cub[0]}};
#declare CubEdgeArrays = array[12]{array[2]{6, 7}, array[2]{1, 5}, array[2]{1, 3}, array[2]{4, 5}, array[2]{0, 1}, array[2]{2, 3}, array[2]{0, 4}, array[2]{4, 6}, array[2]{0, 2}, array[2]{3, 7}, array[2]{2, 6}, array[2]{5, 7}};


// octahedron

#declare Factor = Scale * 3 * sqrt(2);
#declare Oct = array[6]{ <-Factor,0,0>, <0,-Factor,0>, <0,0,-Factor>, <0,0,Factor>, <0,Factor,0>, <Factor,0,0>, }
#declare OctFaceNormalPoints = array[8]{<-1/3, 1/3, 1/3>*Factor, <1/3, 1/3, 1/3>*Factor, <-1/3, 1/3, -1/3>*Factor, <1/3, 1/3, -1/3>*Factor, <1/3, -1/3, 1/3>*Factor, <-1/3, -1/3, 1/3>*Factor, <-1/3, -1/3, -1/3>*Factor, <1/3, -1/3, -1/3>*Factor};
#declare OctFaces = array[8]{array[4]{Oct[3], Oct[4], Oct[0], Oct[3]}, array[4]{Oct[3], Oct[4], Oct[5], Oct[3]}, array[4]{Oct[2], Oct[4], Oct[0], Oct[2]}, array[4]{Oct[2], Oct[4], Oct[5], Oct[2]}, array[4]{Oct[1], Oct[3], Oct[5], Oct[1]}, array[4]{Oct[1], Oct[3], Oct[0], Oct[1]}, array[4]{Oct[1], Oct[2], Oct[0], Oct[1]}, array[4]{Oct[1], Oct[2], Oct[5], Oct[1]}};
#declare OctEdgeArrays = array[12]{array[2]{1, 5}, array[2]{1, 3}, array[2]{3, 5}, array[2]{4, 5}, array[2]{0, 1}, array[2]{1, 2}, array[2]{0, 4}, array[2]{3, 4}, array[2]{0, 2}, array[2]{2, 5}, array[2]{2, 4}, array[2]{0, 3}};
