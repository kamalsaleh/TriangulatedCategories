

#################################
##
##  Declarations
##
#################################

DeclareGlobalVariable( "CAP_INTERNAL_TRIANGULATED_CATEGORIES_BASIC_OPERATIONS" );

DeclareGlobalVariable( "TRIANGULATED_CATEGORIES_METHOD_NAME_RECORD" );

DeclareCategory( "IsCapCategoryTriangle", IsObject );

DeclareCategory( "IsCapCategoryExactTriangle", IsCapCategoryTriangle );

DeclareCategory( "IsCapCategoryTrianglesMorphism", IsObject );

#################################
##
##  Saving time for declarations 
##
#################################

if not IsPackageMarkedForLoading( "FrobeniusCategoriesForCAP", ">0.1" ) then

##
 DeclareOperation( "DoDeclarationStuff", [ IsString ] );
 
## 
 InstallMethod( DoDeclarationStuff, 
                [ IsString ], 
 function( name_of_the_function )

 DeclareOperation( Concatenation( "Add", name_of_the_function ),
                   [ IsCapCategory, IsFunction, IsInt ] );
                   
 DeclareOperation( Concatenation( "Add", name_of_the_function ),
                   [ IsCapCategory, IsFunction ] );


 DeclareOperation( Concatenation( "Add", name_of_the_function ),
                   [ IsCapCategory, IsList, IsInt ] );
                   
 DeclareOperation( Concatenation( "Add", name_of_the_function ),
                   [ IsCapCategory, IsList ] );
 end );
 
fi;

