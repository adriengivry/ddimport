# ddimport

A simple R utility for importing data from the disk into your R project folder.

## Overview

This utility provides a function `import_data_from_disk()` that allows you to easily import data files from any location on the disk into your R project folder (or anywhere else really!). It ensures that your data is always up-to-date for seamless integration.

## Features

- An easy way to keep your data files up-to-date without the hassle of copy-pasting them manually
- Simple to integrate
- Keeps your data files organized on your disk

## Installation

1. Make sure you have R installed. You can download R from the official website: [https://www.r-project.org/](https://www.r-project.org/)

2. Install the devtools package:

    ```R
    install.packages("devtools")
    ```

3. Install the ddimport package:

    ```R
    devtools::install_github("adriengivry/ddimport")
    ```

## Usage

1. In your R script or interactive session, load the `ddimport` package:

    ```R
    library("ddimport")
    ```

2. Call the `import_data_from_disk()` function, providing the file path of the data file you want to import:

    ```R
    import_data_from_disk("/path/to/data/fruits.csv")
    ```

The function will automatically copy the data file from the specified location to your R project folder (or update your data if it already exists within your R project).

By default, the imported file will be placed directly at the root of your R project. You can also specify a custom destination path by providing a value for the `data_target_path` parameter when calling `import_data_from_disk()`.

**Example:**

```R
# Import the ddimport package
library("ddimport")

# Import a data file (fruits.csv) to the "data" folder inside of your R project
import_data_from_disk("/path/to/data/fruits.csv", "data/fruits.csv")
```
