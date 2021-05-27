import pandas as pd # our main data management package
import string # used for preprocessing
import re # used for preprocessing
import nltk # the Natural Language Toolkit, used for preprocessing
import numpy as np # used for managing NaNs
import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords # used for preprocessing
from nltk.stem import WordNetLemmatizer # used for preprocessing
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression # our model
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import FunctionTransformer
from sklearn.pipeline import Pipeline

nltk.download('stopwords')
nltk.download('wordnet')
nltk.download('punkt')
from sklearn.compose import make_column_transformer
from sklearn.compose import make_column_selector
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfTransformer

class DataframeFunctionTransformer():
    def __init__(self, func):
        self.func = func

    def transform(self, input_df, **transform_params):
        return self.func(input_df)

    def fit(self, X, y=None, **fit_params):
        return self

class TextPipeline():
    
    def __init__(self, mode):
        self.pipeline = self.create_text_pipeline(mode)

    def create_text_pipeline(self, mode):
        # define operators
        # remove urls, handles, and the hashtag from hashtags (taken from https://stackoverflow.com/questions/8376691/how-to-remove-hashtag-user-link-of-a-tweet-using-regular-expression)
        def remove_urls(text):
            new_text = ' '.join(re.sub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)"," ",text).split())
            return new_text
        def df_remove_urls(df):
            return df.apply(remove_urls)
        
        # make all text lowercase
        def text_lowercase(text):
            return text.lower()
        def df_text_lowercase(df):
            return df.apply(text_lowercase)

        # remove numbers
        def remove_numbers(text):
            result = re.sub(r'\d+', '', text)
            return result
        def df_remove_numbers(df):
            return df.apply(remove_numbers)

        # remove punctuation
        def remove_punctuation(text):
            translator = str.maketrans('', '', string.punctuation)
            return text.translate(translator)
        def df_remove_punctuation(df):
            return df.apply(remove_punctuation)

        # tokenize
        def tokenize(text):
            text = word_tokenize(text)
            return text
        def df_tokenize(df):
            return df.apply(tokenize)

        # remove stopwords
        stop_words = set(stopwords.words('english'))
        def remove_stopwords(text):
            text = [i for i in text if not i in stop_words]
            return text
        def df_remove_stopwords(df):
            return df.apply(remove_stopwords)

        # lemmatize
        lemmatizer = WordNetLemmatizer()
        def lemmatize(text):
            text = [lemmatizer.lemmatize(token) for token in text]
            return text
        def df_lemmatize(df):
            return df.apply(lemmatize)
        
        def join_text(text):
            return ' '.join(text)
        def df_join_text(df):
            return df.apply(join_text)

        nltk_remove_urls = DataframeFunctionTransformer(df_remove_urls)
        nltk_lowercase = DataframeFunctionTransformer(df_text_lowercase)
        nltk_remove_numbers = DataframeFunctionTransformer(df_remove_numbers)
        nltk_remove_punctuation = DataframeFunctionTransformer(df_remove_punctuation)
        nltk_tokenize = DataframeFunctionTransformer(df_tokenize)
        nltk_remove_stopwords = DataframeFunctionTransformer(df_remove_stopwords)
        nltk_lemmatize = DataframeFunctionTransformer(df_lemmatize)
        nltk_join_text = DataframeFunctionTransformer(df_join_text)

        text_transform = [
                                ('nltk_remove_urls', nltk_remove_urls),
                                ('nltk_lowercase', nltk_lowercase),
                                ('nltk_remove_numbers', nltk_remove_numbers),
                                ('nltk_remove_punctuation', nltk_remove_punctuation),
                                ('nltk_tokenize', nltk_tokenize),
                                ('nltk_remove_stopwords', nltk_remove_stopwords),
                                ('nltk_lemmatize', nltk_lemmatize),
                                ('nltk_join_text', nltk_join_text)
                         ]
                                
        if mode == 'pipe_0':
            text_transform = [
                        ('nltk_remove_urls', nltk_remove_urls),
                        ('nltk_tokenize', nltk_tokenize),
                        ('nltk_lemmatize', nltk_lemmatize),
                        ('nltk_join_text', nltk_join_text)
                    ]
        elif mode == 'pipe_1':
            text_transform = [
                        ('nltk_remove_urls', nltk_remove_urls),
                        ('nltk_lowercase', nltk_lowercase),
                        ('nltk_tokenize', nltk_tokenize),
                        ('nltk_lemmatize', nltk_lemmatize),
                        ('nltk_join_text', nltk_join_text)
                    ]
        elif mode == 'pipe_2':
            text_transform = [
                        ('nltk_remove_urls', nltk_remove_urls),
                        ('nltk_lowercase', nltk_lowercase),
                        ('nltk_remove_numbers', nltk_remove_numbers),
                        ('nltk_remove_punctuation', nltk_remove_punctuation),
                        ('nltk_tokenize', nltk_tokenize),
                        ('nltk_lemmatize', nltk_lemmatize),
                        ('nltk_join_text', nltk_join_text)
            ]
        elif mode == 'pipe_3':
            text_transform = [
                        ('nltk_remove_urls', nltk_remove_urls),
                        ('nltk_lowercase', nltk_lowercase),
                        ('nltk_remove_numbers', nltk_remove_numbers),
                        ('nltk_remove_punctuation', nltk_remove_punctuation),
                        ('nltk_tokenize', nltk_tokenize),
                        ('nltk_remove_stopwords', nltk_remove_stopwords),
                        ('nltk_lemmatize', nltk_lemmatize),
                        ('nltk_join_text', nltk_join_text)
                    ]
                                

        ngram = text_transform + [('count', CountVectorizer()), ('tfid', TfidfTransformer())]

        return Pipeline([('text_transform', make_column_transformer((ngram, make_column_selector(pattern="tokens"))))])

    def get_pipeline(self):
        return self.pipeline
