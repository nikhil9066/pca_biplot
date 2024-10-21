# PCA and Clustering Analysis of NCI60 Data

## Overview

This project performs Principal Component Analysis (PCA) and K-means clustering on the NCI60 dataset from the `ISLR` package, which contains gene expression data for 60 cancer cell lines. The analysis includes:
1. Data standardization
2. PCA
3. Visualization using scree plot, biplot, and K-means clustering
4. An interactive PCA biplot using Plotly.

## Requirements

The following R libraries are required to run the code:
- `ISLR`: For the NCI60 dataset.
- `plotly`: For interactive plotting.

To install the necessary libraries, run:
```R
install.packages("ISLR")
install.packages("plotly")
```

## Code Description

### 1. Data Preparation
- The labels (`labs`) and gene expression data (`d`) are extracted from the `NCI60` dataset.
- The dimensions of the data and the distribution of the labels are printed for reference.

### 2. Standardize the Data
- The dataset is standardized using the `scale()` function to ensure that each feature has a mean of 0 and a standard deviation of 1.

### 3. Perform PCA
- PCA is applied to the standardized data using `prcomp()`. The results are stored in `pca_result`.

### 4. Scree Plot
- A scree plot is created to visualize the variance explained by each principal component. This helps in deciding how many components to retain.

### 5. Biplot Visualization
- A biplot is generated to visualize the PCA results, with points colored according to their labels.
- Two options are provided for labeling points: labeling all points or only selected points for clarity.

### 6. Clustering Analysis
- K-means clustering is applied to the first two principal components (PC1 and PC2) with six clusters.
- The clustering results are visualized, with cluster centers indicated by larger points.

### 7. Interactive Plotly Biplot
- An interactive PCA biplot is created using `plotly`, allowing users to hover over points to see sample labels.

## Usage

To run the code, copy and paste it into an R script or R Markdown file. Ensure that the necessary libraries are installed. The code will generate visual outputs including:
1. A scree plot.
2. A PCA biplot.
3. A K-means clustering plot.
4. An interactive plotly biplot.

The interactive plot will allow you to explore the PCA results dynamically.
