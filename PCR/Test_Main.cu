#include <iostream>
#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <cstdlib>

#include "PCR_Class.h"

int main( ) {

    size_t diagonal_size = 8;

    PCR_Solver crs = PCR_Solver(diagonal_size);

    //Generate sampel data
    srand (time(NULL));

    thrust::device_vector<float> alist(diagonal_size);
    thrust::device_vector<float> blist(diagonal_size);
    thrust::device_vector<float> clist(diagonal_size);
    thrust::device_vector<float> dlist(diagonal_size);
    thrust::device_vector<float> xlist(diagonal_size);

    float * ptr_alist = thrust::raw_pointer_cast(alist.data());
    float * ptr_blist = thrust::raw_pointer_cast(blist.data());
    float * ptr_clist = thrust::raw_pointer_cast(clist.data());
    float * ptr_dlist = thrust::raw_pointer_cast(dlist.data());
    float * ptr_xlist = thrust::raw_pointer_cast(xlist.data());

	// Anillustrative Example
	for (int i=0; i < diagonal_size; i++) {
		alist[i] = -1;
		blist[i] = 2;
		clist[i] = -1;
		dlist[i] = 0;//rand() % 100 + 1;
		xlist[i] = 0.0f;
    }

	alist[0] = 1;
	clist[diagonal_size-1] = 1;
	dlist[0] = 2; dlist[diagonal_size-1] = 2;

    /*for (int i=0; i < diagonal_size; i++) {*/
        /*alist[i] = i+2;*/
        /*blist[i] = i+1;*/
        /*clist[i] = i+3;*/
        /*dlist[i] = i+10;//rand() % 100 + 1;*/
        /*xlist[i] = 0.0f;*/
    /*}*/

	/*alist[0] = float(0.0);*/
	/*clist[diagonal_size-1] = float(0.0);*/

	/*for(int i=0 ; i <diagonal_size; i++) std::cout << "alist[" << i << "]=" << alist[i] << std::endl;*/
	/*for(int i=0 ; i <diagonal_size; i++) std::cout << "blist[" << i << "]=" << blist[i] << std::endl;*/
	/*for(int i=0 ; i <diagonal_size; i++) std::cout << "clist[" << i << "]=" << clist[i] << std::endl;*/
	/*for(int i=0 ; i <diagonal_size; i++) std::cout << "dlist[" << i << "]=" << dlist[i] << std::endl;*/

    crs.Solve(ptr_alist, ptr_blist, ptr_clist, ptr_dlist, ptr_xlist);

	for(int i=0 ; i <diagonal_size; i++) std::cout << "alist[" << i << "]=" << alist[i] << std::endl;
	for(int i=0 ; i <diagonal_size; i++) std::cout << "blist[" << i << "]=" << blist[i] << std::endl;
	for(int i=0 ; i <diagonal_size; i++) std::cout << "clist[" << i << "]=" << clist[i] << std::endl;
	for(int i=0 ; i <diagonal_size; i++) std::cout << "dlist[" << i << "]=" << dlist[i] << std::endl;
	for(int i=0 ; i <diagonal_size; i++) std::cout << "xlist[" << i << "]=" << xlist[i] << std::endl;

    return 0;

}
