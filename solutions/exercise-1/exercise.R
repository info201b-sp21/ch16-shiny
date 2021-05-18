## Exercise 1: Loading functions

## Ensure your working directory is this directory:
## ch15-shiny/exercise-1/

# Source your build-scatter.R script, exposing your buildScatter function
source('scripts/build-scatter.R')

### Use your buildScatter function to draw a well labeled ggplot
### scatterplot of the iris data
buildScatter(data = iris, 
            xVar = 'Sepal.Length', 
            yVar = 'Sepal.Width',
            colorVar = 'Species', 
            title = 'Iris Dataset', 
            xLab = 'Sepal Length', 
            yLab = 'Sepal Width'
            )
