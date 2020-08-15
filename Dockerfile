FROM alpine:3.12

RUN apk update \
	&& apk upgrade \
	&& apk add --update alpine-sdk linux-headers git zlib-dev openssl-dev gperf php php-ctype cmake \
	&& git clone https://github.com/tdlib/td.git \
	&& cd td \
	&& git checkout v1.6.0 \
	&& rm -rf build \
	&& mkdir build \
	&& cd build \
	&& export CXXFLAGS="" \
	&& cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .. \
	&& cmake --build . --target prepare_cross_compiling \
	&& cd .. \
	&& php SplitSource.php \
	&& cd build \
	&& cmake --build . --target install \
	&& cd .. \
	&& php SplitSource.php --undo \
	&& cd .. \
	&& ls -l /usr/local \
	&& rm -rf /td \
	&& apk del alpine-sdk linux-headers git zlib-dev openssl-dev gperf php php-ctype cmake
