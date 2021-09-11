# sklearn core
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.pipeline import Pipeline

# Union
from sklearn.pipeline import FeatureUnion
from sklearn.compose import ColumnTransformer

# Preprocessing
from sklearn.impute import MissingIndicator
from sklearn.decomposition import PCA, TruncatedSVD, LatentDirichletAllocation
from sklearn.cluster import KMeans
from sklearn.naive_bayes import MultinomialNB
from sklearn.svm import SVC, LinearSVC

# Models
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import MultinomialNB, GaussianNB
from sklearn.gaussian_process import GaussianProcessClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression, LinearRegression, Ridge
from sklearn.neural_network import MLPRegressor, MLPClassifier
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier, GradientBoostingClassifier
from sklearn.preprocessing import StandardScaler, FunctionTransformer, OneHotEncoder
from sklearn.impute import SimpleImputer

# Utils
import numpy as np
import skimage
from skimage.feature import hog

     
class HogTransformer(BaseEstimator, TransformerMixin):
    """
    Expects an array of 2d arrays (1 channel images)
    Calculates hog features for each img
    """
    def __init__(self, y=None, orientations=9,
                 pixels_per_cell=(8, 8),
                 cells_per_block=(3, 3), block_norm='L2-Hys'):
        self.y = y
        self.orientations = orientations
        self.pixels_per_cell = pixels_per_cell
        self.cells_per_block = cells_per_block
        self.block_norm = block_norm
 
    def fit(self, X, y=None):
        return self
 
    def transform(self, X, y=None):
 
        def local_hog(X):
            return hog(X,
                       orientations=self.orientations,
                       pixels_per_cell=self.pixels_per_cell,
                       cells_per_block=self.cells_per_block,
                       block_norm=self.block_norm)

        try: # parallel
            return np.array([local_hog(img) for img in X])
        except:
            return np.array([local_hog(img) for img in X])

def get_clf(mode, **kwargs):
    '''
    Code returning sklearn classifier for pipelines
    '''
    if mode == 'logistic':
        solver = kwargs.get('solver', 'liblinear')
        n_jobs = kwargs.get('n_jobs', None)
        max_iter = kwargs.get('max_iter', 5000)
        model = LogisticRegression(solver=solver, n_jobs=n_jobs,
                                 max_iter=max_iter, random_state=666)
    elif mode=='RandomForest':
        n_estimators = kwargs.get('n_estimators', 50)
        model = RandomForestClassifier(n_estimators=n_estimators, random_state=666)
    elif mode=='KNN':
        n_neighbors = kwargs.get('n_neighbors', 1)
        knn = KNeighborsClassifier(n_neighbors=n_neighbors)
    elif mode=='SVC':
        kernel = kwargs.get('kernel', 'rbf')
        model = SVC(kernel=kernel, random_state=666)
    elif mode=='LinearSVC':
        model = LinearSVC(loss='hinge', random_state=666)
    elif mode=='GP':
        model = GaussianProcessClassifier(random_state=666)
    elif mode=='KNN':
        n_neighbors = kwargs.get('n_neighbors', 1)
        model = KNeighborsClassifier(n_neighbors=n_neighbors)
    elif mode=='NB':
        model = MultinomialNB()
    elif mode=='linear':
        model = LinearRegression(random_state=666)
    elif mode=='ridge':
        alpha = kwargs.get('alpha', 1.0)
        model = Ridge(alpha=alpha, random_state=666)
    elif 'NN' in mode:
        solver = kwargs.get('solver', 'sgd')
        hidden_layer_sizes = kwargs.get('hidden_layer_sizes', (20,))
        if isinstance(hidden_layer_sizes, list):
            hidden_layer_sizes = list(hidden_layer_sizes)
        activation = kwargs.get('activation', 'relu')
        learning_rate_init = kwargs.get('learning_rate', 0.001)
        max_iter = kwargs.get('max_iter', 5000)
        early_stopping= kwargs.get('early_stopping', False)
        warm_start = kwargs.get('warm_start', False)
        if mode=='NN':
            model = MLPClassifier(solver=solver, hidden_layer_sizes=hidden_layer_sizes,
                                activation=activation, learning_rate_init=learning_rate_init,
                                warm_start = warm_start, max_iter=max_iter,
                                early_stopping=early_stopping)
        if mode=='NN_reg':
            model = MLPRegressor(solver=solver, hidden_layer_sizes=hidden_layer_sizes,
                                activation=activation, learning_rate_init=learning_rate_init,
                                warm_start = warm_start, max_iter=max_iter, early_stopping=early_stopping)
    return model

