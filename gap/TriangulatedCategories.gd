#############################################################################
##
##  TriangulatedCategories.gi             TriangulatedCategories package
##
##  Copyright 2018,                       Kamal Saleh, Siegen University, Germany
##
#############################################################################


#################################
##
##  Declarations
##
#################################

if not IsBound( Reasons ) then 
    DeclareGlobalVariable( "Reasons" );
    InstallValue( Reasons, [ fail ] );
    DeclareGlobalVariable( "AddToReasons" );
    DeclareGlobalVariable( "why" );
    InstallValue( AddToReasons, function( s )
                                Add( Reasons, s, 1 ); 
                                MakeReadWriteGlobal("why");
                                why := s;
                                MakeReadOnlyGlobal("why");
                                end );
fi;


DeclareGlobalVariable( "CAP_INTERNAL_TRIANGULATED_CATEGORIES_BASIC_OPERATIONS" );

DeclareGlobalVariable( "TRIANGULATED_CATEGORIES_METHOD_NAME_RECORD" );

DeclareCategory( "IsCapCategoryTriangle", IsCapCategoryObject );

DeclareCategory( "IsCapCategoryExactTriangle", IsCapCategoryTriangle );

DeclareCategory( "IsCapCategoryCanonicalExactTriangle", IsCapCategoryExactTriangle );

DeclareCategory( "IsCapCategoryTrianglesMorphism", IsCapCategoryMorphism );


####################################
##
##  Methods Declarations in Records
##
####################################


DeclareOperation( "ShiftOfObject", [ IsCapCategoryObject ] );

