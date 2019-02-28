# Matlab time series data Classifier

This repo includes a matlab "livescript" that takes you through the process of preprocessing raw data gathered with an oscilloscope, from the input of an HC-SR04 sensor. 

We used an Arduino to trigger an Ultrasonic Sensor HC - SR04. The sensor sends eight pulses at 40kHz towards a container filled with water at 0, 2, 4 and 6cm, measured from the bottom. The signal is received on the microphone of the same HC-SR04, where we intercept the signal at the output of the LM358 embedded operational amplifier. We record the signal through an oscilloscope.

Based on the fact that a mechanical wave travels at different speeds on different materials, we are confident that a Neural Network Classifier will be able to tell the difference between the signals at different water depths. 
 
We captured 300 signals for every measurement (0, 2, 4 and 6 cm). We used 240 signals to train a LSTM (Long-Short Term Memory) Network in Matlab, and 60 signals to test the network. The architecture of the network is:
* Sequence Input Layer
* LSTM Layer
* Fully Connected Layer
* Coftmax Layer
* Classification Output Layer