####################################
##
##  Methods Declarations in Records
##
####################################

 DeclareOperationWithCache( "ShiftOfObject", [ IsCapCategoryObject ] );
 DoDeclarationStuff( "ShiftOfObject" );

 
 DeclareOperationWithCache( "ShiftOfMorphism", [ IsCapCategoryMorphism ] );
 DoDeclarationStuff( "ShiftOfMorphism" );

 DeclareOperationWithCache( "ReverseShiftOfObject", [ IsCapCategoryObject ] );
 DoDeclarationStuff( "ReverseShiftOfObject" );
 
 DeclareOperationWithCache( "ReverseShiftOfMorphism", [ IsCapCategoryMorphism ] );
 DoDeclarationStuff( "ReverseShiftOfMorphism" );
 
 DeclareOperationWithCache( "IsExactForTriangles", [ IsCapCategoryTriangle ] );
 DoDeclarationStuff( "IsExactForTriangles" );
 
 DeclareOperationWithCache( "TR1", [ IsCapCategoryMorphism ] );
 DoDeclarationStuff( "TR1" );
 
 DeclareOperationWithCache( "CompleteMorphismToExactTriangleByTR1", [ IsCapCategoryMorphism ] );
 DoDeclarationStuff( "CompleteMorphismToExactTriangleByTR1" );
 
 DeclareOperationWithCache( "TR3",
             [ IsCapCategoryExactTriangle, IsCapCategoryExactTriangle, IsCapCategoryMorphism, IsCapCategoryMorphism ] );
 DoDeclarationStuff( "TR3" );
 
 DeclareOperationWithCache( "CompleteToMorphismOfExactTrianglesByTR3",
             [ IsCapCategoryExactTriangle, IsCapCategoryExactTriangle, IsCapCategoryMorphism, IsCapCategoryMorphism, IsList ] );
 DoDeclarationStuff( "CompleteToMorphismOfExactTrianglesByTR3" );
 
 DeclareOperationWithCache( "IsomorphismFromObjectToShiftAfterReverseShiftOfTheObject", [ IsCapCategoryObject ] );
 DoDeclarationStuff( "IsomorphismFromObjectToShiftAfterReverseShiftOfTheObject" );
 
 DeclareOperationWithCache( "IsomorphismFromObjectToReverseShiftAfterShiftOfTheObject", [ IsCapCategoryObject ] );
 DoDeclarationStuff( "IsomorphismFromObjectToReverseShiftAfterShiftOfTheObject" );
 
 DeclareOperationWithCache( "TR4", [ IsCapCategoryMorphism, IsCapCategoryMorphism ] );
 DoDeclarationStuff( "TR4" );
 
 
 ###################################
 ##
 ## General Methods declaration
 ##
 ##################################
 
 DeclareOperationWithCache( "ApplyShift", [ IsCapCategoryObject,   IsInt ] );
 
 DeclareOperationWithCache( "ApplyShift", [ IsCapCategoryMorphism, IsInt ] );
 
 DeclareOperationWithCache( "ApplyCreationTrianglesByTR2", [ IsCapCategoryTriangle, IsInt ] );
 
 DeclareOperationWithCache( "CreateTriangle", 
                    [ IsCapCategoryMorphism,IsCapCategoryMorphism,IsCapCategoryMorphism ]); 
 
 DeclareOperationWithCache( "CreateExactTriangle", 
                    [ IsCapCategoryMorphism,IsCapCategoryMorphism,IsCapCategoryMorphism ]); 
 
 DeclareOperationWithCache( "CreateExactTriangle", 
                    [ IsCapCategoryTriangle ] );
 
 DeclareOperationWithCache( "IsEqualForTriangles", 
                    [ IsCapCategoryTriangle, IsCapCategoryTriangle ] );
   
 DeclareOperationWithCache( "CreateMorphismOfTriangles", 
                    [ IsCapCategoryTriangle, IsCapCategoryTriangle,
                      IsCapCategoryMorphism, IsCapCategoryMorphism, 
                      IsCapCategoryMorphism ] ); 
 
 DeclareOperationWithCache( "PreCompose", 
                            [ IsCapCategoryTrianglesMorphism, IsCapCategoryTrianglesMorphism ] );
 
 DeclareOperationWithCache( "PostCompose", 
                            [ IsCapCategoryTrianglesMorphism, IsCapCategoryTrianglesMorphism ] );
 
 DeclareOperationWithCache( "ConeObject", [ IsCapCategoryMorphism ] );
 
 DeclareOperation( "IsExactTriangleByAxioms", [ IsCapCategoryTriangle ] );
 
 DeclareOperation( "IsExactTriangleByTR2Backward", [ IsCapCategoryTriangle ] );
 
 DeclareOperation( "IsExactTriangleByTR2Forward", [ IsCapCategoryTriangle ] );
 
 DeclareOperation( "Iso_Triangles", [ IsCapCategoryTriangle, IsList ] );
 
 DeclareOperation( "CurrentIsoClassOfTriangle", [ IsCapCategoryTriangle ] );
 
 DeclareOperation( "SetIsIsomorphicTriangles", 
                  [ IsCapCategoryTriangle, IsCapCategoryTriangle ] );
 
 DeclareOperation( "In", [ IsCapCategoryTriangle, IsList ] );
 
 DeclareOperation( "IsIsomorphicTriangles", 
               [ IsCapCategoryTriangle, IsCapCategoryTriangle ] );

 ###############################
 ##
 ## Attributes
 ##
 ###############################
 
 DeclareAttribute( "CapCategory", IsCapCategoryTriangle );
 
 DeclareAttribute( "CapCategory", IsCapCategoryTrianglesMorphism );
 
 DeclareAttribute( "CreateTriangleByTR2Forward", IsCapCategoryTriangle );
 
 DeclareAttribute( "CreateTriangleByTR2Backward", IsCapCategoryTriangle );
 
 DeclareAttribute( "ShiftFunctor", IsCapCategory );
 
 DeclareAttribute( "ReverseShiftFunctor", IsCapCategory );
 
 DeclareAttribute( "AutoequivalenceFromIdentityToReverseShiftAfterShiftFunctor", IsCapCategory );
 
 DeclareAttribute( "AutoequivalenceFromIdentityToShiftAfterReverseShiftFunctor", IsCapCategory );
 
 DeclareAttribute( "Source", IsCapCategoryTrianglesMorphism );
 
 DeclareAttribute( "Range", IsCapCategoryTrianglesMorphism );
 
 ##############################
 ##
 ## Properties
 ##
 ##############################
 
 DeclareProperty( "IsExactTriangle", IsCapCategoryTriangle );
 
 DeclareProperty( "IsIsomorphism", IsCapCategoryTrianglesMorphism );
 
 DeclareProperty( "IsTriangulatedCategory", IsCapCategory );
