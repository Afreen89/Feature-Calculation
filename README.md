# Feature-Calculation
The task will deal with the area of Feature Extraction, in both the Frequency and Spatial domains

### Task 1: spectral features
Read any image and identify spectral features for both radius and direction. I have applied FFT on the image and changed the coordinates to polar coordinates and used the radius and theta values as spectral features. To achieve this, run 

```
Task2_part1.m
```

### Task 2: Feature calculation
Extending task 1, I calculated first order histogram features, features from the co-occurance matrix from [this](https://ieeexplore.ieee.org/abstract/document/4309314?casa_token=NEzDoOHfHT0AAAAA:o-gRwUyY-w3lpyQv_zFVeNyDwy3itzl0LB7SvXr6XQ9cwF_rr3xCvMoQo5VKGBPyqHqVEnnuK9RYEg) paper. and five features from Gray Level Run Length(GLRL) matrix. I presented these features through various changes in bit-depth and direction.

To run the code, make sure you have these files in the same directory as your code:

```
chip_histogram_features.m
GLCL_Features1.m
glrlm.m
```

These are the built-in functions contributed by developers and are available on the functions repository of MathWorks.

Once you have these files in the same folder, run

```
Task2_part2.m
```

It contains the code for all three features to be run on an image. 

### Results
Here is measure of all GLRL features found using glrlm.m file.
![f](https://user-images.githubusercontent.com/101992840/216719613-d6482369-c1f0-4a67-b47b-b1f498c486c0.png)
