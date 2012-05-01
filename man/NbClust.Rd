\name{NbClust}
\alias{NbClust}
\title{An examination of indices for determining the number of clusters : NbClust Package}
\description{\code{NbClust} package provides 30 indices for determining the number of clusters and proposes to user the best clustering scheme from the different results obtained by varying all combinations of number of clusters, distance measures, and clustering methods. 
}
\usage{
NbClust(data, diss="NULL", distance = "euclidean", 
            min.nc=2, max.nc=15, method = "ward", 
            index = "all", alphaBeale = 0.1)
}
\arguments{
  \item{data}{matrix or dataset (the only mandatory argument)}
  \item{diss}{dissimilarity matrix to be used. By default, \code{diss="NULL"}, but if it is
replaced by a dissimilarity matrix, distance should be "NULL".}
  \item{distance}{the distance measure to be used to compute the dissimilarity matrix. This must be one of: "euclidean", "maximum", "manhattan", "canberra", "binary", "minkowski" or "NULL". By default, distance="euclidean". 
If the distance is "NULL", the dissimilarity matrix (diss) should be given by the user. If distance is not "NULL", the dissimilarity matrix should be "NULL".}
  \item{min.nc}{minimal number of clusters, between 2  and (number of objects - 1)}
  \item{max.nc}{maximal number of clusters, between 2 and (number of objects - 1), greater or equal to min.nc. By default, max.nc=15.}
  \item{method}{the cluster analysis method to be used. This should be one of: "ward", "single",
"complete", "average", "mcquitty", "median", "centroid", "kmeans".}
  \item{index}{the index to be calculated. This should be one of : "kl", "ch", "hartigan", "ccc", "scott", "marriot", "trcovw", "tracew", "friedman",  "rubin", "cindex",  "db", "silhouette", "duda", "pseudot2", "beale",  "ratkowsky", "ball", "ptbiserial", "gap", "frey", "mcclain", "gamma", "gplus", "tau", "dunn", "hubert", "sdindex", "dindex", "sdbw", "all" (all indices except GAP, Gamma, Gplus and Tau), "alllong" (all indices with GAP, Gamma, Gplus and Tau included).}
  \item{alphaBeale}{significance value for Beale's index.}
}
\value{
  \item{All.index}{Values of indices for each partition of the dataset obtained with a number of
clusters between min.nc and max.nc.}
  \item{All.CriticalValues}{ Critical values of some indices for each partition obtained with a number of clusters between min.nc and max.nc. }
  \item{Best.nc}{ Best number of clusters proposed by each index and the corresponding index value.}
}
\details{
\enumerate{
  \item \bold{Notes on the "Distance" argument\cr}  
  The following distance measures are written for two vectors \bold{x} and \bold{y}. They are used when the data is a \strong{d}-dimensional vector arising from measuring \bold{d} characteristics on each of \bold{n} objects or individuals.
  \itemize{
    \item \strong{Euclidean distance} : Usual square distance between the two vectors (2 norm).
    \deqn{d(x,y)=\left(\sum_{j=1}^{d}\left(x_{j}-y_{j}\right)^{2}\right) ^{\frac{1}{2}}}{d(x,y)= (sum_{j=1}^{d} (x_j - y_j)^2)^(1/2)}
    \item \strong{Maximum distance}: Maximum distance between two components of \bold{x} and \bold{y} (supremum norm).
    \deqn{d(x,y)=\sup_{1\leq j\leq d}\left|x_{j}-y_{j}\right|}{d(x,y)= sup|x_j - y_j|, 1\le j \le d}
    \item \strong{Manhattan distance} : Absolute distance between the two vectors (1 norm).
    \deqn{d(x,y)=\sum_{j=1}^{d}\left|x_{j}-y_{j}\right|}{d(x,y)= sum_{j=1}^{d}|x_j - y_j|}
    \item \strong{Canberra distance} : Terms with zero numerator and denominator are omitted from the sum and treated as if the values were missing.
    \deqn{d(x,y)=\sum_{j=1}^{d}\frac{\left|x_{j}-y_{j}\right|}{\left|x_{j}\right|+\left|y_{j}\right|}}{sum_{j=1}^{d}|x_j - y_j|) / (|x_j|+|y_j|)}
    \item \strong{Binary distance} : The vectors are regarded as binary bits, so non-zero elements are "on" and zero elements are "off". The distance is the proportion of bits in which only one is on amongst those in which at least one is on.
    \item \strong{Minkowski distance} : The \bold{p} norm, the \eqn{p^{th}} root of the sum of the \eqn{p^{th}} powers of the differences of the components.
    \deqn{d(x,y)=\left(\sum_{j=1}^{d}\left|x_{j}-y_{j}\right|^{p}\right) ^{\frac{1}{p}}}{d(x,y)= (sum_{j=1}^{d} |x_j - y_j|^p)^(1/p)}
  }
   \item \bold{Notes on the "method" argument\cr}
  The following aggregation methods are available in this package. 
  \itemize{
      \item \bold{Ward} : Ward method minimizes the total within-cluster variance. At each step the pair of clusters with minimum cluster distance are merged. 
      To implement this method, at each step find the pair of clusters that leads to minimum increase in total within-cluster variance after merging.
      This increase is a weighted squared distance between cluster centers. The initial cluster distances in Ward minimum variance method are defined to be the squared Euclidean distance between points:   
\deqn{D_{ij}=\left\|x_{i}-y_{j}\right\|^{2}}{D_ij=||x_i - y_j||^2}
\item \bold{Single} : The distance \eqn{D_{ij}}{D_ij} between two clusters \eqn{C_{i}}{C_i} and \eqn{C_{j}}{C_j} is the minimum distance between two points \eqn{x} and \eqn{y}, with \eqn{x \in C_{i}, y \in C_{j}}{x in C_i, y in C_j}. 
\deqn{D_{ij}=min_{x\in C_{i}, y\in C_{j}}d(x,y)}{D_ij= min d(x,y), x in C_i and y in C_j}
    A drawback of this method is the so-called chaining phenomenon: clusters may be forced together due to single elements being close to each other, even though many of the elements in each cluster may be very distant to each other.
      \item \bold{Complete} : The distance \eqn{D_{ij}}{D_ij} between two clusters \eqn{C_{i}}{C_i} and \eqn{C_{j}}{C_j} is the maximum distance between two points \eqn{x} and \eqn{y}, with \eqn{x \in C_{i}, y \in C_{j}}{x in C_i, y in C_j}.
     \deqn{D_{ij}=max_{x\in C_{i}, y\in C_{j}}d(x,y)}{D_ij= max d(x,y), x in C_i, y in C_j}
      \item \bold{Average} : The distance \eqn{D_{ij}}{D_ij} between two clusters \eqn{C_{i}}{C_i} and \eqn{C_{j}}{C_j} is the mean of the distances between the pair of points {x} and {y}, where \eqn{x \in C_{i}, y \in C_{j}}{x in C_i, y in C_j}.
      \deqn{D_{ij}=sum_{x\in C_{i}, y\in C_{j}}\frac{d(x,y)}{n_{i}\times n_{j}}}{D_ij= sum d(x,y)/(n_i * n_j), x in C_i and y in C_j} where \eqn{n_{i}}{n_i} and \eqn{n_{j}}{n_j} are respectively the number of elements in clusters \eqn{C_{i}}{C_i} and \eqn{C_{j}}{C_j}. 
      This method has the tendency to form clusters with the same variance and, in particular, small variance.  
      \item \bold{McQuitty} : The distance between clusters \eqn{C_{i}}{C_i} and \eqn{C_{j}}{C_j} is the weighted mean of the between-cluster dissimilarities:
        \deqn{D_{ij}=\left(D_{ik}+D_{il}\right)/2}{D_ij =(D_ik + D_il)/2}
      where cluster \eqn{C_{j}}{C_j} is formed from the aggregation of clusters \eqn{C_{k}}{C_k} and \eqn{C_{l}}{C_l}.  
     \item \bold{Median} : The distance \eqn{D_{ij}}{D_ij} between two clusters \eqn{C_{i}}{C_i} and \eqn{C_{j}}{C_j} is given by the following formula:  
       \deqn{D_{ij}=\frac{(D_{ik}+D_{il})}{2}-\frac{D_{kl}}{4}}{D_ij=(D_ik + D_il)/2)-(D_kl/4)}  
  where cluster \eqn{C_{j}}{C_j} is formed by the aggregation of clusters \eqn{C_{k}}{C_k} and \eqn{C_{l}}{C_l}.    
  \item \bold{Centroid} : The distance \eqn{D_{ij}}{D_ij} between two clusters \eqn{C_{i}}{C_i} and \eqn{C_{j}}{C_j} is the squared euclidean distance between the gravity centers of the two clusters, i.e. between the mean vectors of the two clusters, \eqn{\bar{x_{i}}}{\bar{x_i}} and \eqn{\bar{x_{j}}}{\bar{x_j}} respectively.
  \deqn{D_{ij}=\left\Vert \bar{x_{i}}-\bar{x_{j}}\right\Vert ^{2}}{ D_ij=||\bar{x_i}-\bar{x_j}||^{2}}
  This method is more robust than others in terms of isolated points.   
 \item \bold{Kmeans} : This method is said to be a reallocation method. Here is the general principle:
      \enumerate{
    			\item Select as many points as the number of desired clusters to create initial centers.
    			\item Each observation is then associated with the nearest center to create temporary clusters.
    			\item The gravity centers of each temporary cluster is calculated and these become the new clusters centers.
			    \item Each observation is reallocated to the cluster which has the closest center.
    			\item This procedure is iterated until convergence.
    	  }
  }
  \item \bold{Notes on the "Index" argument\cr\cr}   
        \bold{3.1. CH index.  Calinski and Harabasz (1974)\cr} 
           \deqn{CH(q)=\frac{trace(B_{q})/(q-1)}{trace(W_{q})/(n-q)}}{CH(q)=[trace(B_q)/(q-1)]/[trace(W_q)/(n-q)]}
    Where \cr
    \eqn{W_{q}=\sum^{q}_{k=1}\sum^{}_{i\in C_{k}}\left(x_{i} - {c}_{k}\right)\left(x_{i} - {c}_{k}\right)^{T}}{W_q=sum^{q}_{k=1} sum_{i in C_k}(x_i-c_k)(x_i-c_k)^T} is the within-group dispersion matrix for data clustered into q clusters.\cr
    \eqn{B_{q}=\sum^{q}_{k=1}n_{k}*\left({c}_{k}-{c}\right)\left({c}_{k}-{c}\right)^{T}}{B_q=sum^{q}{k=1}n_k(c_k - c)(c_k - c)^T} is the between-group dispersion matrix for data clustered into q clusters.\cr
    \eqn{x_{i}}{x_i} = p-dimensional vector of observations of the \eqn{i^{th}}object in cluster k.\cr
    \eqn{{c}_{k}}{c_k} = centroid of cluster k \cr
    \eqn{{c}}{c} = centroid of data matrix \cr
    \eqn{n_{k}}{n_k} = number of objects in cluster \eqn{C_{k}}{C_k} \cr
    
    The value of q (\eqn{q \in (2,...,n-2)}{q in (2,...,n-2)}), which maximizes CH(q), is regarded as specifying the number of clusters.\cr
    This index is calculated if \emph{index = "ch" or "all" or "alllong"}.\cr
    The program for this index comes from the index.G1 function of the
ClusterSim package. However, the program was slightly corrected to take into account clusters with only one observation. \cr
\bold{References : } Milligan and Cooper (1985), Calinski and Harabasz (1974), Gordon (1999) and Walesiak and Dudek (2011). \cr\cr   

    
\bold{3.2. Duda index. Duda and Hart (1973) }
\deqn{duda=\frac{Je(2)}{Je(1)}=\frac{W_{k}+W_{l}}{W_{m}}}{duda=Je(2)/Je(1)=(W_k + W_l) / W_m}
where \cr
Je(2) is the sum of squared errors within cluster when the data are partitioned into two clusters and Je(1) gives the squared errors when only one cluster is present. \cr    
\eqn{W_{k}}{W_k}, \eqn{W_{l}}{W_l}, \eqn{W_{m}}{W_m} are defined as \eqn{W_{q}}{W_q} in CH Index.\cr
It is assumed that clusters \eqn{c_{k}}{c_k} and \eqn{c_{l}}{c_l} are merged to form \eqn{c_{m}}{c_m}.\cr
\eqn{B_{kl}=W_{m}-W_{k}-W_{l}}{B_kl=W_m - W_k - W_l}, if \eqn{c_{m}=c_{k}\cup c_{l}}{c_m=c_k union c_l}.\cr
\eqn{n_{i}}{n_i} = number of observations in cluster \eqn{c_{i}}{c_i}, \eqn{i=k, l, m}. \cr  
The optimal number of clusters is the smallest q such that  
\deqn{duda\geq 1-\frac{2}{\pi p}-z\sqrt{\frac{2\left(1-\frac{8}{\pi^{2}p}\right)}{n_{m}p}}=critValue_Duda}{duda \ge 1-2/(\pi * p) -z * sqrt[2(1-8/(\pi^2 * p))/(n_m * p)]=critValue_Duda}  
p is the number of variables in the data set\cr
z is a standard normal score. Several values for the standard score were tested and the best results were obtained when the value was set to 3.20. \cr   
This index is calculated if \emph{index = "duda" or "all" or "alllong"}.\cr
\bold{References : } Milligan and Cooper (1985), Duda and Hart (1973), Gordon (1999) and
SAS/STAT(R) 9.2 User's Guide, Second Edition, the Cluster Procedure, Miscellaneous
Formulas.
\cr\cr

\bold{3.3. Pseudot2 index. Duda and Hart (1973)\cr}
\deqn{pseudot2=\frac{B_{kl}}{\frac{W_{k}+W_{l}}{n_{k}+n_{l}-2}}}{pseudot2 = B_kl /  [(W_k + W_l)/(n_k+n_l - 2)]}  
\eqn{B_{kl}, W_{k}, W_{l}}{B_kl, W_k, W_l} are defined in Duda index.\cr
     \eqn{n_{k}}{n_k} and \eqn{n_{l}}{n_l} are the number of objects in respectively \eqn{C_{k}}{C_k} and \eqn{C_{l}}{C_l} clusters. \cr
     The optimal number of clusters is the smallest q such that:   \deqn{pseudot2\leq\left(\frac{1-critValue_Duda}{critValue_Duda}\right)\times\left(n_{k}+n_{l}-2\right)}{pseudot2\le (1-critValue_Duda)/critValue_Duda  * (n_k + n_l - 2)}
     This index is calculated if \emph{index = "pseudot2" or "all" or "alllong"}.\cr 
\bold{References : } Milligan and Cooper (1985), Duda and Hart (1973), Gordon (1999) and
SAS/STAT(R) 9.2 User's Guide, Second Edition, the Cluster Procedure, Miscellaneous
Formulas. \cr\cr    
     
\bold{3.4. C-index. Hubert and Levin (1976)\cr}
\deqn{cindex=\frac{Du-\left(r\times D_{min}\right)}{\left(r\times D_{max}\right)-\left(r\times D_{min}\right)}}{cindex=[Du - (r * D_min)]/[(r * D_max)-(r * D_min)]}
\eqn{D_{min} \neq D_{max}}{D_min \neq D_max} \cr
\eqn{cindex \in (0,1)}{cindex in (0,1)}\cr
Du is the sum of all within-cluster dissimilarities \cr
\eqn{r} = number of within-cluster dissimilarities\cr
\eqn{D_{min}}{D_min} = smallest within-cluster dissimilarity\cr
\eqn{D_{max}}{D_max} = largest within-cluster dissimilarity\cr    
The value of q (\eqn{q \in (2,...,n-2)}{q in (2,...,n-2)}) which minimizes cindex is considered as specifying the number of clusters.  \cr
This index is calculated if \emph{index = "cindex" or "all" or "alllong"}. \cr
The program for this index comes from the index.G3 function of the
ClusterSim package.\cr
\bold{References : } Milligan and Cooper (1985), Hubert and Levin (1976), Gordon (1999) and Walesiak and Dudek (2011).
\cr\cr

\bold{3.5. Gamma index. Baker and Hubert (1975)\cr}
\deqn{gamma=\frac{s(+)-s(-)}{s(+)+s(-)}}{gamma=[s(+)-s(-)]/[s(+)+s(-)]}

where:\cr    
\eqn{s(+)}{s(+)}= number of concordant comparisons\cr    
\eqn{s(-)}{s(-)}= number of discordant comparisons\cr

The maximum value across the hierarchy levels is used to select the optimal number of clusters.\cr  
In NbClust, this index is calculated only if \emph{index = "gamma" or "alllong"} because of its high computational demand.\cr
The program and the formulas for this index is based on the index.G2 function of
the ClusterSim package, but the .C function was reprogrammed in R language. \cr
\bold{References : } Milligan and Cooper (1985), Baker and Hubert (1975), Milligan (1981),  Gordon (1999) and Walesiak and Dudek (2011).
\cr\cr

\bold{3.6. Beale index. Beale (1969)\cr}
Beale index is defined by the following formula : \cr
\deqn{beale=F\equiv\frac{\left(\frac{W_{m}-(W_{k}+W_{l})}{W_{k}+W_{l}}\right)}{\left(\left(\frac{n_{m}-1}{n_{m}-2}\right)2^{\frac{2}{p}}-1\right)}}{beale=F=[(W_m-W_k-W_l)/(W_k+W_l)] / [((n_m-1)/(n_m-2))2^(2/p)-1]}

where \cr
\eqn{W_{k}}{W_k}, \eqn{W_{l}}{W_l}, \eqn{W_{m}}{W_m} are defined as \eqn{W_{q}}{W_q} in Calinski and Harabasz index \cr \eqn{n_{m}}{n_m} is the number of objects in cluster \eqn{C_{m}}{C_m}.  \cr  
It is assumed that clusters \eqn{C_{k}}{C_k} and \eqn{C_{l}}{C_l} are merged to form \eqn{C_{m}}{C_m}.\cr    
The optimal number of clusters is obtained by comparing \eqn{F} with an \eqn{F_{p,(N_{m}-2)p}}{F_(p,(N_m-2)*p)} distribution. \cr
The null hypothesis of a single cluster is rejected for significantly large values of \eqn{F}. By default, in \pkg{NbClust}, the \eqn{10\%} significance level was used to reject the null hypothesis.\cr
This index is calculated if \emph{index = "beale" or "all" or "alllong"}.\cr
\bold{References : } Milligan and Cooper (1985), Beale (1969) and Gordon (1999)
\cr\cr

\bold{3.7. Cubic Clustering Criterion (CCC). Sarle (1983)\cr}

\deqn{ccc=\ln\left[\frac{1-E\left(R^{2}\right)}{1-R^{2}}\right]\frac{\sqrt{\frac{np*}{2}}}{\left(0.001+E\left(R^{2}\right)\right)^{1.2}}}{ccc=ln[(1-E(R^2))/(1-R^2)] * sqrt(np*/2)/(0.001+E(R^2))^1.2}

where \cr
\deqn{R^{2}=1-\frac{trace(W)}{trace(T)}}{R^2 = 1-trace(W)/trace(T)} 
\cr
\eqn{T=X'X} is the total-sample sum-of-squares and crossproducts (SSCP) matrix \eqn{(p \times p)}   \cr
 W=T-B is the within-cluster SSCP matrix \eqn{(p \times p)} \cr
\eqn{B=\bar{X}'Z'Z\bar{X}} is between-cluster SSCP matrix \eqn{(p\times p)} \cr
\eqn{\bar{X}=(Z'Z)^{-1}Z'X} \cr
Z is a cluster indicator matrix (\eqn{n\times q}) with element \eqn{z_{ik}=1}{Z_ik=1} if the \eqn{i^{th}}observation belongs to the \eqn{k^{th}}cluster, 0 otherwise. \cr
\deqn{E(R^{2})=1-\left[\frac{\sum^{p*}_{j=1}\frac{1}{n+u_{j}}+\sum^{p}_{j=p^{*}+1}\frac{u^{2}_{j}}{n+u_{j}}}{\sum^{p}_{j=1}u^{2}_{j}}\right]\left[ \frac{(n-q)^{2}}{n}\right]\left[1+\frac{4}{n}\right]}
where : \cr
\eqn{u_{j}=\frac{s_{j}}{c}}{u_j= s_j/c}\cr
\eqn{s_{j}} = square root of the \eqn{{j^{th}}} eigenvalue of \eqn{\frac{T}{(n-1)}}{T/(n-1)}\cr
\eqn{c=\left(\frac{v*}{q}\right)^{\frac{1}{p*}}}{c=(v*/q)^1/p*}\cr
\eqn{v^{*}=\prod^{p^{*}}_{j=1}s_{j}}{v*=\prod^{p*}_{j=1}s_{j}}\cr
\eqn{p*} is chosen to be the largest integer less than \eqn{q} such that \eqn{u_{p}^{*}}{u*_p} is not less than one.\cr

The maximum values across the hierarchy levels is used to indicate the optimal number of clusters in the data.\cr
This index is calculated if \emph{index = "ccc" or "all" or "alllong"}.\cr
\bold{References : } Milligan and Cooper (1985) and Sarle (1983).
\cr\cr

\bold{3.8. PtBiserial index. Examined by Milligan (1980,1981)\cr}
\deqn{ptbiserial=\frac{\left(\bar{d_{b}}-\bar{d_{w}}\right)\left(f_{w}f_{b}/n^{2}_{d}\right)^{1/2}}{S_{d}}}{ptbiserial=((\bar{d_b}-\bar{d_w})(f_w f_b/n_d^{2})^{1/2})/{S_d}}
where:\cr
\eqn{d_{w}}{d_w} = sum of within cluster distances\cr
\eqn{d_{b}}{d_b} = sum of between cluster distances\cr
\eqn{\bar{d_{w}}}{\bar(d_w)},\eqn{\bar{d_{b}}}{\bar(d_b)} = respective means\cr
\eqn{S_{d}}{S_d} = standard deviation of all distances\cr
\eqn{n_{d}}{n_d} = total number of distances\cr
\eqn{f_{w}}{f_w} = number of within cluster distances\cr
\eqn{f_{b}}{f_b} = number of between cluster distances\cr
This index is calculated if \emph{index = "ptbiserial" or "all" or "alllong"}.\cr
\bold{References : } Milligan and Cooper (1985), Milligan (1980,1981), Kraemer (1982) and ltm package.\cr\cr

\bold{3.9. Gplus index. Reviewed by Rohlf (1974) and examined by Milligan (1981a)\cr}

\deqn{G(+)=\frac{2s(-)}{n_{d}\left(n_{d}-1\right)}}{G(+)=[2s(-)]/[n_d( n_d - 1)]}

where:\cr

s(-) is the number of discordant comparisons i.e. the number of times where two points which were in the same cluster had a larger distance than two points not clustered together. \cr
\eqn{n_{d}}{n_d} = total number of distances (which is the same as the total number of observations or objects under study). \cr
Minimum values of the index are used to determine the optimal number of clusters in the data.\cr
In \pkg{NbClust}, this index is calculated only if {index = "gplus" or "alllong"} because of its high computational demand.\cr
\bold{References : } Milligan and Cooper (1985), Rohlf (1974) and Milligan (1981a).\cr\cr

\bold{3.10. DB index. Davies and Bouldin (1979) \cr}
The Davies and Bouldin index is a function of the ratio of the sum of within-cluster scatter to between-cluster separation. It is calculated by the following formula :
\deqn{DB(q) = 1/q \sum^{q}_{r=1} max_{s, r \neq s} \frac{S_{r} + S_{s}}{d_{rs}}}{DB(q) = 1/q \sum^{q}_{r=1} max_{s, r \neq s}((S_r + S_s)/d_rs)}

where \cr
\eqn{r, s=1,...,q}=cluster number\cr
\eqn{q} = number of clusters \eqn{(q\geq 2)}{(q\ge 2)} \cr
\eqn{C_{r}}{C_r}, \eqn{C_{s}}{C_s} = \eqn{r^{th}}, \eqn{s^{th}} cluster \cr
\eqn{d_{rs}=\sqrt[v]{\sum^{p}_{j=1}\left|c_{rj}-c_{sj} \right|^{v}}}{d_rs=sqrt[v](sum_{j=1}{p} |c_rj - c_sj|^v)} = distance between centroids of clusters \eqn{C_{r}}{C_r} and \eqn{C_{s}}{C_s} \cr
(for \eqn{v=2}, \eqn{d_{rs}}{d_rs} is the euclidean distance)\cr
\eqn{c_{r}=\left(c_{r1},...,c_{rp}\right)}{c_r=(c_r1,...,c_rp)}= centroid of cluster \eqn{C_{r}}{C_r} \cr
\eqn{S_r = \sqrt[u]{\frac{1}{n_{r}} \sum_{i \in C_{r} }\sum^{p}_{j=1}\left|x_{ij} - c_{rj} \right|^{u}}}{S_r=sqrt[u]{(1/n_r) sum_{i in C_r}sum_{j=1}{p} |x_ij - c_rj|^u}} = dispersion measure of a cluster \eqn{C_{r}}{C_r} \cr

(for u=2, \eqn{S_{r}}{S_r} is the standard deviation of the distance of objects in cluster \eqn{C_{r}}{C_r} to the centroid of cluster \eqn{C_{r}}{C_r}) \cr
\eqn{n_{r}}{n_r} and \eqn{n_{s}}{n_s} are respectively the number of objects in clusters \eqn{C_{r}}{C_r} and \eqn{C_{s}}{C_s}. \cr
The value of \eqn{q}, which minimizes \eqn{DB(q)}, is regarded as specifying the number of clusters.\cr
In \pkg{NbClust}, this index is calculated if \emph{index = "db" or "all" or "alllong"}.\cr
The program and the formulas for this index come from the index.DB function of the
ClusterSim package. \cr
\bold{References : } Milligan and Cooper (1985), Davies and Bouldin (1979 and Walesiak and Dudek (2011). \cr\cr

\bold{3.11. Frey index. Frey and Van Groenewoud (1972) \cr}
Frey index is the ratio of difference scores from two successive levels in the hierarchy. The numerator is the difference between the mean outside-cluster distances, \eqn{\bar{d}_{v}}{\bar(d_v)}, from each of the two hierarchy levels (level j and level j+1). The denominator is the difference between the mean within cluster distances from the two levels (level j and level j+1). The authors proposed using a ratio score of 1.00 to identify the correct cluster level. The ratios often varied above and below 1.00. The best results occurred when clustering was continued until the ratio fell below 1.00 for the last series of times. At this point, the cluster level before this series was taken as the optimal partition. If the ratio never fell below 1.00, a one cluster solution was assumed.   

\deqn{K=\frac{\bar{d}_{v_{j+1}}-\bar{d}_{v_{j}}}{\bar{d}_{s_{j+1}}-\bar{d}_{s_{j}}}}{K=[\bar(d_vj+1) - \bar(d_vj)] / [\bar(d_sj+1) - \bar(d_sj)]}
where \cr
\eqn{\bar{d}_{v}}{\bar(d_v)} = mean outside-cluster distance \cr
\eqn{\bar{d}_{s}}{\bar(d_v)} = mean within-cluster distance \cr
In \pkg{NbClust}, this index is calculated if {index = "frey" or "all" or "alllong"}.\cr
\bold{References : } Milligan and Cooper (1985) and Frey and Van Groenewoud (1972).\cr\cr

\bold{3.12. Hartigan index. Hartigan (1975) \cr}
The Hartigan index is computed as follows : 

\deqn{hartigan=\left(\frac{trace(W_{q})}{trace(W_{q+1})}-1\right)(n-q-1)}{hartigan = (trace(W_q)/trace(W_q+1) -1 )(n - q - 1)}

where 
\eqn{W_{q}=\sum^{q}_{k=1}\sum_{i \in C_{k}}(x_{i} - \bar{x_{k}})(x_{i} - \bar{x_{k}})^{T}}{W_q = sum_{k=1}{q} sum_{i in C_k}(x_i - \bar{x_k})(x_i - \bar{x_k})^T} is the within-group dispersion matrix for data clustered into \eqn{q} clusters, \eqn{q \in (1,...,n-2)}{q in (1,...,n-2)}.\cr
\eqn{x_{i}}{x_i} = p-dimensional vector of objects of the \eqn{i^{th}} object in cluster \eqn{C_{k}}{C_k}, \cr
\eqn{\bar{x}_{k}}{\bar{x_k}} = centroid of cluster k, \cr
\eqn{n} is the number of observations in the data matrix. \cr

Maximum value of the index is taken as indicating the correct number of clusters in the data (q in (1, ..., n - 2)).\cr 
This index is calculated if {index = "hartigan" or "all" or "alllong"}.\cr
The program and the formulas for this index come from the index.H function of the
ClusterSim package. \cr
\bold{References : } Milligan and Cooper (1985), Hartigan (1975) and Walesiak and Dudek (2011).\cr\cr

\bold{3.13. Tau index. Reviewed by Rohlf (1974) and tested by Milligan (1981a) \cr}
Tau index is computed as follows:   
\deqn{Tau=\frac{s(+)-s(-)}{\left[\left(n_{d}\left(n_{d}-1\right)/2-t\right)\left(n_{d}\left(n_{d}-1\right)/2\right)\right]^{1/2}}}{Tau=[s(+)-s(-)] / [[(n_d(n_d-1)/2-t)(n_d(n_d-1)/2)]^{1/2}]}

where \cr
s(+) is the number of concordant comparisons \cr
s(-) is the number of discordant comparisons.\cr \eqn{n_{d}}{n_d} is the total number of distances (which is the same as the total number of observations or objects under study) \cr
\eqn{t} is the number of comparisons of two pairs of points where both pairs represent within cluster comparisons or both pairs are between cluster comparisons.\cr
The maximum value in the hierarchy sequence was taken as indicating the correct number of clusters. \cr
This index is calculated only if {index = "tau" or "alllong"} because of its high computational cost.\cr
\bold{References : } Milligan and Cooper (1985), Milligan (1981a) and Rohlf (1974).\cr \cr

\bold{3.14. Ratkowsky index. Ratkowsky and Lance (1978) \cr}
This index is based on this formula : \deqn{\frac{\bar{S}}{q^{1/2}}}{\bar{S}/q^{1/2}}. 

The value of \eqn{\bar{S}} is equal to the average of the ratios of \eqn{B/T} where \eqn{B} stands for the Sum of Squares Between the clusters for each variable and \eqn{T} for the Total Sum of Squares for each variable. \cr
The optimal number of clusters is that value of \eqn{q} for which \eqn{\frac{\bar{S}}{q^{1/2}}}{\bar({S}/(q^(1/2)} has its maximum value.\cr
If the value of \eqn{q} is made constant, the Ratkowsky and Lance criterion can be reduced from \eqn{\frac{\bar{S}}{q^{1/2}}}{\bar{S}/(q^(1/2))} to \eqn{\bar{S}}.\cr   
In \pkg{NbClust} package, Ratkowsky and Lance index is computed with the following formula :  
\deqn{ratkowsky=mean(\sqrt{B/T})}{ratkowsky=mean(sqrt(B/T)}
This index is calculated if {index = "ratkowsky" or "all" or "alllong"}.\cr
The program and the formulas for this index come from the clustIndex function of
the cclust package. \cr
\bold{References : } Milligan and Cooper (1985), Ratkowsky and Lance (1978), Hill
(1980), Dimitriadou (2002) and Dimitriadou (2009).\cr\cr

\bold{3.15. Scott index. Scott and Symons (1971) \cr}
Scott index is based on the following formula : 

\deqn{n log \left( \left|T\right| / \left| W \right| \right)}{n log (|T| / |W|)}
where \cr

n is the number of elements in the data set,\cr
\eqn{T} is the total sum of squares (see CCC index), \cr
\eqn{W} is the sum of squares within the clusters (see CCC index).\cr
The maximum difference between hierarchy levels was used to suggest the correct number of partitions. \cr 
This index is calculated if {index = "scott" or "all" or "alllong"}.\cr
The program for this index is based on the clustIndex function of the
cclust package, but it is a little bit different. The difference comes from the definition
of the W and T matrices.\cr
\bold{References : } Milligan and Cooper (1985), Scott and Symons (1971) and Dimitriadou (2009).
\cr\cr

\bold{3.16. Marriot index. Marriot (1971) \cr}
\deqn{marriot=k^{2}|W|}
where \eqn{W} is defined as in CCC index.\cr
The maximum difference between successive levels was used to determine the best partition level.  
This index is calculated if {index = "marriot" or "all" or "alllong"}.\cr
The program for this index is based on the clustIndex function of the
cclust package, but it is a little bit different. The difference comes from the definition
of the W matrix. 
\bold{References : } Milligan and Cooper (1985), Marriot (1971), Dimitriadou (2002) and
Dimitriadou (2009). 

\bold{3.17. Ball index. Ball and Hall (1965) \cr}
This index is based on the average distance of the items to their respective cluster centroids. 

\deqn{ball=\frac{W}{q}}{W/q}

where \eqn{q} is the number of clusters and \eqn{W} is the sum of squares within the clusters.\cr 
The largest difference between levels was used to indicate the optimal solution. \cr
This index is calculated if {index = "ball" or "all" or "alllong"}.\cr
The program for this index come from the clustIndex function of the
cclust package. \cr
\bold{References : } Milligan and Cooper (1985), Ball and Hall (1965), Dimitriadou (2002) and Dimitriadou (2009).\cr\cr

\bold{3.18. TraceCovW index. Milligan and Cooper (1985) \cr}

This index represents the trace of the within clusters pooled covariance matrix. 

\deqn{trcovw=trace\left(cov\left(W\right)\right)}{trcovw=trace(cov(W))}

where \eqn{W} is defined as in CCC.\cr
Maximum differences scores between levels were used to indicate the optimal solution.\cr
This index is calculated if {index = "tracecovw" or "all" or "alllong"}.\cr
The program for this index is based on the clustIndex function of the cclust package, but it is a little bit different. The difference comes from the definition of the W and T matrices.
\bold{References : } Milligan and Cooper (1985) and cclust package.\cr\cr

\bold{3.19. TraceW index. Milligan and Cooper (1985) \cr}

\deqn{tracew=trace(W)}
where \eqn{W} is defined as in CCC index.\cr

Given that the criterion increases monotonically with solutions containing fewer clusters, maximum of the second differences scores were used to determine the number of clusters in the data.\cr
This index is calculated if {index = "tracew" or "all" or "alllong"}.\cr
The program for this index is based on the clustIndex function of the cclust package, but it is a little bit different. The difference comes from the definition of the W matrix.
\bold{References : } Milligan and Cooper (1985), Edwards and Cavalli-Sforza (1965), Friedman and Rubin (1967), Orloci (1967), Fukunaga and Koontz (1970) and Dimitriadou (2009).  \cr\cr

\bold{3.20. Friedman index. Friedman and Rubin (1967) \cr}
This index was proposed as a basis for non hierarchical clustering method. 

\deqn{friedman=trace\left(W^{-1}B\right)}{friedman=trace(W^{-1}B)}
where \eqn{B} and \eqn{W} are defined as in CCC index.\cr
The maximum difference in values of this criterion was used to indicate the optimal number of clusters.
This index is calculated if {index = "friedman" or "all" or "alllong"}.\cr
The program for this index is based on the clustIndex function of the cclust package, but it is a little bit different. The difference comes from the definition of the W and B matrices.
\bold{References : } Milligan and Cooper (1985), Friedman and Rubin (1967) and Dimitriadou (2009). \cr\cr 

\bold{3.21. Mcclain index. McClain and Rao (1975) \cr}

This index consists of the ratio of two terms. The first term is the average within cluster distance divided by the number of within cluster distances. The denominator value was the average between cluster distance divided by the number of cluster distances. It is computed as follows :

\deqn{mcclain= \frac{mean \left(\sum^{k=1}_{q}\sum^{n_{k}}_{i=1}\sum^{n_{k}}_{j=i+1}d_{ij} \right)}{mean\left(\sum^{q}_{k=1} \sum_{i \in C_{k}} \sum^{q}_{l=k+1} \sum_{j \in C_{l}} d_{ij}  \right)}}{mcclain= [mean (\sum^{k=1}_{q}\sum^{n_k}_{i=1}\sum^{n_k}_{j=i+1}d_ij )]/[mean(\sum^{q}_{k=1} \sum_{i \in C_k} \sum^{q}_{l=k+1} \sum_{j \in C_l} d_ij)]}

where \cr

q is the Number of clusters,\cr
\eqn{n_{k}}{n_k} is the number of objects in the \eqn{k^{th}} cluster, \eqn{k \in [1...q]}k in [1...q] \cr
\eqn{d_{ij}=}{d_ij=} distance between \eqn{i^{th}} and \eqn{j^{th}} objects \cr
The minimum value of the index is used to indicate the optimal number of clusters. \cr
This index is calculated if {index = "mcclain" or "all" or "alllong"}.\cr
\bold{References : } Milligan and Cooper (1985) and McClain and Rao (1975).\cr\cr

\bold{3.22. Rubin index. Friedman and Rubin (1967) \cr}
This index is based on the ratio of the determinant of the total sum of squares and cross products matrix to the determinant of the pooled within cluster matrix.  

\deqn{rubin=|T|/|W|}

where \eqn{T} and \eqn{W} are defined as in CCC index. \cr

The minimum value of second differences between levels was used. \cr
This index is calculated if {index = "rubin" or "all" or "alllong"}.\cr
The program for this index is based on the clustIndex function of the cclust package. The difference in results comes from difference in definition of W and T matrices. \cr
\bold{References : } Milligan and Cooper (1985), Friedman and Rubin (1967) and Dimitriadou E (2009).
\cr\cr

\bold{3.23. KL index. Krzanowski and Lai (1988) \cr}

\deqn{KL(q)=\left|\frac{DIFF_{q}}{DIFF_{q+1}}\right|}{KL(q)=|DIFF_{q} / DIFF_{q+1}|}

where \cr \deqn{DIFF_{q}=\left(q-1\right)^{2/p}trace\left(W_{q-1}\right)-q^{2/p}trace\left(W_{q}\right)}{DIFF_{q}=(q-1)^{2/p} trace(W_{q-1}) - q^{2/p}trace(W_{q})} 
\cr
\eqn{W_{q}}{W_{q}}is defined as in Hartigan. \cr
The value of \eqn{q}, which maximizes \eqn{KL(q)}, is regarded as specifying the number of clusters.\cr
This index is calculated if {index = "kl" or "all" or "alllong"}.\cr
The program and the formulas for this index come from the index.KL function of the ClusterSim package, but the program was corrected to take into account clusters with only one observation. \cr
\bold{References : } Krzanowski and Lai (1988) and Walesiak and Dudek (2011). \cr\cr

\bold{3.24. Silhouette index. Kaufman and Rousseeuw (1990) \cr}

\deqn{silhouette=\sum^{n}_{i=1}S(i)/n, silhouette \in \left[-1,\,1\right]}{silhouette = \sum^{n}_{i=1} S(i)/n, silhouette in [-1,1]}

where \cr
 \eqn{S(i)=\frac{b(i)-a(i)}{\max\left\{ a(i);b(i)\right\}}}{S(i)=[b(i)-a(i)] / [max{ a(i);b(i)}]} \cr
\eqn{a(i)=\frac{\sum_{j \in {C_{r}\i}} d_{ij}}{n_{r}-1}}{a(i)=[sum_{j in {C_r \ i }} d_ij]/[n_r - 1]} is the average dissimilarity of the \eqn{i^{th}} object to all other objects of \eqn{C_{r}}{C_r} cluster \cr
	\eqn{b(i)= min_{s \neq r}{d_{iC_{s}}}}{b(i)= min_{s \neq r}{d_{iC_s}}} \cr
	\eqn{d_{iC_{s}}=\frac{\sum_{j \in C_{s}} d_{ij}}{n_{s}}}{d_{iC_s}=[sum_{j in C_s} d_ij] / [n_s]} is the average dissimilarity of the \eqn{i^{th}} object to all objects of \eqn{C_s} cluster \cr
	\eqn{C_{r}}{C_r} and \eqn{C_{s}}{C_s} are respectively \eqn{r^{th}} and \eqn{s^{th}} clusters \cr
	\eqn{n_{r}}{n_r} and \eqn{n_{s}}{n_s} are respectively the number of objects in clusters \eqn{C_{r}}{C_r} and \eqn{C_{s}}{C_s}.\cr
Maximum values of the index are used to determine the optimal number of clusters in the data. \cr
\eqn{S(i)} is not defined for \eqn{k=1} (only one cluster).
This index is calculated if {index = "silhouette" or "all" or "alllong"}.\cr
The program for this index comes from the index.S function of the ClusterSim package.\cr
\bold{References : } Kaufman and Rousseeuw (1990), Rousseeuw (1987) and
Walesiak and Dudek (2011).\cr\cr

\bold{3.25. Gap index. Tibshirani et al. (2001) \cr}

The estimated gap statistic is computed as follows : 

\eqn{Gap(q)=\frac{1}{B}\sum_{b=1}^{B}\log W_{qb}-\log W_{q}}{Gap(q)=(1/B sum_{b=1}^{B} log W_qb) - log W_q}

where \cr
B is the number of reference data sets generated using uniform prescription \cr
\eqn{W_{qb}}{W_qb} is the within-dispersion matrix defined as in Hartigan index. \cr
The optimal number of clusters is choosen via finding the smallest \eqn{q} such that:

\eqn{Gap(q)\geq Gap(q+1)-s_{q+1},\quad(q=1,...,n-2)}{Gap(q) \ge Gap(q+1) - s_{q+1},(q=1,...,n-2)}   

where :
\eqn{s_{q}=sd_{q}\sqrt{1+1/B}}{s_q = sd_q sqrt(1 + 1/B)}\cr
\eqn{sd_{q}}{sd_q} is the standard deviation of \eqn{\left\{ \log W_{qb}\right\} ,b=1,...,B}{{log W_qb} ,b=1,...,B} :  \deqn{sd_{q}=\sqrt{\frac{1}{B}\sum_{b=1}^{B}(\log W_{qb}-\bar{l})^{2}}}{sd_q = sqrt(1/B sum_{b=1}^{B} (log W_qb - \bar{l})^{2}} 
\deqn{\bar{l}=\frac{1}{B} \sum^{B}_{b=1}log W_{qb}}{\bar{l}=1/B sum^{B}_{b=1} log W_qb}\cr
Which is the same as:
\eqn{CritV alue_Gap = Gap(q) ??? Gap(q + 1) + s_{q+1} >=0, \quad(q=1,...,n-2)}\cr

In \pkg{NbClust}, Gap index is calculated only if ("index" = "gap" or "alllong") because of its high computational cost.\cr
\bold{References : } Tibshirani et al. (2001) and Walesiak and Dudek (2011).\cr\cr

\bold{3.26. Dindex. Lebart et al. (2000)  \cr}
The Dindex is based on clustering gain on intra-cluster inertia. Intra-cluster inertia can be defined as:

\deqn{W(P^{q})=\frac{1}{q} \sum^{q}_{k=1} \frac{1}{n_{k}} \sum ^{n_{k}}_{i=1} d(x_{i}, c_{k})}{W(P^{q})=1/q sum^{q}_{k=1} 1/n_k sum ^{n_{k}}_{i=1} d(x_i, c_k)}

Given two partitions, \eqn{P^{k-1}} composed of \eqn{k-1} clusters and \eqn{P^{k}} composed of \eqn{k} clusters, the clustering gain on intra-cluster inertia is defined as : 

\deqn{Gain = W(P^{q-1}) - W(P^{q})}

This clustering gain should be minimized. 
The optimal cluster configuration can be identified by the sharp knee that corresponds to a significant decrease of the \bold{first differences} of clustering gain versus the number of clusters. This knee or great jump of gain values can be identified by a significant peak in \bold{second differences} of clustering gain.\cr 
Dindex is calculated if ("index" = "dindex" or "all" or "alllong").
\bold{References : } Lebart et al. (2000). \cr\cr

\bold{3.27. Dunn index. Dunn(1974) \cr}

The Dunn index defines the ratio between the minimal intercluster distance to maximal intracluster distance.
The index is given by:                             

\deqn{Dunn=  \frac{min_{1\le i < j \le q} d(C_{i}, C_{j})}{max_{1\le k\le q} diam(C_{k})}}{Dunn=  [min_{1\le i < j \le q} d(C_i, C_j)] / [max_{1 \le k \le q} diam(C_k)]} 

Where \eqn{q} is the number of clusters, \cr \eqn{d(C_{i},C_{j})}{d(C_i,C_j)} is the dissimilarity function between two clusters \eqn{C_{i}}{C_i} and \eqn{C_{j}}{C_j} defined as \eqn{d(C_{i},C_{j}) = \min_{x\in C_{i}, y\in C_{j}} d(x,y)}{d(C_i,C_j) = min_{x in C_i, y in C_j} d(x,y)} \cr
diam(C) is the diameter of a cluster. It can be defined as follows :

  \deqn{diam(C) = max_{x,y \in C} d(x,y)}{diam(C) = max_{x,y in C} d(x,y)}
  
Dunn index should be maximized. \cr
Dunn is calculated if ("index" = "dunn" or "all" or "alllong").
\bold{References : } Dunn (1974) and clValid package. \cr\cr

\bold{3.28. Hubert index. Hubert and Arabie 1985 \cr}

Hubert \eqn{\Gamma} statistic is the point serial correlation coefficient between any two matrices. When the two matrices are symmetric, \eqn{\Gamma} can be written in its raw form as :  

\deqn{\Gamma (P,Q) = \frac{1}{M} \sum^{n-1}_{i=1} \sum^{n}_{j=i+1} P_{ij}Q_{ij}}{\Gamma (P,Q) = 1/M sum^{n-1}_{i=1} sum^{n}_{j=i+1} P_ij Q_ij}

where \cr
\eqn{M = n(n-1)/2}, \cr
P is the proximity matrix of the data set, \cr
Q is an  \eqn{n \times n} matrix whose \eqn{(i,j)} element is equal to the distance between the representative points \eqn{(v_{ci}, v_{cj})}{(v_ci, v_cj)} of the clusters where the objects \eqn{x_{i}}{x_i} and \eqn{x_{j}}{x_j} belong.\cr
We note, that for \eqn{q=1} or \eqn{q=n}, the index is not defined.  \cr

The definition of Hubert normalized \eqn{\Gamma} statistic is given by the following equation :

\deqn{\bar{\Gamma} = \frac{(\sum^{n-1}_{i=1}\sum^{n}_{j=i+1}(P_{ij}-\mu_{P})(Q_{ij}-\mu_{Q}))}{\sigma_{P} \sigma_{Q}}}{\bar{\Gamma} = ((sum^{n-1}_{i=1} sum^{n}_{j=i+1} (P_{ij}-\mu_{P})(Q_{ij}-\mu_{Q})))/\sigma_{P} \sigma_{Q}} 

where \eqn{\mu_{P}}, \eqn{\mu_{Q}}, \eqn{\sigma_{P}}, \eqn{\sigma_{Q}} are the respective means and variances of P, Q matrices. This index takes values between -1 and 1. If \eqn{P} and \eqn{Q} are not symmetric then all summations are extended over all \eqn{n^{2}} entries and \eqn{M=n^{2}}.

High values of normalized \eqn{\Gamma} statistic indicate the existence of compact clusters. Thus, in the plot of normalized \eqn{\Gamma} versus \eqn{q}, the number of clusters, we seek a significant knee that corresponds to a significant increase of normalized \eqn{\Gamma} as \eqn{q} varies from \eqn{q_{max}}{q_max} to 2, where \eqn{q_{max}}{q_max} is the maximum possible number of clusters.\cr
The number of clusters at which the knee occurs is an indication of the number of clusters that underlie the data.  
In \pkg{NbClust}, second differences values of normalized \eqn{\Gamma} statistic are plotted to help distinguish the knee from other anomalies. A significant peak in this plot indicates the optimal number of clusters.\cr
This index is computed if ("Index"= "hubert" or "all" or "alllong").\cr
\bold{References : } Hubert and Arabie (1985), Bezdek and Pal (1998) and Halkidi et al. (2001).\cr\cr

\bold{3.29. SDindex. Halkidi et al.(2000)\cr}
The SD validity index definition is based on the concepts of average scattering for clusters and total separation between clusters. It is computed as follows :   
\deqn{SDindex(q)=\alpha Scat(q) + Dis(q)}
  The first term (\eqn{Scat(q}) indicates the average compactness of clusters (i.e. intra-cluster distance). 
\deqn{Scat(q) = \frac{1}{q} \sum^{q}_{k=1} \left\|\sigma(c_{k})\right\|/\left\|\sigma(X)\right\| }{Scat(q) = 1/q \sum^{q}_{k=1} |\sigma(c_k)|/|\sigma(X)| }
  
  where \cr
  \eqn{q} is the number of clusters,
  \eqn{\sigma_{X}} is the variance of the data set X, \cr   
  \eqn{|X|=(X^{T}X)^{2})^{1/2}}{|X|=(X^{T} X)^{2})^{1/2}}. 

The second term \eqn{Dis(q)} indicates the total separation between the \eqn{q} clusters (i.e. an indication of inter-cluster distance).

\deqn{Dis(q)=\frac{D_{max}}{D_{min}}\sum ^{q}_{k=1}\left(\sum^{q}_{z=1}\left\|c_{k}-c_{z}\right\| \right)^{-1} }{Dis(q)=D_max / D_min \sum ^{q}_{k=1}(\sum^{q}_{z=1} |c_k-c_z|)^{-1}}
  
where \eqn{D_{max}=max(|c_{k}-c_{z}|)}{D_max=max(|c_k - c_z|)} \eqn{\forall k,z in {1,2,3,...,q}}{\forall k,z in {1,2,3,...,q}} is the maximum distance between cluster centers.\cr 
The \eqn{D_{min}=min\left(\left\|c_{k}-c_{z}\right\| \right)}{D_min=min(|c_k - c_z|)} \eqn{\forall k,z \in \left\{1,2,3,...,q \right\}}{\forall k,z in {1,2,3,...,q}} is the minimum distance between cluster centers.\cr   
Alpha is a weightening factor equal to \eqn{Dis({q_{max}})}{Dis({q_max})} where \eqn{q_{max}}{q_max} is the maximum number of input clusters. \cr 
The number of clusters, \eqn{q}, that minimizes the above index can be considered as an optimal value for the number of clusters present in the data set.  \cr 
Unlike in clv package, where Alpha is equal to \eqn{q_{max}}{q_max}, in \pkg{NbClust} package, Alpha is equal to \eqn{Dis({q_{max}})}{Dis({q_max})} as it is mentioned (Halkidi, 2000).\cr
This index is computed if ("Index"= "SDindex" or "all" or "alllong").\cr
\bold{References : } (Halkidi, 2000) \cr\cr

\bold{3.30. SDbw. Halkidi et al.(2001)\cr}

The SDbw validity index definition is based on the criteria of compactness and separation between clusters. It is computed as follows:

\deqn{SDbw(q)=Scat(q) + Density.bw(q)}

The first term, \eqn{Scat(q)}, is the same computed in SDindex. The second term, \eqn{Density.bw(q)}, is the inter-cluster density. It evaluates the average density in the region among clusters in relation to the density of the clusters.   
  \deqn{Density.bw(q)=\frac{1}{q(q-1)}\sum^{q}_{i=1} \left(\sum^{q}_{j=1,i \neq j} \frac{density(u_{ij})}{max(density(c_{i}), density(c_{j}))}\right)}{Density.bw(q)=1/q(q-1) \sum^{q}_{i=1} (\sum^{q}_{j=1,i \neq j} density(u_ij) / max(density(c_i), density(c_j)))}
	
where \eqn{c_{i}}{c_i} and \eqn{c_{j}}{c_j} are the centers of clusters and \eqn{u_{ij}}{u_ij} the middle point of the line segment defined by the clusters centers \eqn{c_{i}}{c_i}, \eqn{c_{j}}{c_j}. 

\deqn{density(u)=\sum^{n_{ij}}_{l=1} f(x_{l},u)}{density(u)=\sum^{n_ij}_{l=1} f(x_l,u)}

\eqn{n_{ij}}{n_ij}is the number of tuples that belong to the clusters \eqn{C_{i}}{C_i} and \eqn{C_{j}}{C_j}. \eqn{f(x,u)} is equal to 0 if d(x,u) > stdev and 1 otherwise.\cr 
Stdev is the average standard deviation of clusters.

\deqn{stdev=\frac{1}{q}\sqrt{\sum^{q}_{i=1} \left\| \sigma(c_{i}) \right\|}}{stdev=1/q sqrt(\sum^{q}_{i=1}  |\sigma(c_i)|)}
  
The number of clusters \eqn{q} that minimizes SDbw is considered as the optimal value for the number of clusters in the data set. \cr
This index is computed if ("Index"= "SDbw" or "all" or "alllong").\cr
\bold{References : } Halkidi and Vazirgiannis (2001)

}%enumerate    

The table below summarizes indices implemented in NbClust and the criteria used to select the optimal number of clusters. \cr 

\tabular{lll}{
     \bold{Index in literature}           \tab \bold{Index in NbClust} \tab \bold{Optimal number of clusters} \cr 
     1. Krzanowski and Lai       \tab "kl" or "all" or "alllong" \tab Maximum value of the index \cr
2. Calinski and Harabasz    \tab "ch" or "all" or "alllong" \tab Maximum value of the index \cr
3. Hartigan                 \tab "hartigan" or "all" or "alllong"  \tab Maximum difference between \cr
                            \tab                                   \tab hierarchy levels of the index \cr
4. Cubic Clustering Criterion \tab "ccc" or "all" or "alllong"  \tab Maximum value of the index \cr
5. \eqn{n\log\left(|T|/|W|\right)} \tab "scott" or "all" or "alllong" \tab Maximum difference between \cr
                             \tab                                     \tab hierarchy levels of the index \cr
6.  \eqn{k^{2}|W|}          \tab "marriot" or "all" or "alllong" \tab Max. value of second differences\cr
                             \tab                        \tab  between levels of the index \cr
7.  Trace Cov W             \tab "trcovw" or "all" or "alllong" \tab Maximum difference between \cr
                            \tab                                \tab hierarchy levels of the index \cr                            
8.  Trace  W                 \tab "tracew" or "all" or "alllong" \tab Maximum value of absolute second \cr
                             \tab                                \tab differences between levels of the index\cr
9.  Trace \eqn{W^{-1}B}      \tab "friedman" or "all" or "alllong" \tab Maximum difference between \cr
                            \tab                                   \tab hierarchy levels of the index \cr
10. \eqn{|T|/|W|}            \tab "rubin" or "all" or "alllong" \tab Minimum value of second differences \cr  
                            \tab                               \tab         between levels of the index \cr
11.  C-index                  \tab "cindex" or "all" or "alllong" \tab Minimum value of the index \cr
12.  Davies and Bouldin       \tab "db" or "all" or "alllong" \tab Minimum value of the index \cr
13.  Silhouette               \tab "silhouette" or "all" or "alllong" \tab Maximum value of the index \cr
14. \eqn{Je(2)/Je(1)}         \tab "duda" or "all" or "alllong" \tab Smallest \eqn{n_{c}} such that index > criticalValue \cr
15. \eqn{Pseudo t^{2}}        \tab "pseudot2" or "all" or "alllong"        \tab Smallest \eqn{n_{c}} such that index < criticalValue \cr
16. Beale                     \tab "beale" or "all" or "alllong"            \tab \eqn{n_{c}} such that critical value of the index >= alpha \cr
17. \eqn{\overline{c}/k^{.5}} \tab "ratkowsky" or "all" or "alllong" \tab Maximum value of the index \cr
18. Ball and Hall             \tab "ball" or "all" or "alllong" \tab Maximum difference between hierarchy \cr
                              \tab                              \tab levels of the index \cr
19. Point-Biserial            \tab "ptbiserial" or "all" or "alllong" \tab Maximum value of the index \cr
20. Gap                       \tab "gap" or "alllong"\tab Smallest \eqn{n_{c}} such that criticalValue >= 0 \cr
21. Frey and Groenewood       \tab "frey" or "all" or "alllong"\tab the cluster level before that index value < 1.00 \cr
22. McClain and Rao           \tab "mcclain" or "all" or "alllong"\tab Minimum value of the index \cr
23. Gamma                     \tab "gamma" or "alllong" \tab Maximum value of the index \cr
24. G(+)                      \tab "gplus" or "alllong"\tab Minimum value of the index \cr
25. Tau                       \tab "tau" or "alllong" \tab Maximum value of the index \cr
26. Dunn                      \tab "dunn" or "all" or "alllong" \tab Maximum value of the index \cr
27. Modified statistic of Hubert \tab "hubert" or "all" or "alllong" \tab Graphical method \cr
28. SD                        \tab "sdindex" or "all" or "alllong" \tab Minimum value of the index \cr
29. Lebart                    \tab "dindex" or "all" or "alllong" \tab Graphical method\cr
30. SDbw                      \tab "sdbw" or "all" or "alllong" \tab Minimum value of the index \cr
}% tabular

}% details
\examples{
## A 2-dimensional example
x<-rbind(matrix(rnorm(100,sd=0.1),ncol=2),
         matrix(rnorm(100,mean=1,sd=0.2),ncol=2),
         matrix(rnorm(100,mean=5,sd=0.1),ncol=2),
         matrix(rnorm(100,mean=7,sd=0.2),ncol=2))
         
NbClust(x, diss="NULL", distance = "euclidean", min.nc=2, max.nc=8, 
            method = "complete", index = "ch", alphaBeale = 0.1)

## A 3-dimensional example 
x<-rbind(matrix(rnorm(150,sd=0.3),ncol=3),
          matrix(rnorm(150,mean=3,sd=0.2),ncol=3),
          matrix(rnorm(150,mean=5,sd=0.3),ncol=3))
NbClust(x, diss="NULL", distance = "euclidean", min.nc=2, max.nc=10, 
            method = "ward", index = "dindex", alphaBeale = 0.1)

## A 5-dimensional example
x<-rbind(matrix(rnorm(150,sd=0.3),ncol=5),
          matrix(rnorm(150,mean=3,sd=0.2),ncol=5),
          matrix(rnorm(150,mean=1,sd=0.1),ncol=5),
          matrix(rnorm(150,mean=6,sd=0.3),ncol=5),
          matrix(rnorm(150,mean=9,sd=0.3),ncol=5))
NbClust(x, diss="NULL", distance = "euclidean", min.nc=2, max.nc=10, 
            method = "ward", index = "all", alphaBeale = 0.1)

## A real data example
data<-iris[,-c(5)] 
NbClust(data, diss="NULL", distance = "euclidean", min.nc=2, max.nc=6, 
            method = "ward", index = "kl", alphaBeale = 0.1) ## KL index
            
NbClust(data, diss="NULL", distance = "euclidean", min.nc=2, max.nc=6, 
            method = "kmeans", index = "hubert", alphaBeale = 0.1)

NbClust(data, diss="NULL", distance = "manhattan", min.nc=2, max.nc=6, 
            method = "complete", index = "all", alphaBeale = 0.1) 
            ## Only indices with low computational cost (26 indices).
             
}
\author{
  Malika Charrad, Nadia Ghazzali, Veronique Boiteau and Azam Niknafs  
}
\references{  
    Baker FB, Hubert LJ (1975). "Measuring the Power of Hierarchical Cluster Analysis." Journal of the American Statistical Association, 70(349), 31-38. URL http://www.jstor.org/
stable/2285371.\cr

    Ball GH, Hall DJ (1965). "ISODATA, A novel method of data analysis and pattern classification". Menlo Park: Stanford Research Institute. (NTIS No. AD 699616).\cr
    
    Beale EML (1969). Cluster analysis. Scientific Control Systems, London.\cr
    
    Bezdek J, Pal N (1998). "Some new indexes of cluster validity". IEEE transactions on systems, man and cybernetics, 28(3).\cr    
    
    Brock G, Pihur V, Datta S, Datta S (2008). "clvalid: Validation of Clustering Results". R package version 0.6-4, URL http://cran.r-project.org/web/packages/clvalid.\cr
    
    Calinski T, Harabasz J (1974). "A dendrite method for cluster analysis." Communications in Statistics - Theory and Methods, 3(1), 1-27. doi:10.1080/03610927408827101. URL \cr
http://dx.doi.org/10.1080/03610927408827101. \cr

    Chang F, Carey V, Qiu W, Zamar RH, Lazarus R, Wang X (2008). clues: Clustering Method Based on Local Shrinking. R package version 0.5-0, URL http://cran.r-project.org/
web/packages/clues. \cr

    Davies DL, Bouldin DW (1979). "A cluster separation measure". IEEE Transactions on Pattern Analysis and Machine Intelligence, 1(2), 224-227.\cr
    
    Dimitriadou E (2009). "cclust: Convex Clustering Methods and Clustering Indexes". R package version 0.6-16, URL http://cran.r-project.org/web/packages/cclust/. \cr
    
    Dimitriadou E, Dolnicar S, Weingessel A (2002). "An examination of indexes for determining the number of clusters in binary data sets". Psychometrika, 67(3), 137-160.\cr
    
    Duda RO, Hart PE (1973). "Pattern classification and scene analysis". John Wiley and Sons, Inc., New York, USA. ISBN 0-471-22361-1.  \cr
    
    Dunn J (1974). "Well separated clusters and optimal fuzzy partitions". Journal Cybern, pp. 95-104.  \cr
    
    Edwards AWF, Cavalli-Sforza L (1965). "A method for cluster analysis". Biometrics, 21(2), 362-375.   \cr
    
    Frey T, Van Groenewoud H (1972). "A cluster analysis of the D-squared matrix of white spruce stands in Saskatchewan based on the maximum-minimum principle". Journal of
Ecology, 60(3), 873-886.  \cr
    
    Friedman HP, Rubin J (1967). "On some invariant criteria for grouping data". Journal of the American Statistical Association, 62(320), 1159-1178. \cr

    Fukunaga K, Koontz WLG (1970). "A criterion and an algorithm for grouping data". IEEE Transactions on Computers, C-19(10), 917-923. \cr

    Gordon A (1999). "Classification". 2nd edition. Chapman & Hall/CRC, London. ISBN 1-58488-013-9.   \cr
    
    Halkidi M, Batistakis I, Vazirgiannis M (2001). "On clustering validation techniques". Journal of Intelligent Information Systems, 17(2/3), 107-145.   \cr
    
    Halkidi M, Vazirgiannis M (2001). "Clustering validity assessment: finding the optimal partitioning of a data set". Proceeding ICDM '01 Proceedings of the 2001 IEEE International
    Conference on Data Mining, pp. 187-194. \cr
    
    Halkidi M, Vazirgiannis M, Batistakis I (2000). "Quality Scheme Assessment in the Clustering Process". PKDD2000, pp. 265-276. \cr
    
    Hartigan JA (1975). Clustering Algorithms. John Wiley & Sons, Inc., New York, NY, USA. ISBN 047135645X. \cr

    Hill RS (1980). "A stopping rule for partitioning dendrograms". Botanical Gazette, 141(3), 321-324. \cr
    
    Hubert LJ, Arabie P (1985). "Comparing partitions". Journal of Classification, 2, 193-218. \cr
    
    Hubert LJ, Levin JR (1976). "A General Statistical Framework for Assessing Categorical Clustering in Free Recall". Psychological Bulletin, 83(6), 1072-1080. \cr 
    URL http://www.eric.ed.gov/ERICWebPortal/contentdelivery/servlet/ERICServlet?accno=ED116162. \cr
    
    Kaufman L, Rousseeuw P (1990). Finding groups in data: an introduction to cluster analysis. Wiley, New York, NY, USA. \cr

    Kraemer HC (1982). "Biserial Correlation", Encyclopaedia of Statistical Sciences, Volume 1. Wiley, pages 276-279. \cr
    
    KrzanowskiWJ, Lai YT (1988)."A Criterion for Determining the Number of Groups in a Data Set Using Sum-of-Squares Clustering". Biometrics, 44(1), 23-34. doi:10.2307/2531893. \cr
    
    Lebart L, Morineau A, Piron M (2000). Statistique exploratoire multidimensionnelle. Dunod, Paris, France. ISBN 2100053515. \cr
    
    Marriot FHC (1971). "Practical problems in a method of cluster analysis." Biometrics, 27(3), 501-514. \cr
    
    Milligan G (1981a). "A Monte Carlo study of thirty internal criterion measures for cluster analysis". Psychometrika, 46(2), 187-199. \cr
    
    Milligan G, Cooper M (1985). "An examination of procedures for determining the number of clusters in a data set." Psychometrika, 50(2), 159-179. \cr
    
    Milligan GW (1980). "An examination of the effect of six types of error perturbation on fifteen clustering algorithms". Psychometrika, 45(3), 325-342.  \cr

    Nieweglowski L (2009). clv: Cluster Validation Techniques. R package version 0.3-2, URL http://cran.r-project.org/web/packages/clv.  \cr
    
    Orloci L (1967). "An agglomerative method for classification of plant communities". Journal of Ecology, 55(1), 193-206.     \cr

    Ratkowsky DA, Lance GN (1978). "A criterion for determining the number of groups in a classification". Australian Computer Journal, 10, 115-117. \cr
    
    Rholf F (1974). "Methods of comparing classifications". Annual Review of Ecology and Systematics, 5, 101-113.     \cr  

    Rousseeuw P (1987). "Silhouettes: a graphical aid to the interpretation and validation of cluster analysis". Journal of Computational and Applied Mathematics, 20, 53-65. \cr
    
    Sarle WS (1983). "SAS Technical Report A-108, Cubic clustering criterion". Cary, N.C.: SAS Institute Inc. \cr
    
    Scott AJ, Symons MJ (1971). "Clustering methods based on likelihood ratio criteria". Biometrics, 27(2), 387-397.  \cr
    
    Sheikholeslami C, Chatterjee S, Zhang A (1998)."WaveCluster: A-MultiResolution Clustering Approach for Very Large Spatial Database." Proceedings of 24th VLDB Conference. \cr

    Theodoridis S, Koutroubas K (1999). "Pattern recognition". Academic Press. \cr
    
    Tibshirani R, Walther G, Hastie T (2001). "Estimating the number of clusters in a data set via the gap statistic". Journal of the Royal Statistical Society: Series B (Statistical
    Methodology), 63(2), 411-423. doi:10.1111/1467-9868.00293. URL http://dx.doi.org/10.1111/1467-9868.00293.\cr
    
    Walesiak M, Dudek A (2011). "clusterSim: Searching for optimal clustering procedure for a data set". R package version 0.40-6, URL http://cran.r-project.org/web/packages/clusterSim. 

}
\keyword{Validity Indices}
\keyword{Number of clusters}
\keyword{clustering validation}
\keyword{clustering algorithms}
\keyword{cluster validity}

