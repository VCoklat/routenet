#!/bin/bash
if [[ "$1" = "tfrecords" ]]; then

    /mnt/c/Users/yohan/.conda/envs/py36/python.exe routenet_with_link_cap.py data -d $PATH_TO_DATASET/$2/

fi

if [[ "$1" = "train" ]]; then

    /mnt/c/Users/yohan/.conda/envs/py36/python.exe routenet_with_link_cap.py train --hparams="l2=0.1,dropout_rate=0.5,link_state_dim=32,path_state_dim=32,readout_units=256,learning_rate=0.001,T=8"  --train  $PATH_TO_DATASET/$2/tfrecords/train/*.tfrecords --train_steps $3 --eval_ $PATH_TO_DATASET/$2/tfrecords/evaluate/*.tfrecords --model_dir ./CheckPoints/$2

fi

if [[ "$1" = "train_multiple" ]]; then

    /mnt/c/Users/yohan/.conda/envs/py36/python.exe routenet_with_link_cap.py train --hparams="l2=0.1,dropout_rate=0.5,link_state_dim=32,path_state_dim=32,readout_units=256,learning_rate=0.001,T=8"  --train  $PATH_TO_DATASET/$2/tfrecords/train/*.tfrecords $PATH_TO_DATASET/$3/tfrecords/train/*.tfrecords --train_steps $5 --eval_ $PATH_TO_DATASET/$2/tfrecords/evaluate/*.tfrecords $PATH_TO_DATASET/$3/tfrecords/train/*.tfrecords --shuffle_buf 30000 --model_dir ./CheckPoints/$4
fi

if [[ "$1" = "normalize" ]]; then

    /mnt/c/Users/yohan/.conda/envs/py36/python.exe normalize.py --dir $PATH_TO_DATASET/geant2bw/tfrecords/train/ $PATH_TO_DATASET/geant2bw/tfrecords/evaluate/ $PATH_TO_DATASET/nsfnetbw/tfrecords/train/ $PATH_TO_DATASET/nsfnetbw/tfrecords/evaluate/ $PATH_TO_DATASET/synth50bw/tfrecords/evaluate/ $PATH_TO_DATASET/synth50bw/tfrecords/train/ --ini configNSFNET50.ini
fi