# H_Decomposition
Planar Homography Matrix Decomposition Using Polar Decomposition. This is a MATLAB MEX implementaion.

An 3x3 homography matrix M can be meaningful primitive components, as

M = PTRNS,

where P is a simple perspective matrix, T is a translation matrix, R is a rotation matrix, N is ±I, and S is a symmetric positive definite stretch matrix. The stretch matrix can optionally be factored, though not uniquely, as UKU', where U is a rotation matrix and K is diagonal and positive. For a 4×3 affine matrix the perspective factor can be dropped; and for a 3×3 linear matrix, so can the translation. Also, N can be multiplied into S if desired.

Copyright 2017 Han Gong, Unviersity of East Anglia <gong@fedoraproject.org>

Reference:
Shoemake, Ken, and Tom Duff. "Matrix animation and polar decomposition." In Proceedings of the conference on Graphics interface, vol. 92, pp. 258-264. 1992.
