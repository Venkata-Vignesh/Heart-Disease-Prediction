# Heart-Disease-Prediction
Heart disease is a major health concern globally, and early detection of the disease is crucial for effective treatment. In this article, we propose an ensemble model for heart disease prediction, which combines four different models, namely LightGBM, XGBoost, Multilayer Perceptron, and AdaBoost. We evaluated the performance of each model using the a Kaggle dataset which combined heart disease data of 5 places to make it a larger dataset, and AdaBoost gave the best result with an accuracy of 0.985, followed by XGBoost with an accuracy of 0.980, LightGBM with an accuracy of 0.956, and Multilayer Perceptron with an accuracy of 0.921. We then combined all four models using a weighted bagging method that assigns weights to the predictions of each model based on its accuracy. The resulting ensemble model achieved an accuracy of 0.96, which is lesser compared to model giving highest accuracy because we are taking mean with respect to weights of each model. Our findings suggest that the proposed approach can be a useful tool for predicting heart disease, and the ensemble model can provide more accurate results than any single model alone

We have also done visualization part with the help of R and Tableau.

DV_PROJECT_FINAL file has all the models implementation and its comparision.
DV_visual has the visualization done in R.
Jcomp_tableau_visualization has the part we have done in Tableau.
