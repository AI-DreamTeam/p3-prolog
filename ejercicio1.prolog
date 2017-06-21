%Human declarations
female(mona).
female(marge).
female(lisa).
female(maggie).
female(jacqueline).
female(selma).
female(paty).

male(clancy).
male(abraham).
male(mr_burns).
male(homero).
male(bart).
male(kang).

marriedT(homero,marge).
marriedT(abraham,mona).
marriedT(jacqueline,clancy).


descendanT(marge,jacqueline).
descendanT(selma,jacqueline).
descendanT(paty,jacqueline).

descendanT(homero,abraham).
descendanT(bart,marge).
descendanT(lisa,homero).

% Helper functions
married(X,Y):- marriedT(X,Y);marriedT(Y,X).
descendant(KID,PARENT):- descendanT(KID,PARENT);(married(PARENT,WIFE),descendanT(KID,WIFE)).

sibling(X,Y):- descendant(X,PARENT),descendant(Y,PARENT).

father(FATHER,KID):- descendant(KID,FATHER),male(FATHER).
mother(MOTHER,KID):- descendant(KID,MOTHER),female(MOTHER).

gparent(GPARENT,KID):- descendant(KID,PARENT),descendant(PARENT,GPARENT).
gmother(GMOTHER,KID):- gparent(GMOTHER,KID),female(GMOTHER).
gfather(GFATHER,KID):- gparent(GFATHER,KID),male(GFATHER).


