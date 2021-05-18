# Exercise-6

In this exercise, you'll practice building an interactive Shiny
application that uses ggplot to make graphics of iris data.  For a
reminder, `iris` is a built-in R dataset that contains four iris
flower measurements for 150 flowers of three different species
(_setosa_, _versicolor_ and _virginica_).  You can use both
single/multi-file layout, but as this is a small task, the single-file
approach may be easier.

We approach this task
step-by-step:

1. Create a new shiny app in RStudio.  This will be filled with an Old
   Faithful geyser template.  It uses another built-in R dataset
   `faithful` that contains information about Old Faithful geyser
   eruptions.
   Ensure it works and you understand what the app does.
2. The app makes a histogram of 2nd column of `faithful` data.
   Replace that with a measure of iris flowers, e.g. `Sepal.Length`.
   Ensure the app works.
3. Now replace to out-of-date labels with correct ones, e.g. "Iris
   data" and "Histogram of sepal length".
4. Now let's change histogram to scatterplot and use ggplot instead.
   Introduce two changes:
    * make the app to create a scatterplot (`geom_point`) of two of iris variables,
      e.g. `Sepal.Lenght` and `Petal.Length`.  Color the dots
      according to `Species`.
	* let the slider determine not the number of bins, but number of
      observations that will be plotted.  You can use dplyr's
      `sample_n` to select a sample of given size.  Ensure one can
      select up to all.
5. Now it is time to let the user to choose the variables that go on
   the scatterplot.  Let's do this first for the _x_ axis.  Check out
   a suitable widget from [shiny widget gallery](https://shiny.rstudio.com/gallery/widget-gallery.html),
   e.g. Select box (`selectInput`).  Now add another widget to the
   `sidebarPanel` underneath the one that chooses number of
   observations. 
   Note that ggplot's `aes` function cannot do variable indirection,
   if the variable name is in another variable, you have to use
   `aes_string` instead (and quote the data variable names).
6. Now ensure that the labels are correct: _x_-axis should be labelled
   according to the variable that the user selected.
7. Now it is time to repeat the same with your _y_-variable.  Let the
   user select what goes on the vertical axis, and ensure the labels
   are correct.  You need to create a new input widget, similar to the
   one that you created for _x_-variable.  It may be of different type
   though (e.g radio buttons).
8. As the measurement precision is low, many of the datapoints overlap
   on the plot.  Add a single checkbox where the user can select
   "jitter", i.e. if the plot shows the datapoints exactly (and
   overlaps those), or "jitters" those a little bit so they do not
   overlap.  
   You can achieve this using ggplot's `geom_jitter` instead of
   `geom_point`. 
9. Now we have a nice interactive iris data explorer!  You can add
   more features, e.g. a slider to determine point size, or other
   graphical features.

As in previous exercises, you should fork and clone this repository,
then follow the instructions below.
