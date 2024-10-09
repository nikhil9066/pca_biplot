# Load necessary library
library(ISLR)
library(plotly)

# 1. Data Preparation
# Extract labels and data
labs <- NCI60$labs
d <- NCI60$data

# Check the dimensions of the dataset
print(paste("Dimensions of data:", dim(d)))

# Check the distribution of the labels
print(table(labs))

# 2. Standardize the Data
d_scaled <- scale(d)

# 3. Perform PCA
pca_result <- prcomp(d_scaled, center = TRUE, scale. = TRUE)

# 4. Scree Plot
par(mar=c(5, 5, 4, 2))
screeplot(pca_result, main = "Scree Plot", col = "blue", cex.main = 1.5)

# 5. Create a Biplot
par(mar=c(5, 5, 4, 2))

# Define colors based on unique labels
unique_labels <- unique(labs)
colors <- rainbow(length(unique_labels))  

# Create a named vector for colors
label_colors <- setNames(colors, unique_labels)

# Biplot
biplot(pca_result, col = label_colors[labs], pch = 19, main = "PCA Biplot of NCI60 Data", cex = 0.5)
text(pca_result$x[, 1], pca_result$x[, 2], labels = rownames(pca_result$x), cex = 0.5, col = "black") # Consider reducing cex for better visibility

# Alternatively, only label some points for clarity:
selected_points <- c(1, 15, 30, 45, 60)  # Select a few points to label
text(pca_result$x[selected_points, 1], pca_result$x[selected_points, 2], labels = rownames(pca_result$x)[selected_points], cex = 0.8, col = "black")

# 6. Clustering Analysis
set.seed(123)  # For reproducibility
kmeans_result <- kmeans(pca_result$x[, 1:2], centers = 6)

# Plot K-means clustering results
plot(pca_result$x[, 1:2], col = kmeans_result$cluster, pch = 19,
     main = "K-means Clustering on PCA Results",
     xlab = "PC1", ylab = "PC2")
points(kmeans_result$centers, col = 1:6, pch = 8, cex = 2)



# Create a data frame for plotting
pca_df <- data.frame(PC1 = pca_result$x[, 1],
                     PC2 = pca_result$x[, 2],
                     Type = labs)

# Create an interactive plotly biplot
plot <- plot_ly(data = pca_df, 
                x = ~PC1, 
                y = ~PC2, 
                type = 'scatter', 
                mode = 'markers',
                color = ~Type,
                text = ~paste("Sample:", rownames(pca_df)),
                marker = list(size = 5, opacity = 0.8)) %>%
  layout(title = "Interactive PCA Biplot of NCI60 Data",
         xaxis = list(title = "PC1"),
         yaxis = list(title = "PC2"))

# Show the plot
plot