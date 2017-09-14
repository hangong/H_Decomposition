# H_Decomposition
Homography Matrix Decomposition Using Polar Decomposition. This is a MATLAB MEX implementaion.

A 2D homography matrix M can be meaningful primitive components, as

H = RSN = R(UKU')N

where R is a rotation matrix, N is ±I, and S is a symmetric positive definite stretch matrix. The stretch matrix can optionally be factored, though not uniquely, as UKU', where U is a rotation matrix and K is diagonal and positive. N can be multiplied into S if desired.

Copyright 2017 Han Gong, Unviersity of East Anglia <gong@fedoraproject.org>

Reference:
Shoemake, Ken, and Tom Duff. "Matrix animation and polar decomposition." In Proceedings of the conference on Graphics interface, vol. 92, pp. 258-264. 1992.

# Compilation

$ make

# Usage

[r,u,k,n] = TransformDecompose(H);

Note that the rotation r and u are returend in [quaternion parameter form](https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation). Use quat2rotm to convert a quaternion to a rotation matrix. k is the diagnal elements of the diagnal matrix K. n is a sign paramter (-1 or 1).
Please also see "Demo.m" for the usage of 2D homographical change interpolation.
