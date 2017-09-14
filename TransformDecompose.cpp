#include <algorithm>
#include "matrix.h"
#include "mex.h"
#include "Decompose.h"

// convert quat to float array
void quat2float(const Quat &q, double * f)
{
    f[0] = double(q.w); f[1] = double(q.x);
    f[2] = double(q.y); f[3] = double(q.z);
}

// convert homogenous vector to float array
void hv2float(const HVect &q, double * f)
{
    f[0] = double(q.x); f[1] = double(q.y);
    f[2] = double(q.z); f[3] = double(q.w);
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    mxArray *M;

    // input parameter checks
    if(nrhs != 1) {
        mexErrMsgIdAndTxt("MyToolbox:arrayProduct:nlhs",
                          "One output required.");
    }
    // copy the input matrix
    M = mxDuplicateArray(prhs[0]);

    HMatrix H = {0}; H[3][3] = 1.0;
    double *prM = mxGetPr(M);
    // copy entries in M
    for(int c = 0; c<3; c++)
    {
        double *adr0 = prM + 3*c;
        for(int r = 0; r<3; r++)
            H[r][c] = float(*(adr0+r));
    }

    // perform matrix decomposition
    AffineParts parts;
    decomp_affine(H, &parts);

    // allocate output space
    plhs[0] = mxCreateDoubleMatrix(4,1,mxREAL);
    plhs[1] = mxCreateDoubleMatrix(4,1,mxREAL);
    plhs[2] = mxCreateDoubleMatrix(4,1,mxREAL);
    plhs[3] = mxCreateDoubleScalar(0.);

    // allocate results
    double *prl[4];
    for(int i = 0; i<4; i++)
        prl[i] = mxGetPr(plhs[i]);
    quat2float(parts.q,prl[0]); // essential rotation
    quat2float(parts.u,prl[1]); // strech rotation
    hv2float(parts.k,prl[2]); // strech factors
    prl[3][0] = double(parts.f); // sign

    return;
}
