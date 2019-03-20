#@Aythor:李定洋
#@id:1730416008
#@Email:1064204699@qq.com
#Q1

D1 = read.table("/Users/lidingyang/Downloads/1730416008_李定洋/group/groupA.txt")
D2 = read.table("/Users/lidingyang/Downloads/1730416008_李定洋/group/groupB.txt")
D3 = read.table("/Users/lidingyang/Downloads/1730416008_李定洋/group/groupC.txt")
D4 = read.table("/Users/lidingyang/Downloads/1730416008_李定洋/group/groupD.txt")
C1=as.matrix(D1)
C2=as.matrix(D2)
C3=as.matrix(D3)
C4=as.matrix(D4)
#F1
Dat1<-stack(list("group A"=as.vector(C1),"group B"=as.vector(C2),"group C"=as.vector(C3),"group D"=as.vector(C4)))
Dat1
#F2
Dat1<-data.frame(X=c(C1,C2,C3,C4),
                 Y=c(rep("group A",length(C1)),rep("group B",length(C2)),rep("group C",length(C3)),rep("group D",length(C4))))
Dat1
#Q2
DH=read.table("/Users/lidingyang/Downloads/1730416008_李定洋/height.txt")
DW=read.table("/Users/lidingyang/Downloads/1730416008_李定洋/weight.txt")
DT=read.table("/Users/lidingyang/Downloads/1730416008_李定洋/try.txt")
K1=as.data.frame(DH)
names(K1)<-c("Name","Height")
K2=as.data.frame(DW)
names(K2)<-c("Name","Weight")
K3=as.matrix(DT)
K3=t(K3)
K3=as.data.frame(K3)
names(K3)<-c("Name","Try")
K1K2=merge(x=K1,y=K2,by="Name")
Dat2=merge(x=K1K2,y=K3,by="Name")
Dat2
#Q3
mean(Dat2[,2])
#平均值168.8604
max(Dat2[,3])
#最大值107
min(as.vector(Dat2[,4]),na.rm = TRUE)
#最小值1
#Q4
DG=read.table("/Users/lidingyang/Downloads/1730416008_李定洋/group.txt")
Dat3=as.data.frame(DG)
names(Dat3)<-c("Name","Group")
Dat4=merge(x=Dat2,y=Dat3,by="Name")
boxplot(Weight~Group,Dat4,col=c("blue","red","green"))