DeclareOperation( "AddShiftOfObject", [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddShiftOfObject", [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddShiftOfObject", [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddShiftOfObject", [ IsCapCategory, IsList ] );


DeclareOperation( "ShiftOfMorphism", [ IsCapCategoryMorphism ] );
 
DeclareOperation( "AddShiftOfMorphism", [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddShiftOfMorphism", [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddShiftOfMorphism", [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddShiftOfMorphism", [ IsCapCategory, IsList ] );


DeclareOperation( "ReverseShiftOfObject", [ IsCapCategoryObject ] );

DeclareOperation( "AddReverseShiftOfObject", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddReverseShiftOfObject", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddReverseShiftOfObject", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddReverseShiftOfObject", [ IsCapCategory, IsList ] );


DeclareOperation( "ReverseShiftOfMorphism", [ IsCapCategoryMorphism ] );

DeclareOperation( "AddReverseShiftOfMorphism", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddReverseShiftOfMorphism", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddReverseShiftOfMorphism", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddReverseShiftOfMorphism", [ IsCapCategory, IsList ] );

##
DeclareOperation( "ShiftExpandingIsomorphism", [ IsList ] );

DeclareOperation( "ShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategoryObject, IsList, IsCapCategoryObject ] );

DeclareOperation( "AddShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategory, IsList ] );

##
DeclareOperation( "ShiftFactoringIsomorphism", [ IsList ] );

DeclareOperation( "ShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategoryObject, IsList, IsCapCategoryObject ] );

DeclareOperation( "AddShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategory, IsList ] );

##
DeclareOperation( "ReverseShiftExpandingIsomorphism", [ IsList ] );

DeclareOperation( "ReverseShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategoryObject, IsList, IsCapCategoryObject ] );

DeclareOperation( "AddReverseShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddReverseShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddReverseShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddReverseShiftExpandingIsomorphismWithGivenObjects", [ IsCapCategory, IsList ] );

##
DeclareOperation( "ReverseShiftFactoringIsomorphism", [ IsList ] );

DeclareOperation( "ReverseShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategoryObject, IsList, IsCapCategoryObject ] );

DeclareOperation( "AddReverseShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddReverseShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddReverseShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddReverseShiftFactoringIsomorphismWithGivenObjects", [ IsCapCategory, IsList ] );


DeclareOperation( "DistributivityIsomorphismOfReverseShift", [ IsCapCategoryObject, IsCapCategoryObject ] );
DeclareOperation( "DistributivityIsomorphismOfReverseShift", [ IsList ] );

DeclareOperation( "AddDistributivityIsomorphismOfReverseShift", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddDistributivityIsomorphismOfReverseShift", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddDistributivityIsomorphismOfReverseShift", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddDistributivityIsomorphismOfReverseShift", [ IsCapCategory, IsList ] );

DeclareOperation( "DistributivityIsomorphismOfShift", [ IsCapCategoryObject, IsCapCategoryObject ] );
DeclareOperation( "DistributivityIsomorphismOfShift", [ IsList ] );

DeclareOperation( "AddDistributivityIsomorphismOfShift", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddDistributivityIsomorphismOfShift", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddDistributivityIsomorphismOfShift", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddDistributivityIsomorphismOfShift", [ IsCapCategory, IsList ] );


DeclareAttribute( "ConeObject", IsCapCategoryMorphism );

DeclareOperation( "AddConeObject", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddConeObject", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddConeObject", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddConeObject", [ IsCapCategory, IsList ] );


DeclareOperation( "IsomorphismIntoShiftOfReverseShift", [ IsCapCategoryObject ] );

DeclareOperation( "AddIsomorphismIntoShiftOfReverseShift", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddIsomorphismIntoShiftOfReverseShift", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddIsomorphismIntoShiftOfReverseShift", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddIsomorphismIntoShiftOfReverseShift", [ IsCapCategory, IsList ] );


DeclareOperation( "IsomorphismIntoReverseShiftOfShift", [ IsCapCategoryObject ] );

DeclareOperation( "AddIsomorphismIntoReverseShiftOfShift", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddIsomorphismIntoReverseShiftOfShift", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddIsomorphismIntoReverseShiftOfShift", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddIsomorphismIntoReverseShiftOfShift", [ IsCapCategory, IsList ] );


DeclareOperation( "IsomorphismFromShiftOfReverseShift", [ IsCapCategoryObject ] );

DeclareOperation( "AddIsomorphismFromShiftOfReverseShift", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddIsomorphismFromShiftOfReverseShift", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddIsomorphismFromShiftOfReverseShift", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddIsomorphismFromShiftOfReverseShift", [ IsCapCategory, IsList ] );

DeclareOperation( "IsomorphismFromReverseShiftOfShift", [ IsCapCategoryObject ] );

DeclareOperation( "AddIsomorphismFromReverseShiftOfShift", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddIsomorphismFromReverseShiftOfShift", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddIsomorphismFromReverseShiftOfShift", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddIsomorphismFromReverseShiftOfShift", [ IsCapCategory, IsList ] );


DeclareProperty( "IsCanonicalExactTriangle", IsCapCategoryTriangle );

DeclareOperation( "AddIsCanonicalExactTriangle", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddIsCanonicalExactTriangle", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddIsCanonicalExactTriangle", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddIsCanonicalExactTriangle", [ IsCapCategory, IsList ] );


DeclareProperty( "IsExactTriangle", IsCapCategoryTriangle );

DeclareOperation( "AddIsExactTriangle", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddIsExactTriangle", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddIsExactTriangle", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddIsExactTriangle", [ IsCapCategory, IsList ] );

DeclareAttribute( "UnderlyingCanonicalExactTriangle", IsCapCategoryExactTriangle );

DeclareAttribute( "IsomorphismIntoCanonicalExactTriangle", IsCapCategoryExactTriangle );

DeclareOperation( "AddIsomorphismIntoCanonicalExactTriangle", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddIsomorphismIntoCanonicalExactTriangle", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddIsomorphismIntoCanonicalExactTriangle", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddIsomorphismIntoCanonicalExactTriangle", [ IsCapCategory, IsList ] );

DeclareAttribute( "IsomorphismFromCanonicalExactTriangle", IsCapCategoryExactTriangle );

DeclareOperation( "AddIsomorphismFromCanonicalExactTriangle", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddIsomorphismFromCanonicalExactTriangle", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddIsomorphismFromCanonicalExactTriangle", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddIsomorphismFromCanonicalExactTriangle", [ IsCapCategory, IsList ] );


DeclareAttribute( "RotationOfCanonicalExactTriangle", IsCapCategoryCanonicalExactTriangle );

DeclareOperation( "AddRotationOfCanonicalExactTriangle", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddRotationOfCanonicalExactTriangle", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddRotationOfCanonicalExactTriangle", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddRotationOfCanonicalExactTriangle", [ IsCapCategory, IsList ] );

DeclareAttribute( "ReverseRotationOfCanonicalExactTriangle", IsCapCategoryCanonicalExactTriangle );

DeclareOperation( "AddReverseRotationOfCanonicalExactTriangle", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddReverseRotationOfCanonicalExactTriangle", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddReverseRotationOfCanonicalExactTriangle", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddReverseRotationOfCanonicalExactTriangle", [ IsCapCategory, IsList ] );

DeclareAttribute( "RotationOfExactTriangle", IsCapCategoryExactTriangle );

DeclareOperation( "AddRotationOfExactTriangle", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddRotationOfExactTriangle", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddRotationOfExactTriangle", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddRotationOfExactTriangle", [ IsCapCategory, IsList ] );

DeclareAttribute( "ReverseRotationOfExactTriangle", IsCapCategoryExactTriangle );

DeclareOperation( "AddReverseRotationOfExactTriangle", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddReverseRotationOfExactTriangle", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddReverseRotationOfExactTriangle", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddReverseRotationOfExactTriangle", [ IsCapCategory, IsList ] );

DeclareOperation( "CompleteMorphismToCanonicalExactTriangle", [ IsCapCategoryMorphism ] );

DeclareOperation( "AddCompleteMorphismToCanonicalExactTriangle", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddCompleteMorphismToCanonicalExactTriangle", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddCompleteMorphismToCanonicalExactTriangle", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddCompleteMorphismToCanonicalExactTriangle", [ IsCapCategory, IsList ] );

DeclareOperation( "CompleteToMorphismOfCanonicalExactTriangles",
             [ IsCapCategoryCanonicalExactTriangle, IsCapCategoryCanonicalExactTriangle, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

DeclareOperation( "AddCompleteToMorphismOfCanonicalExactTriangles", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddCompleteToMorphismOfCanonicalExactTriangles", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddCompleteToMorphismOfCanonicalExactTriangles", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddCompleteToMorphismOfCanonicalExactTriangles", [ IsCapCategory, IsList ] );

DeclareOperation( "CompleteToMorphismOfExactTriangles",
             [ IsCapCategoryExactTriangle, IsCapCategoryExactTriangle, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

DeclareOperation( "AddCompleteToMorphismOfExactTriangles", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddCompleteToMorphismOfExactTriangles", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddCompleteToMorphismOfExactTriangles", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddCompleteToMorphismOfExactTriangles", [ IsCapCategory, IsList ] );

DeclareOperation( "CompleteToMorphismOfCanonicalExactTriangles", 
             [ IsCapCategoryCanonicalExactTriangle, IsCapCategoryCanonicalExactTriangle, IsCapCategoryMorphism, IsCapCategoryMorphism, IsList ] );


DeclareOperation( "OctahedralAxiom", [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );

DeclareOperation( "AddOctahedralAxiom", [ IsCapCategory, IsFunction, IsInt ] );
DeclareOperation( "AddOctahedralAxiom", [ IsCapCategory, IsFunction ] );
DeclareOperation( "AddOctahedralAxiom", [ IsCapCategory, IsList, IsInt ] );
DeclareOperation( "AddOctahedralAxiom", [ IsCapCategory, IsList ] );

############## to remove ##########
# DeclareAttribute( "Testtt", IsCapCategory );
# 
# DeclareOperation( "AddTesttt", [ IsCapCategory, IsFunction, IsInt ] );
# DeclareOperation( "AddTesttt", [ IsCapCategory, IsFunction ] );
# DeclareOperation( "AddTesttt", [ IsCapCategory, IsList, IsInt ] );
# DeclareOperation( "AddTesttt", [ IsCapCategory, IsList ] );
############## to remove ##########

###################################
##
## construction operations
##
##################################

DeclareOperation( "CreateTriangle", [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] ); 

DeclareOperation( "CreateExactTriangle", [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ]); 

DeclareOperation( "CreateCanonicalExactTriangle", [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ]); 

DeclareOperation( "CreateTrianglesMorphism", 
                    [ IsCapCategoryTriangle, IsCapCategoryTriangle, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] ); 

DeclareAttribute( "TrivialExactTriangle", IsCapCategoryObject );

###############################
##
## Attributes
##
###############################

DeclareAttribute( "ShiftFunctor", IsCapCategory );


DeclareAttribute( "ReverseShiftFunctor", IsCapCategory );

DeclareAttribute( "NaturalIsomorphismFromIdentityIntoReverseShiftOfShift", IsCapCategory );

DeclareAttribute( "NaturalIsomorphismFromIdentityIntoShiftOfReverseShift", IsCapCategory );


DeclareAttribute( "NaturalIsomorphismFromReverseShiftOfShiftIntoIdentity", IsCapCategory );


DeclareAttribute( "NaturalIsomorphismFromShiftOfReverseShiftIntoIdentity", IsCapCategory );

DeclareAttribute( "UnderlyingCapCategory", IsCapCategoryTriangle );

DeclareAttribute( "UnderlyingCapCategory", IsCapCategoryTrianglesMorphism );

DeclareAttribute( "Source", IsCapCategoryTrianglesMorphism );

DeclareAttribute( "Range", IsCapCategoryTrianglesMorphism );

KeyDependentOperation( "MorphismAt", IsCapCategoryTriangle, IsInt, ReturnTrue );

KeyDependentOperation( "MorphismAt", IsCapCategoryTrianglesMorphism, IsInt, ReturnTrue );

KeyDependentOperation( "ObjectAt", IsCapCategoryTriangle, IsInt, ReturnTrue );


DeclareProperty( "IsTriangulatedCategory", IsCapCategory );

# This property is declared only to be set by the user, not to be computed in any way.
DeclareProperty( "IsTriangulatedCategoryWithShiftAutomorphism", IsCapCategory );