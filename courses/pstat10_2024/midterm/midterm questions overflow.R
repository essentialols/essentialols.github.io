### Question 9 (4 points)

How do you filter rows in a data frame \texttt{df} where the column \texttt{age} is greater than 25?
  \begin{enumerate}[A.]
\item \texttt{df[df[, "age"] > 25, ]}
\item \texttt{df[df\$age > 25, ]}
\item \texttt{df["age" > 25, ]}
\item \texttt{subset(df, age > 25)}
\item \texttt{filter(df, age == 25)}
\end{enumerate}


### Question 5 (4 Points)

What would the output of the below code be?
  
  ```{r eval=F}
x <- 1:10
ifelse(x %% 3 == 0,x,0)
```


\begin{enumerate}[A.]
\item \texttt{0 0 3 0 0 6 0 0 9 0}
\item \texttt{1 2 0 4 5 0 7 8 0 10}
\item \texttt{0 0 1 0 0 1 0 0 1 0}
\item \texttt{3 3 3 3 3 3 3 3 3 3}
\item \texttt{1 2 0 1 2 0 1 2 0 1}
\end{enumerate}

TRUE: A


### Question 11 (4 points)

What is one benefit of a tibble compared to a classic dataframe?
  
  \begin{enumerate}[A.]
\item Tibbles automatically round numeric columns to two decimal places.
\item Tibbles show the column type when printed.
\item Tibbles always display all rows and columns by default.
\item Tibbles convert all character columns to factors by default.
\item Tibbles are immutable and cannot be changed once created.
\end{enumerate}

TRUE: B


### Question 8 (4 points)

How do you read a CSV file named `data.csv` into R?
  
  \begin{enumerate}[A.]
\item \texttt{df <- read.csv(file = "data.csv")}
\item \texttt{df <- read(file = "data.csv")}
\item \texttt{df <- read.csv("data.csv")}
\item \texttt{df <- open("data.csv")}
\item \texttt{df <- read.file("data.csv")}
\end{enumerate}

**Solution**: C) `df <- read.csv("data.csv")`


## Question 5 (4 points)

How many times would here be printed in the following code?
  
  ```{r}
f <- function(x) {
  
  for(i in 1:x) {
    if(i %% 3 == 0)  {
      print('here')
    } else if(i %% 5== 0) {
      print('here')
      
    }
  }
  
}


f(16)
```


\begin{enumerate}[A.]
\item \texttt{9}
\item \texttt{8}
\item \texttt{7}
\item \texttt{6}
\item \texttt{10}
\end{enumerate}

TRUE: C


### Question 4 (4 points)

Suppose we have a vector of points a basketball team has scored in its past 
20 games. Assume the vector shown below is stored in a variable called `v`.

```{r echo=F}
v <- c(114,103,102,110,102,90,91,98,101,110,91,111,112,107,114,114,115,105,111)
v
```


Which line of code counts how many times the team scored *more* than 100 points?
  
  
  \begin{enumerate}[A.]
\item \texttt{sum(v >= 100)}
\item \texttt{sum(v > 100)}
\item \texttt{sum(v == 100)}
\item \texttt{v[v > 100]}
\item \texttt{mean(v > 100)}
\end{enumerate}

TRUE: B


### Question 13 (4 points)

Now you want to create a new column in your tibble which contains the total 
area using the function you wrote above. Use tidyverse functions and the 
pipe to create this new column. Which tidyverse verb goes into the blank?
  
  ```{r echo=FALSE}
iris <- iris %>% 
  mutate(total_area = total_area(Sepal.Length, 
                                 Sepal.Width, 
                                 Petal.Length, 
                                 Petal.Width))
```

```{r eval=FALSE}
iris <- iris %>% 
  ____1____(total_area = total_area(Sepal.Length, 
                                    Sepal.Width, 
                                    Petal.Length, 
                                    Petal.Width))
```

\begin{enumerate}[A.]
\item filter
\item select
\item arrange
\item mutate
\item summarize
\end{enumerate}

TRUE: D