def get_pipe_ops(mode):
    if mode == 'pipe_0':
        # identity pipeline
        def identity(x):
            return x
        ops = [('identity', FunctionTransformer(identity))]

    elif mode == 'pipe_1':
        # 1-step scaler (*map)
        ops = [('scaler', StandardScaler())]

    elif mode == 'pipe_2':
        # 2-step function scaler (*map)
        def log1p(x):
            return np.log1p(x)
        ops = [('log', FunctionTransformer(log1p)),('scaler', StandardScaler())]

    elif mode == 'pipe_3':
        # dimensionality reduction (*map)
        ops = [('PCA', PCA())]

    elif mode == 'pipe_4':
        # k-means (fork)
        union = FeatureUnion([("indicator", MissingIndicator()),
                       ("kmeans", KMeans(random_state=0))])
        ops = [('union', union)]

    elif mode == 'pipe_5':
        # multiple dimensionality reductions (fork)
        union = FeatureUnion([("pca", PCA(iterated_power=1)), 
                            ("svd", TruncatedSVD(n_iter=1)),
                            ("lda", LatentDirichletAllocation(max_iter=1))])
        ops = [('union', union)]

    elif mode == 'pipe_6':
        # image blurring operator
        def gaussian_blur(x):
            #x = x.reshape(1, -1)
            return skimage.filters.gaussian(x)
        ops = [('blur', FunctionTransformer(gaussian_blur))]

    elif mode == 'pipe_7':
        # complex image processing operators
        def gaussian_blur(x):
            #x = x.reshape(1, -1)
            return skimage.filters.gaussian(x)

        hogify = HogTransformer(
            pixels_per_cell=(4, 4), 
            cells_per_block=(2,2), 
            orientations=9, 
            block_norm='L2-Hys'
        )
        #ops = [('blur', FunctionTransformer(gaussian_blur)), ('hogify', hogify)]
        ops = [('hogify', hogify)]

    else:
        raise ValueError("Invalid mode!")

    return ops

def create_numerical_pipeline(ops_mode, imputer=True, clf_mode='logistic', **kwargs):

    ops = get_pipe_ops(ops_mode)
    clf = get_clf(clf_mode, **kwargs)
    if imputer:
        ops = [('i', SimpleImputer(strategy='median'))] + ops
    pipe = Pipeline(ops + [('classifier', clf)])
    return pipe

def create_tabular_pipeline(num_mode, categorical_ix=[0], numerical_ix=[1,2,3], imputer=True, clf_mode='logistic', **kwargs):

    ops = get_pipe_ops(num_mode)
    cat_pipe = Pipeline([('i', SimpleImputer(strategy='constant', fill_value='missing')),
                     ('encoder', OneHotEncoder(handle_unknown='ignore', sparse=False))])
    if imputer:
        ops = [('i', SimpleImputer(strategy='median'))] + ops
    num_pipe = Pipeline(ops)
    t = [('cat', cat_pipe, categorical_ix), ('num', num_pipe, numerical_ix)]
    col_transform = ColumnTransformer(transformers=t)
    ops = [("col_t", col_transform)]

    clf = get_clf(clf_mode)
    pipe = Pipeline(ops + [('classifier', clf)])
    return pipe