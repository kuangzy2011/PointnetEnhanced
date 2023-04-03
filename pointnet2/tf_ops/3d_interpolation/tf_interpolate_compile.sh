#TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
#TF_LIB=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')
#CUDA_INC='/usr/local/cuda-11.8/include'
#CUDA_LIB='/usr/local/cuda-11.8/lib64/'

#g++ -std=c++11 tf_interpolate.cpp -o tf_interpolate_so.so -I $TF_INC -I $CUDA_INC -lcudart -L $CUDA_LIB -L $TF_LIB -ltensorflow_framework -shared -fPIC -O2 -D_GLIBCXX_USE_CXX11_ABI=0 


TF_DIR=$(dirname $(python -c "import tensorflow as tf;print(tf.__file__)"))
CUDA_HOME=/usr/local/cuda-11.8

g++ -std=c++11 tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC -I $TF_DIR/include  -I ${CUDA_HOME}/include -lcudart -L ${CUDA_HOME}/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0
