library(tm)
library(SnowballC)
library(wordcloud)
library(syuzhet)



# Define the function
create_wordcloud <- function(text, title) {
  # Create a Corpus
  corpus <- Corpus(VectorSource(text))
  
  # Preprocess the text data
  corpus <- tm_map(corpus, removeWords, c("course", "class", "code", "lecture", "lecture", "professor"))
  corpus <- tm_map(corpus, content_transformer(tolower))
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, removeNumbers)
  corpus <- tm_map(corpus, removeWords, stopwords("english"))
  corpus <- tm_map(corpus, stripWhitespace)
  corpus <- tm_map(corpus, stemDocument)
  corpus <- tm_map(corpus, removeWords, c("lectur", "content"))
  
  # Create a Term-Document Matrix
  tdm <- TermDocumentMatrix(corpus)
  m <- as.matrix(tdm)
  word_freqs <- sort(rowSums(m), decreasing = TRUE)
  df <- data.frame(word = names(word_freqs), freq = word_freqs)
  
  # Generate the word cloud
  set.seed(1234) # for reproducibility
  layout(matrix(c(1, 2), nrow=2), heights=c(1, 4))
  par(mar=rep(0, 4))
  plot.new()
  text(x=0.5, y=0.5, title)
  wordcloud(words = df$word, freq = df$freq, min.freq = 1, 
            max.words = 100, random.order = FALSE, 
            rot.per = 0.35, colors = brewer.pal(8, "Dark2"), 
            main = "Title")
}

# Example usage
text_list <- list(text1, text2, text3, text4)
titles <- c(
  "How satisfied are you with the course overall?",
  "How satisfied are you with your section?",
  "How satisfied are you with lectures?",
  "How could the instructor or the TAs improve the course?"
)

mapply(create_wordcloud, text_list, titles)

map2(text_list, titles, ~ {
  png(filename = paste0("~/Downloads/WC_", str_trunc(.y, 40), ".png"), width=12, height=8,units = "in", res = 300)
  create_wordcloud(.x, .y)
  dev.off()
})

# sentiment analysis

# Define the sentiment analysis function
perform_sentiment_analysis <- function(text) {
  # Preprocess the text data
  text <- tolower(text)
  text <- removePunctuation(text)
  text <- removeNumbers(text)
  text <- removeWords(text, stopwords("english"))
  text <- stripWhitespace(text)
  
  # Perform sentiment analysis
  sentiments <- get_nrc_sentiment(text)
  
  # Summarize the sentiment scores
  sentiment_scores <- colSums(sentiments)
  
  return(sentiment_scores)
}

# Example usage
text_list <- list(text1, text2, text3, text4)

# Perform sentiment analysis on each text and print results
sentiment_results <- lapply(text_list, perform_sentiment_analysis)
names(sentiment_results) <- titles

# Print sentiment analysis results
# print(sentiment_results)



# plot sentiments

# Plot sentiment analysis results
plot_sentiments <- function(sentiment_scores, title) {
  df <- data.frame(sentiment = names(sentiment_scores), score = sentiment_scores)
  ggplot(df, aes(x = sentiment, y = score)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    theme_minimal() +
    labs(title = title, x = "Sentiment", y = "Score") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

map2(sentiment_results, titles, ~ {
  p <- plot_sentiments(.x, .y)
  ggsave(filename = paste0("~/Downloads/", str_trunc(.y, 40), ".png"), plot = p)
})


# timer

write_csv(as_tibble(a[-1]), "~/Downloads/timer.csv")

ggplot(as.data.frame(a[-1]), aes(a[-1])) + 
  geom_bar() + 
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Timer too long or too short?")


# 
a <- read_csv("/Users/ingmarsturm/Documents/GitHub/essentialols.github.io/courses/pstat10_2024/results second week check-in/numeric_poll_results.csv")
library(tidyverse)





# Renaming the columns for readability
colnames(a) <- c(
  "How satisfied are you with the course overall?",
  "How satisfied are you with your section?",
  "How satisfied are you with lectures?",
  "How difficult is this course? (midpoint: just right)",
  "How fast is the pace of this course? (midpoint: just right)",
  "How comfortable do you feel asking questions during lecture?"
)

# Converting the tibble to long format for easier plotting
a_long <- a %>%
  pivot_longer(cols = everything(), names_to = "question", values_to = "response")

# Calculating the median for each question
medians <- a_long %>%
  group_by(question) %>%
  summarize(median_response = median(response, na.rm = TRUE))

# Merging the median information back to the long format data
a_long <- a_long %>%
  left_join(medians, by = "question")

a_long <- a_long %>%
  mutate(question = factor(question, levels = colnames(a)))

# Creating a custom labeller function to include medians in the titles
custom_labeller <- function(labels) {
  sapply(labels, function(x) {
    paste0(x, " (Median: ", medians$median_response[medians$question == x], ")")
  })
}

# Plotting the responses with medians in the title and fixed x-axis
numeric_plots <- ggplot(a_long, aes(x = response)) +
  geom_bar() +
  facet_wrap(~ question, scales = "free_x", ncol = 2, labeller = labeller(question = custom_labeller)) +
  theme_bw() +
  labs(title = "Survey Responses", x = "Response", y = "Count") +
  scale_x_continuous(breaks = 1:5, limits = c(1, 5))

# Saving the plot
ggsave(filename = "/Users/ingmarsturm/Documents/GitHub/essentialols.github.io/courses/pstat10_2024/results second week check-in/numeric_poll_results.png", 
       plot = numeric_plots, width = 15, height = 8)

