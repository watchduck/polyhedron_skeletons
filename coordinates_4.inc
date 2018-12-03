#declare Factor = Scale * 3;

#declare T = array[4]{ <-Factor,-Factor,-Factor>, <-Factor,Factor,Factor>, <Factor,-Factor,Factor>, <Factor,Factor,-Factor>, }
#declare TFaceNormalPoints = array[4]{<-1/3, -1/3, 1/3>*Factor, <1/3, -1/3, -1/3>*Factor, <-1/3, 1/3, -1/3>*Factor, <1/3, 1/3, 1/3>*Factor};
#declare TFaces = array[4]{array[4]{T[1], T[2], T[0], T[1]}, array[4]{T[3], T[2], T[0], T[3]}, array[4]{T[3], T[1], T[0], T[3]}, array[4]{T[3], T[1], T[2], T[3]}};
#declare TEdgeArrays = array[6]{array[2]{0, 2}, array[2]{1, 3}, array[2]{1, 2}, array[2]{0, 1}, array[2]{2, 3}, array[2]{0, 3}};
