library(remotes)
bioc = remotes:::bioc_version()

# CRAN repos snapshot
when = '2018-10-24'
repos = list(snapshot = paste0('http://mran.revolutionanalytics.com/snapshot/', when),
             cran = 'https://cloud.r-project.org/',
             bioc = paste0('https://bioconductor.org/packages/', bioc, '/bioc'),
             bioc_annot = paste0('https://bioconductor.org/packages/', bioc, '/data/annotation')
             )
options(repos = list(CRAN = repos$snapshot))

# install CRAN packages
pkgs = c('optparse',
         'dlstats',
         'doMC',
         'venn', 
         'UpSetR',
         'PRROC')
install.packages(pkgs)

# install bioconductor packages
pkgs = c('recount',
         'ComplexHeatmap')
for (pkg in pkgs){
    install_version(pkg, repos=repos$bioc)
}

# install github packages
devtools::install_github('krassowski/complex-upset')
