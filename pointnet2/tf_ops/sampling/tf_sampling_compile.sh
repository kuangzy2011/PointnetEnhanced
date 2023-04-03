#/bin/bash
#/usr/local/cuda-11.8/bin/nvcc tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

#TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
#TF_LIB=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')
#CUDA_INC='/usr/local/cuda-11.8/include'
#CUDA_LIB='/usr/local/cuda-11.8/lib64/'

#g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I $TF_INC -I $CUDA_INC -I $TF_INC/external/nsync/public -lcudart -L $CUDA_LIB -L$TF_LIB -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0


/usr/local/cuda-11.5/bin/nvcc tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

TF_DIR=$(dirname $(python -c "import tensorflow as tf;print(tf.__file__)"))
CUDA_HOME=/usr/local/cuda-11.8

# TF1.2
g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I $TF_DIR/include -I ${CUDA_HOME}/include -lcudart -L ${CUDA_HOME}/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0
