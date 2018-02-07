---
title: "compulsory_exercise_1_problem3.rmd"
output: html_document
---

## ## Problem 3: Classification
#a)
* By standard algebraic rules for the logarithm one can show that logit$(p_i)$ is linear. 

$$
\text{logit}(p_i)=\log ( \frac{p_i}{1-p_i})=\log(p_i)-\log(1-p_i)=\log(\frac{e^{\beta_0 + \beta_1x_{i1} + \beta_2 x_{i2}}}{ 1+ e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}}})-\log(1-\frac{e^{\beta_0 + \beta_1x_{i1} + \beta_2 x_{i2}}}{ 1+ e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}}})= \log(\frac{e^{\beta_0 + \beta_1x_{i1} + \beta_2 x_{i2}}}{1+ e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}}} ) - \log(\frac{1+e^{\beta_0 + \beta_1x_{i1} + \beta_2 x_{i2}}-e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}}}{1+ e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}}})=\\=\log(e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}})-\log(1+e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}})-[\log(1)-\log(1+e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}})]=\log(e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}})=\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}
$$
*A logistic regression model was fitted usin the glm-function in R. In our case, the following values was found for the regression coefficients: 

$$

$\hat\beta_0\approx 0.4909$ \\
$\hat\beta_1\approx 0.4109$ \\
$\hat\beta\approx -1.8828$ \\
$$

Output:


```
## Warning: package 'GGally' was built under R version 3.4.3
```

```
## Warning: package 'pROC' was built under R version 3.4.3
```

```
## Type 'citation("pROC")' for a citation.
```

```
## 
## Attaching package: 'pROC'
```

```
## The following objects are masked from 'package:stats':
## 
##     cov, smooth, var
```

```
## 
## Call:
## glm(formula = y ~ x1 + x2, family = binomial, data = train)
## 
## Deviance Residuals: 
##      Min        1Q    Median        3Q       Max  
## -2.09452  -0.24527   0.05351   0.28132   2.63601  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)    
## (Intercept)   0.4909     2.8718   0.171 0.864265    
## x1            0.4109     0.1654   2.485 0.012968 *  
## x2           -1.8848     0.5129  -3.675 0.000238 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 89.971  on 64  degrees of freedom
## Residual deviance: 32.889  on 62  degrees of freedom
## AIC: 38.889
## 
## Number of Fisher Scoring iterations: 7
```
* interpretation of $\hat\beta_1$ and $\hat\beta_2$: 
In the logistic regression setting, it can be more useful to consider the odds, $p_i/1-p_i$, rather than the probability $p_i$ as p_i is an exponential function. In our case, the odds is the conditional probability that a wine is in class 1 divided by the probability that it is in class 0, given its specific values for the two covariates. 

As shown above, logit($p_i$) is a linear function in the two covariates $x_{i1}$ and $x_{i2}$. If we keep one of the covariates constant, say $x_{i2}$ and increase $x_i1$ by 1 unit, logit($p_i$) will increase linearly with $\beta_1$. This means the odds itself will be multiplied with $exp(\beta_1)$. In other words, if for now only considering the alkalinity of ash in wine, a higher value for the covariate measuring this will give a higher odds for the wine being in class 1. Similarly, since $\beta_2$ is negative, an increase in the color intensity of a wine will give a decrease in the odds of the wine being in class 1. 

*[??] By using the rule $\text{Pr}(Y_i = 1|{\bf x}) = p_i > 0.5$ for classifying an observation to class 1, the following rule was found:

$$
0.5> \frac{e^{\beta_0 + \beta_1x_{i1} + \beta_2 x_{i2}}}{ 1+ e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}}} \\
0.5\cdot ({ 1+ e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}}})>e^{\beta_0 + \beta_1x_{i1} + \beta_2 x_{i2}} \\
0.5>0.5\cdot e^{\beta_0 + \beta_1x_{i1} + \beta_2 x_{i2}} \\ 
\log(1)>\beta_0 + \beta_1x_{i1} + \beta_2 x_{i2} \\
x_{i2}<-\beta_0-\beta_1x_1
$$

* Figure\ref??? shows the plot of the training data, in addition to the boundary line found above.
<img src="compulsory_exercise_1_problem3_files/figure-html/unnamed-chunk-2-1.png" width="672" />
i) Linear is ok, sett inn utregning + plot.

i) Lineær ok, sett inn utregning + plot.
ii) 
iii) Interpret beta 1 og 2?
iv)Formel fra boka + spm om boundary skal være lineær.
v) Sjekk x2=... er riktig
vi)ok
vii) Hvordan presentere alle sannsynlighetene?
viii) 

$$
\text{Pr}(Y_i = 1| {\bf X}={\bf x}_i) = p_i = \frac{e^{\beta_0 + \beta_1x_{i1} + \beta_2 x_{i2}}}{ 1+ e^{\beta_0 + \beta_1x_{i1} + \beta_2x_{i2}}}
$$
#b) K-nearest neighbor classifier 

#c) LDA (& QDA)

* $\pi_k$ is , 

$$\text{Pr}(Y=k | {\bf X}={\bf x}) = \frac{\pi_k f_k({\bf x})}{\sum_{l=1}^K \pi_l f_l({\bf x})},$$

$$f_k({\bf x}) = \frac{1}{(2 \pi)^{p/2}|\boldsymbol{\Sigma}|^{1/2}}e^{-\frac{1}{2}({\bf x}-\boldsymbol{\mu_k})^T \boldsymbol{\Sigma}^{-1}({\bf x}-\boldsymbol{\mu_k})}.$$
