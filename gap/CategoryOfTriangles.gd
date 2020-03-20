
#############################################################################
##
##  TriangulatedCategories.gi             TriangulatedCategories package
##
##  Copyright 2018,                       Kamal Saleh, Siegen University, Germany
##
#############################################################################

DeclareCategory( "IsCapCategoryOfExactTriangles", IsCapCategory );

DeclareCategory( "IsCapExactTriangle", IsCapCategoryObject );

DeclareCategory( "IsCapExactTrianglesMorphism", IsCapCategoryMorphism );

######

DeclareAttribute( "CategoryOfExactTriangles", IsTriangulatedCategory );

DeclareAttribute( "UnderlyingCategory", IsCapCategoryOfExactTriangles );

######

DeclareOperation( "ExactTriangle", [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

DeclareAttribute( "StandardExactTriangle", IsCapCategoryMorphism );

DeclareOperation( "ExactTriangleByOctahedraAxiom", [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

DeclareAttribute( "DomainMorphism", IsCapExactTriangle );

DeclareAttribute( "MorphismIntoConeObject", IsCapExactTriangle );

DeclareAttribute( "MorphismFromConeObject", IsCapExactTriangle );

KeyDependentOperation( "MorphismAt", IsCapExactTriangle, IsInt, ReturnTrue );

KeyDependentOperation( "ObjectAt", IsCapExactTriangle, IsInt, ReturnTrue );

DeclareOperation( "\[\]", [ IsCapExactTriangle, IsInt ] );

DeclareOperation( "\^", [ IsCapExactTriangle, IsInt ] );

######

DeclareOperation( "MorphismOfExactTriangles",
      [ IsCapExactTriangle, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapExactTriangle ] );

KeyDependentOperation( "MorphismAt", IsCapExactTrianglesMorphism, IsInt, ReturnTrue );

DeclareOperation( "\[\]", [ IsCapExactTrianglesMorphism, IsInt ] );

######

DeclareProperty( "IsIdenticalToStandardExactTriangle", IsCapExactTriangle );

DeclareAttribute( "IsomorphicStandardExactTriangle", IsCapExactTriangle );

DeclareAttribute( "Rotation", IsCapExactTriangle );

DeclareOperation( "Rotation", [ IsCapExactTriangle, IsBool ] );

DeclareAttribute( "ReverseRotation", IsCapExactTriangle );

DeclareAttribute( "WitnessIsomorphismIntoStandardExactTriangle", IsCapExactTriangle );

DeclareAttribute( "WitnessIsomorphismFromStandardExactTriangle", IsCapExactTriangle );
