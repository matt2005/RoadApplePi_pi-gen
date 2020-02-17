ffmpegLocation=$(which ffmpeg)
if [ $? != 0 ]
then
	wget https://www.ffmpeg.org/releases/ffmpeg-3.4.2.tar.gz
	tar -xvf ffmpeg-3.4.2.tar.gz
	cd ffmpeg-3.4.2
	echo "./configure --enable-gpl --enable-nonfree --enable-mmal --enable-omx --enable-omx-rpi"
	./configure --enable-gpl --enable-nonfree --enable-mmal --enable-omx --enable-omx-rpi
	make -j$(nproc)
	sudo make install
	cd ..
else
	echo "FFMpeg already found at $ffmpegLocation! Using installed version."
fi