#############################################################################
##
##  TriangulatedCategories.gi             TriangulatedCategories package
##
##  Copyright 2018,                       Kamal Saleh, Siegen University, Germany
##
#############################################################################


###############################
##
##  Representations
##
###############################

DeclareRepresentation( "IsCapCategoryTriangleRep",
                        IsCapCategoryTriangle and IsAttributeStoringRep,
                        [ ] );

DeclareRepresentation( "IsCapCategoryExactTriangleRep",

                        IsCapCategoryExactTriangle and IsAttributeStoringRep,
                        [ ] );

DeclareRepresentation( "IsCapCategoryCanonicalExactTriangleRep",
                        IsCapCategoryCanonicalExactTriangle and IsAttributeStoringRep,
                        [ ] );
                        
DeclareRepresentation( "IsCapCategoryTrianglesMorphismRep",

                        IsCapCategoryTrianglesMorphism and IsAttributeStoringRep, 
                        [ ] );

##############################
##
## Family and type 
##
##############################

BindGlobal( "CapCategoryTrianglesFamily",
  NewFamily( "CapCategoryTrianglesFamily", IsObject ) );

BindGlobal( "CapCategoryExactTrianglesFamily",
  NewFamily( "CapCategoryExactTrianglesFamily", IsCapCategoryTriangle ) );

BindGlobal( "CapCategoryCanonicalExactTrianglesFamily",
  NewFamily( "CapCategoryCanonicalExactTrianglesFamily", IsCapCategoryExactTriangle ) );
  
BindGlobal( "CapCategoryTrianglesMorphismsFamily",
  NewFamily( "CapCategoryTrianglesMorphismsFamily", IsObject ) );
  
BindGlobal( "TheTypeCapCategoryTriangle", 
  NewType( CapCategoryTrianglesFamily, 
                      IsCapCategoryTriangleRep ) );
                      
BindGlobal( "TheTypeCapCategoryExactTriangle", 
  NewType( CapCategoryExactTrianglesFamily, 
                      IsCapCategoryExactTriangleRep ) );
                      
BindGlobal( "TheTypeCapCategoryCanonicalExactTriangle", 
  NewType( CapCategoryCanonicalExactTrianglesFamily, 
                      IsCapCategoryCanonicalExactTriangleRep ) );

                      
BindGlobal( "TheTypeCapCategoryTrianglesMorphism", 
  NewType( CapCategoryTrianglesMorphismsFamily, 
                      IsCapCategoryTrianglesMorphismRep ) );
                      
###############################
##
##  Methods record
##
###############################

InstallValue( CAP_INTERNAL_TRIANGULATED_CATEGORIES_BASIC_OPERATIONS, rec( ) );

InstallValue( TRIANGULATED_CATEGORIES_METHOD_NAME_RECORD, rec( 

ConeObject:= rec( 

installation_name := "ConeObject", 
filter_list := [ "morphism" ],
cache_name := "ConeObject",
return_type := "object" ),

ShiftOfObject:= rec( 

installation_name := "ShiftOfObject", 
filter_list := [ "object" ],
cache_name := "ShiftOfObject",
return_type := "object" ),


ShiftOfMorphism:= rec( 

installation_name := "ShiftOfMorphism", 
filter_list := [ "morphism" ],
cache_name := "ShiftOfMorphism",
return_type := "morphism" ),

ReverseShiftOfObject:= rec( 

installation_name := "ReverseShiftOfObject", 
filter_list := [ "object" ],
cache_name := "ReverseShiftOfObject",
return_type := "object" ),


ReverseShiftOfMorphism:= rec( 

installation_name := "ReverseShiftOfMorphism", 
filter_list := [ "morphism" ],
cache_name := "ReverseShiftOfMorphism",
return_type := "morphism" ),

##
ShiftExpandingIsomorphismWithGivenObjects := rec(
  installation_name := "ShiftExpandingIsomorphismWithGivenObjects",
  filter_list := [ "object", IsList, "object" ],
  io_type := [ [ "s", "L", "r" ], [ "s", "r" ] ],
  cache_name := "ShiftExpandingIsomorphismWithGivenObjects",
  return_type := "morphism",
  post_function := function( s, L, r, return_value )
                if not IsEqualForObjects( ShiftOfObject( DirectSum( L ) ), Source( return_value ) ) then
                    Error( "The source of the output is not as it should be" );
                elif not IsEqualForObjects( DirectSum( List( L, ShiftOfObject ) ), Range( return_value ) ) then
                    Error( "The range of the output is not as it should be" );
                fi;
                Assert( 5, IsIsomorphism( return_value ) );
                SetIsIsomorphism( return_value, true );
                end ),

ShiftFactoringIsomorphismWithGivenObjects := rec(
  installation_name := "ShiftFactoringIsomorphismWithGivenObjects",
  filter_list := [ "object", IsList, "object" ],
  io_type := [ [ "s", "L", "r" ], [ "s", "r" ] ],
  cache_name := "ShiftFactoringIsomorphismWithGivenObjects",
  return_type := "morphism",
  post_function := function( s, L, r, return_value )
                if not IsEqualForObjects( ShiftOfObject( DirectSum( L ) ), Range( return_value ) ) then
                    Error( "The range of the output is not as it should be" );
                elif not IsEqualForObjects( DirectSum( List( L, ShiftOfObject ) ), Source( return_value ) ) then
                    Error( "The source of the output is not as it should be" );
                fi;
                Assert( 5, IsIsomorphism( return_value ) );
                SetIsIsomorphism( return_value, true );
                end ),

ReverseShiftExpandingIsomorphismWithGivenObjects := rec(
  installation_name := "ReverseShiftExpandingIsomorphismWithGivenObjects",
  filter_list := [ "object", IsList, "object" ],
  io_type := [ [ "s", "L", "r" ], [ "s", "r" ] ],
  cache_name := "ReverseShiftExpandingIsomorphismWithGivenObjects",
  return_type := "morphism",
  post_function := function( s, L, r, return_value )
                if not IsEqualForObjects( ReverseShiftOfObject( DirectSum( L ) ), Source( return_value ) ) then
                    Error( "The source of the output is not as it should be" );
                elif not IsEqualForObjects( DirectSum( List( L, ReverseShiftOfObject ) ), Range( return_value ) ) then
                    Error( "The range of the output is not as it should be" );
                fi;
                Assert( 5, IsIsomorphism( return_value ) );
                SetIsIsomorphism( return_value, true );
                end ),

ReverseShiftFactoringIsomorphismWithGivenObjects := rec(
  installation_name := "ReverseShiftFactoringIsomorphismWithGivenObjects",
  filter_list := [ "object", IsList, "object" ],
  io_type := [ [ "s", "L", "r" ], [ "s", "r" ] ],
  cache_name := "ReverseShiftFactoringIsomorphismWithGivenObjects",
  return_type := "morphism",
  post_function := function( s, L, r, return_value )
                if not IsEqualForObjects( ReverseShiftOfObject( DirectSum( L ) ), Range( return_value ) ) then
                    Error( "The range of the output is not as it should be" );
                elif not IsEqualForObjects( DirectSum( List( L, ReverseShiftOfObject ) ), Source( return_value ) ) then
                    Error( "The source of the output is not as it should be" );
                fi;
                Assert( 5, IsIsomorphism( return_value ) );
                SetIsIsomorphism( return_value, true );
                end ),

##
DistributivityIsomorphismOfShift := rec(

installation_name := "DistributivityIsomorphismOfShift", 
filter_list := [ "object", "object" ],
cache_name := "DistributivityIsomorphismOfShift",
return_type := "morphism",
post_function := function( obj1, obj2, return_value )
                if not IsEqualForObjects( DirectSum( ShiftOfObject(obj1), ShiftOfObject( obj2 ) ), Source( return_value ) ) then
                    Error( "The source of the output is not as it should be" );
                elif not IsEqualForObjects( ShiftOfObject( DirectSum( obj1, obj2 ) ), Range( return_value ) ) then
                    Error( "The range of the output is not as it should be" );
                fi;
                Assert( 5, IsIsomorphism( return_value ) );
                SetIsIsomorphism( return_value, true );
                end ),    

DistributivityIsomorphismOfReverseShift := rec(

installation_name := "DistributivityIsomorphismOfReverseShift", 
filter_list := [ "object", "object" ],
cache_name := "DistributivityIsomorphismOfReverseShift",
return_type := "morphism",
post_function := function( obj1, obj2, return_value )
                if not IsEqualForObjects( DirectSum( ReverseShiftOfObject(obj1), ReverseShiftOfObject( obj2 ) ), Source( return_value ) ) then
                    Error( "The source of the output is not as it should be" );
                elif not IsEqualForObjects( ReverseShiftOfObject( DirectSum( obj1, obj2 ) ), Range( return_value ) ) then
                    Error( "The range of the output is not as it should be" );
                fi;
                Assert( 5, IsIsomorphism( return_value ) );
                SetIsIsomorphism( return_value, true );
                end ),    

IsomorphismIntoShiftOfReverseShift := rec( 

installation_name := "IsomorphismIntoShiftOfReverseShift",
filter_list := [ "object" ],
cache_name := "IsomorphismIntoShiftOfReverseShift",
return_type := "morphism",
post_function := 
    function( obj, return_value )
    if not IsEqualForObjects( Source( return_value), obj ) then
        Error( "The output of your methods is not compatible" );
    fi;
    
    if not IsEqualForObjects( Range( return_value ), ShiftOfObject( ReverseShiftOfObject( obj ) ) ) then
        Error( "The output of your method is not compatible" );
    fi;
    
    if not IsIsomorphism( return_value ) then
        Error( "The output must be isomorphism");
    fi;

    Assert( 5, IsIsomorphism( return_value ) );
    SetIsIsomorphism( return_value, true );
    end ),

IsomorphismIntoReverseShiftOfShift := rec( 

installation_name := "IsomorphismIntoReverseShiftOfShift",
filter_list := [ "object" ],
cache_name := "IsomorphismIntoReverseShiftOfShift",
return_type := "morphism",
post_function := 
    function( obj, return_value )
    if not IsEqualForObjects( Source( return_value), obj ) then
        Error( "The output of your methods is not compatible" );
    fi;
    
    if not IsEqualForObjects( Range( return_value ), ReverseShiftOfObject( ShiftOfObject( obj ) ) ) then
        Error( "The output of your method is not compatible" );
    fi;
    
    if not IsIsomorphism( return_value ) then
        Error( "The output must be isomorphism");
    fi;

    Assert( 5, IsIsomorphism( return_value ) );
    SetIsIsomorphism( return_value, true );
    end ),

IsomorphismFromShiftOfReverseShift := rec( 

installation_name := "IsomorphismFromShiftOfReverseShift",
filter_list := [ "object" ],
cache_name := "IsomorphismFromShiftOfReverseShift",
return_type := "morphism",
post_function := 
    function( obj, return_value )
        Assert( 5, IsIsomorphism( return_value ) );
        SetIsIsomorphism( return_value, true );
    end ),

IsomorphismFromReverseShiftOfShift := rec( 

installation_name := "IsomorphismFromReverseShiftOfShift",
filter_list := [ "object" ],
cache_name := "IsomorphismFromReverseShiftOfShift",
return_type := "morphism",
post_function := 
    function( obj, return_value )
    Assert( 5, IsIsomorphism( return_value ) );
    SetIsIsomorphism( return_value, true );
    end ),

IsExactTriangle:= rec( 

installation_name := "IsExactTriangle", 
filter_list := [ IsCapCategoryTriangle ],
cache_name := "IsExactTriangle",
return_type := "bool",
post_function := 
    function( obj, return_value )
    if return_value = true then
        SetFilterObj( obj, IsCapCategoryExactTriangle );
    fi;
    end
),

IsCanonicalExactTriangle:= rec( 

installation_name := "IsCanonicalExactTriangle", 
filter_list := [ IsCapCategoryTriangle ],
cache_name := "IsCanonicalExactTriangle",
return_type := "bool",
post_function := 
    function( obj, return_value )
    if return_value = true then
        SetFilterObj( obj, IsCapCategoryCanonicalExactTriangle );
    fi;
    end
),

IsomorphismFromCanonicalExactTriangle := rec(

installation_name := "IsomorphismFromCanonicalExactTriangle",
filter_list := [ IsCapCategoryExactTriangle ],
cache_name := "IsomorphismFromCanonicalExactTriangle",
return_type := [ IsCapCategoryTrianglesMorphism ] ),

IsomorphismIntoCanonicalExactTriangle := rec(

installation_name := "IsomorphismIntoCanonicalExactTriangle",
filter_list := [ IsCapCategoryExactTriangle ],
cache_name := "IsomorphismIntoCanonicalExactTriangle",
return_type := [ IsCapCategoryTrianglesMorphism ] ),

RotationOfCanonicalExactTriangle := rec( 
installation_name := "RotationOfCanonicalExactTriangle",
filter_list := [ IsCapCategoryCanonicalExactTriangle ],
cache_name := "RotationOfCanonicalExactTriangle",
return_type := [ IsCapCategoryExactTriangle ] ),

ReverseRotationOfCanonicalExactTriangle := rec( 
installation_name := "ReverseRotationOfCanonicalExactTriangle",
filter_list := [ IsCapCategoryCanonicalExactTriangle ],
cache_name := "ReverseRotationOfCanonicalExactTriangle",
return_type := [ IsCapCategoryExactTriangle ] ),

CompleteMorphismToCanonicalExactTriangle := rec(

installation_name := "CompleteMorphismToCanonicalExactTriangle", 
filter_list := [ "morphism" ],
cache_name := "CompleteMorphismToCanonicalExactTriangle",
return_type := [ IsCapCategoryCanonicalExactTriangle ] ),

CompleteToMorphismOfCanonicalExactTriangles:= rec(

installation_name := "CompleteToMorphismOfCanonicalExactTriangles", 
filter_list := [ IsCapCategoryCanonicalExactTriangle, IsCapCategoryCanonicalExactTriangle, "morphism", "morphism" ],
cache_name := "CompleteToMorphismOfCanonicalExactTriangles",
pre_function := function(tr1, tr2, phi, psi )
                if not IsCongruentForMorphisms( PreCompose( tr1^0, psi ), PreCompose(phi, tr2^0 ) ) then
                    return [ false, "The given squar in the input does not commute!" ];
                else
                    return [ true ];
                fi;
                end,
return_type := [ IsCapCategoryTrianglesMorphism ] ),

OctahedralAxiom:= rec(

installation_name := "OctahedralAxiom", 
filter_list := [ "morphism", "morphism" ],
cache_name := "OctahedralAxiom",
return_type := [ IsCapCategoryExactTriangle ] ),

RotationOfExactTriangle := rec( 
installation_name := "RotationOfExactTriangle",
filter_list := [ IsCapCategoryExactTriangle ],
cache_name := "RotationOfExactTriangle",
return_type := [ IsCapCategoryExactTriangle ] ),

ReverseRotationOfExactTriangle := rec( 
installation_name := "ReverseRotationOfExactTriangle",
filter_list := [ IsCapCategoryExactTriangle ],
cache_name := "ReverseRotationOfExactTriangle",
return_type := [ IsCapCategoryExactTriangle ] ),

CompleteToMorphismOfExactTriangles:= rec(

installation_name := "CompleteToMorphismOfExactTriangles", 
filter_list := [ IsCapCategoryExactTriangle, IsCapCategoryExactTriangle, "morphism", "morphism" ],
cache_name := "CompleteToMorphismOfExactTriangles",
return_type := [ IsCapCategoryTrianglesMorphism ] ),

# Testtt:= rec(
# 
# installation_name := "Testtt", 
# filter_list := [ "category" ],
# cache_name := "Testtt",
# return_type := "bool" ),

) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( TRIANGULATED_CATEGORIES_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( TRIANGULATED_CATEGORIES_METHOD_NAME_RECORD );

##
InstallMethod( ConeObject,
                [ IsCapCategoryMorphism ],
                -1000,
   function( mor )
   
   return ObjectAt( CompleteMorphismToCanonicalExactTriangle( mor ), 2 );
   
end );

##
# InstallMethod( Testtt,
#                 [ IsCapCategory and IsTriangulatedCategory ],
#                 -1000, 
#                 # or any method-value \leq -1
#    function( cat )
#    Print( "I am the default method\n" );
#    return true;
#    
# end );

##
InstallMethod( TrivialExactTriangle,
                [ IsCapCategoryObject ],
    function( obj )
    local T, i, j, can_triangle;
   
    T := CreateExactTriangle( IdentityMorphism( obj ), UniversalMorphismIntoZeroObject( obj ), UniversalMorphismFromZeroObject( ShiftOfObject( obj ) ) );
    can_triangle := CompleteMorphismToCanonicalExactTriangle( IdentityMorphism( obj ) );
    
    i := CreateTrianglesMorphism( T, can_triangle, IdentityMorphism( ObjectAt( T, 0 ) ), IdentityMorphism( ObjectAt( T, 1 ) ),
                                                    UniversalMorphismFromZeroObject( ObjectAt( can_triangle, 2 ) ) );
    j := CreateTrianglesMorphism( can_triangle, T, IdentityMorphism( ObjectAt( T, 0 ) ), IdentityMorphism( ObjectAt( T, 1 ) ),
                                                    UniversalMorphismIntoZeroObject( ObjectAt( can_triangle, 2 ) ) );
    SetIsomorphismFromCanonicalExactTriangle( T, j );
    SetIsomorphismIntoCanonicalExactTriangle( T, i );
    
    return T;
    
end );

##
InstallMethod( UnderlyingCanonicalExactTriangle,
                [ IsCapCategoryExactTriangle ],
    function( T )
   
    if IsCapCategoryCanonicalExactTriangle( T ) then
        return T;
    else
        return CompleteMorphismToCanonicalExactTriangle( MorphismAt( T, 0 ) );
    fi;

end );

##
InstallMethod( RotationOfExactTriangle,
                [ IsCapCategoryExactTriangle ],
                -1000,
    function( T )
    local can_T, T_to_can_T, can_T_to_T, rT, rcan_T, rT_to_rcan_T, rcan_T_to_rT, can_rcan_T,
          rcan_T_to_can_rcan_T, can_rcan_T_to_rcan_T, can_rT, can_rcan_T_to_can_rT, can_rT_to_can_rcan_T;
    
    if IsCapCategoryCanonicalExactTriangle( T ) then
        return RotationOfCanonicalExactTriangle( T );
    fi;
    
can_T := UnderlyingCanonicalExactTriangle( T );
T_to_can_T := IsomorphismIntoCanonicalExactTriangle( T );
can_T_to_T := IsomorphismFromCanonicalExactTriangle( T );

rT := CreateExactTriangle( MorphismAt( T, 1 ), MorphismAt( T, 2 ), AdditiveInverse( ShiftOfMorphism( MorphismAt( T, 0 ) ) ) );
rcan_T := RotationOfCanonicalExactTriangle( can_T );

rT_to_rcan_T := CreateTrianglesMorphism( rT, rcan_T, MorphismAt( T_to_can_T, 1 ), MorphismAt( T_to_can_T, 2 ), MorphismAt( T_to_can_T, 3 ) );
rcan_T_to_rT := CreateTrianglesMorphism( rcan_T, rT, MorphismAt( can_T_to_T, 1 ), MorphismAt( can_T_to_T, 2 ), MorphismAt( can_T_to_T, 3 ) );

can_rcan_T := UnderlyingCanonicalExactTriangle( rcan_T );
rcan_T_to_can_rcan_T := IsomorphismIntoCanonicalExactTriangle( rcan_T );
can_rcan_T_to_rcan_T := IsomorphismFromCanonicalExactTriangle( rcan_T );

can_rT := UnderlyingCanonicalExactTriangle( rT );

can_rcan_T_to_can_rT := CompleteToMorphismOfCanonicalExactTriangles( can_rcan_T, can_rT, MorphismAt( can_T_to_T, 1 ), MorphismAt( can_T_to_T, 2 ) );
can_rcan_T_to_can_rT := CreateTrianglesMorphism( can_rcan_T, can_rT, MorphismAt( can_T_to_T, 1 ), MorphismAt( can_T_to_T, 2 ), can_rcan_T_to_can_rT );
can_rT_to_can_rcan_T := CompleteToMorphismOfCanonicalExactTriangles( can_rT, can_rcan_T, MorphismAt( T_to_can_T, 1 ), MorphismAt( T_to_can_T, 2 ) );
can_rT_to_can_rcan_T := CreateTrianglesMorphism( can_rT, can_rcan_T, MorphismAt( T_to_can_T, 1 ), MorphismAt( T_to_can_T, 2 ), can_rT_to_can_rcan_T );

    
    SetIsomorphismIntoCanonicalExactTriangle(   rT, PreCompose( [ rT_to_rcan_T, rcan_T_to_can_rcan_T, can_rcan_T_to_can_rT ] ) );
    SetIsomorphismFromCanonicalExactTriangle( rT, PreCompose( [ can_rT_to_can_rcan_T, can_rcan_T_to_rcan_T, rcan_T_to_rT ] ) );
    
    return rT;
    
end );


#\begin{tikzcd}
#A \arrow[r, "f"] & B \arrow[r, "g"] & C \arrow[r, "h"] \arrow[d, "u", two heads, tail] & A[1] &  &  &  & C[-1] \arrow[r, "{-h[-1]}"] \arrow[d, "{u[-1]}"'] & A \arrow[r, "f"] & B \arrow[r, "g"] & C \arrow[d, "u"] \\
#A \arrow[r, "f"'] & B \arrow[r, "\alpha(f)"'] & C(f) \arrow[r, "\beta(f)"'] & A[1] &  &  &  & C(f)[-1] \arrow[r, "{-\beta(f)[-1]}"'] & A \arrow[r, "f"'] & B \arrow[r, "\alpha(f)"'] \arrow[d, "t"] & C(f) \\
# &  &  &  &  &  &  & C(f)[-1] \arrow[r, "{-\beta(f)[-1]}"] \arrow[d, "{u[-1]^{-1}}"'] & A \arrow[r, "\alpha(*)"] & C(\beta(f)[-1]) \arrow[r, "\beta(*)"] \arrow[d, "s"] & C(f) \arrow[d, "u^{-1}"] \\
# &  &  &  &  &  &  & C[-1] \arrow[r, "{-h[-1]}"'] & A \arrow[r, "{\alpha(-h[-1])}"'] & C(h[-1]) \arrow[r, "{\beta(-h[-1])}"'] & C
#\end{tikzcd}

InstallMethod( ReverseRotationOfExactTriangle,
                [ IsCapCategoryExactTriangle ],
                -1000,
    function( T )
    local can_T, T_to_can_T, can_T_to_T, rT, rcan_T, rT_to_rcan_T, rcan_T_to_rT, can_rcan_T,
       rcan_T_to_can_rcan_T, can_rcan_T_to_rcan_T, can_rT, can_rcan_T_to_can_rT, can_rT_to_can_rcan_T;
    
    if not HasIsTriangulatedCategoryWithShiftAutomorphism( UnderlyingCapCategory( T ) ) then
        Error( "Its not known wether the shift functor is automorphism!" );
    fi;
     
    if not IsTriangulatedCategoryWithShiftAutomorphism( UnderlyingCapCategory( T ) ) then
        Error( "The shift-functor that defines the triangulated struture must be automorphism!" );
    fi;

    if IsCapCategoryCanonicalExactTriangle( T ) then
        return ReverseRotationOfCanonicalExactTriangle( T );
    fi;
     
    can_T := UnderlyingCanonicalExactTriangle( T );
    T_to_can_T := IsomorphismIntoCanonicalExactTriangle( T );
    can_T_to_T := IsomorphismFromCanonicalExactTriangle( T );
     
    rT := CreateExactTriangle( AdditiveInverse(ReverseShiftOfMorphism( MorphismAt( T, 2 ) ) ), MorphismAt( T, 0), MorphismAt( T, 1 ) );
    rcan_T := ReverseRotationOfCanonicalExactTriangle( can_T );
     
    rT_to_rcan_T := CreateTrianglesMorphism( rT, rcan_T, ReverseShiftOfMorphism( MorphismAt( T_to_can_T, 2 ) ), 
                                                        MorphismAt( T_to_can_T, 0 ), 
                                                        MorphismAt( T_to_can_T, 1 ) );
                                                          
    rcan_T_to_rT := CreateTrianglesMorphism( rcan_T, rT, ReverseShiftOfMorphism( MorphismAt( can_T_to_T, 2 ) ), 
                                                        MorphismAt( can_T_to_T, 0 ), 
                                                        MorphismAt( can_T_to_T, 1 ) );
                                                          
     
    can_rcan_T := UnderlyingCanonicalExactTriangle( rcan_T );
    rcan_T_to_can_rcan_T := IsomorphismIntoCanonicalExactTriangle( rcan_T );
    can_rcan_T_to_rcan_T := IsomorphismFromCanonicalExactTriangle( rcan_T );
     
    can_rT := UnderlyingCanonicalExactTriangle( rT );
     
    can_rcan_T_to_can_rT := CompleteToMorphismOfCanonicalExactTriangles( can_rcan_T, can_rT, 
                                ReverseShiftOfMorphism( MorphismAt( can_T_to_T, 2 ) ), MorphismAt( can_T_to_T, 0 ) );
    can_rcan_T_to_can_rT := CreateTrianglesMorphism( can_rcan_T, can_rT, 
                                ReverseShiftOfMorphism( MorphismAt( can_T_to_T, 2 ) ), MorphismAt( can_T_to_T, 0 ), can_rcan_T_to_can_rT );

    can_rT_to_can_rcan_T := CompleteToMorphismOfCanonicalExactTriangles( can_rT, can_rcan_T, 
                                ReverseShiftOfMorphism( MorphismAt( T_to_can_T, 2 ) ), MorphismAt( T_to_can_T, 0 ) );
    can_rT_to_can_rcan_T := CreateTrianglesMorphism( can_rT, can_rcan_T, 
                                ReverseShiftOfMorphism( MorphismAt( T_to_can_T, 2 ) ), MorphismAt( T_to_can_T, 0 ), can_rT_to_can_rcan_T );
    
    SetIsomorphismIntoCanonicalExactTriangle(   rT, PreCompose( [ rT_to_rcan_T, rcan_T_to_can_rcan_T, can_rcan_T_to_can_rT ] ) );
    SetIsomorphismFromCanonicalExactTriangle( rT, PreCompose( [ can_rT_to_can_rcan_T, can_rcan_T_to_rcan_T, rcan_T_to_rT ] ) );
     
    return rT;
     
end );

InstallMethod( CompleteToMorphismOfExactTriangles,
                [ IsCapCategoryExactTriangle, IsCapCategoryExactTriangle, IsCapCategoryMorphism, IsCapCategoryMorphism ],
                -1000,
    function( T1, T2, m0, m1 )
    local can_T1, can_T2, T1_to_can_T1, T2_to_can_T2, can_T1_to_T1, can_T2_to_T2, can_T1_to_can_T2,
        can_T1_to_can_T2_0, can_T1_to_can_T2_1;
    
    if IsCapCategoryCanonicalExactTriangle( T1 ) and IsCapCategoryCanonicalExactTriangle( T2 ) then
        return CompleteToMorphismOfCanonicalExactTriangles( T1, T2, m0, m1 );
    fi;

    can_T1 := UnderlyingCanonicalExactTriangle( T1 );
    can_T2 := UnderlyingCanonicalExactTriangle( T2 );
    
    T1_to_can_T1 := IsomorphismIntoCanonicalExactTriangle( T1 );
    can_T1_to_T1 := IsomorphismFromCanonicalExactTriangle( T1 );

    T2_to_can_T2 := IsomorphismIntoCanonicalExactTriangle( T2 );
    can_T2_to_T2 := IsomorphismFromCanonicalExactTriangle( T2 );

    can_T1_to_can_T2_0 := PreCompose( [ MorphismAt( can_T1_to_T1, 0 ), m0, MorphismAt( T2_to_can_T2, 0 ) ] );
    can_T1_to_can_T2_1 := PreCompose( [ MorphismAt( can_T1_to_T1, 1 ), m1, MorphismAt( T2_to_can_T2, 1 ) ] );
    can_T1_to_can_T2 := CompleteToMorphismOfCanonicalExactTriangles( can_T1, can_T2, can_T1_to_can_T2_0, can_T1_to_can_T2_1 );
    return PreCompose( [ T1_to_can_T1, can_T1_to_can_T2, can_T2_to_T2 ] );
    
end );

##
InstallMethod( ShiftExpandingIsomorphism, 
                [ IsList ],
    function( L )
    return ShiftExpandingIsomorphismWithGivenObjects( ShiftOfObject( DirectSum( L ) ), L, DirectSum( List( L, ShiftOfObject ) ) );
end );

##
InstallMethod( ReverseShiftExpandingIsomorphism, 
                [ IsList ],
    function( L )
    return ReverseShiftExpandingIsomorphismWithGivenObjects( ReverseShiftOfObject( DirectSum( L ) ), L, DirectSum( List( L, ReverseShiftOfObject ) ) );
end );

##
InstallMethod( ShiftFactoringIsomorphism, 
                [ IsList ],
    function( L )
    return ShiftFactoringIsomorphismWithGivenObjects( DirectSum( List( L, ShiftOfObject ) ), L, ShiftOfObject( DirectSum( L ) ) );
end );

##
InstallMethod( ReverseShiftFactoringIsomorphism, 
                [ IsList ],
    function( L )
    return ReverseShiftFactoringIsomorphismWithGivenObjects( DirectSum( List( L, ReverseShiftOfObject ) ), L, ReverseShiftOfObject( DirectSum( L ) ) );
end );

##
InstallMethod( ShiftFunctor,
                  [ IsCapCategory and IsTriangulatedCategory ],
                  
    function( category )
    local name, functor;
     
    name := Concatenation( "Shift endofunctor in ", Name( category ) );
     
    functor := CapFunctor( name, category, category );
     
    if not CanCompute( category, "ShiftOfObject" ) or not CanCompute( category, "ShiftOfMorphism" ) then
        
        Error( "ShiftOfObject and ShiftOfMorphism should be added to the category" );
        
    fi;
    
    AddObjectFunction( functor, 
            
           function( obj )
                
                return ShiftOfObject( obj );
                
           end );
           
    AddMorphismFunction( functor, 
     
           function( new_source, mor, new_range )
                
                return ShiftOfMorphism( mor );
                
           end );
           
     return functor;
  
end );
     
 
InstallMethod( ReverseShiftFunctor,
                  [ IsCapCategory and IsTriangulatedCategory ],
                  
     function( category )
     local name, functor;
     
     name := Concatenation( "Reverse Shift endofunctor in ", Name( category ) );
     
     functor := CapFunctor( name, category, category );
     
     if not CanCompute( category, "ReverseShiftOfObject" ) or not CanCompute( category, "ReverseShiftOfMorphism" ) then
     
        Error( "ReverseShiftOfObject and ReverseShiftOfMorphism should be added to the category" );
        
     fi;
     
     AddObjectFunction( functor, 
     
           function( obj )
           
           return ReverseShiftOfObject( obj );
           
           end );
           
     AddMorphismFunction( functor, 
     
           function( new_source, mor, new_range )
           
           return ReverseShiftOfMorphism( mor );
           
           end );
           
     return functor;
  
end );

##
InstallMethod( NaturalIsomorphismFromIdentityIntoShiftOfReverseShift, 
                      [ IsCapCategory and IsTriangulatedCategory ],
                      
        function( category )
        local id, shift, reverse_shift, shift_after_reverse_shift, name, nat;
        
        id := IdentityFunctor( category );
        
        shift := ShiftFunctor( category );
        
        reverse_shift := ReverseShiftFunctor( category );
        
        shift_after_reverse_shift := PreCompose( reverse_shift, shift );
        
        name := "Autoequivalence from identity functor to Σ o Σ^-1 in ";
        
        name := Concatenation( name, Name( category ) );
        
        nat := NaturalTransformation( name, id, shift_after_reverse_shift );
        
        AddNaturalTransformationFunction( nat, 
         
           function( Id_of_object, object, shift_after_reverse_shift_of_object )
              
              return IsomorphismIntoShiftOfReverseShift( object );
              
           end );
         
        return nat;
        
end );
 
##
InstallMethod( NaturalIsomorphismFromIdentityIntoReverseShiftOfShift, 
                      [ IsCapCategory and IsTriangulatedCategory ],
                      
        function( category )
        local id, shift, reverse_shift, reverse_shift_after_shift, name, nat;
        
        id := IdentityFunctor( category );
        
        shift := ShiftFunctor( category );
        
        reverse_shift := ReverseShiftFunctor( category );
        
        reverse_shift_after_shift := PreCompose( shift, reverse_shift);
        
        name := "Autoequivalence from identity functor to Σ^-1 o Σ in  ";
        
        name := Concatenation( name, Name( category ) );
        
        nat := NaturalTransformation( name, id, reverse_shift_after_shift );
        
        AddNaturalTransformationFunction( nat, 
         
           function( Id_of_object, object, reverse_shift_after_shift_of_object )
              
              return IsomorphismIntoReverseShiftOfShift( object );
              
           end );
         
        return nat;
        
end );

##
InstallMethod( NaturalIsomorphismFromShiftOfReverseShiftIntoIdentity, 
                      [ IsCapCategory and IsTriangulatedCategory ],
                      
        function( category )
        local id, shift, reverse_shift, shift_after_reverse_shift, name, nat;
        
        id := IdentityFunctor( category );
        
        shift := ShiftFunctor( category );
        
        reverse_shift := ReverseShiftFunctor( category );
        
        shift_after_reverse_shift := PreCompose( reverse_shift, shift );
        
        name := "Autoequivalence from Σ o Σ^-1 to identity functor in ";
        
        name := Concatenation( name, Name( category ) );
        
        nat := NaturalTransformation( name, id, shift_after_reverse_shift );
        
        AddNaturalTransformationFunction( nat, 
         
           function( Id_of_object, object, shift_after_reverse_shift_of_object )
              
              return IsomorphismFromShiftOfReverseShift( object );
              
           end );
         
        return nat;
        
end );
 
##
InstallMethod( NaturalIsomorphismFromReverseShiftOfShiftIntoIdentity, 
                      [ IsCapCategory and IsTriangulatedCategory ],
                      
        function( category )
        local id, shift, reverse_shift, reverse_shift_after_shift, name, nat;
        
        id := IdentityFunctor( category );
        
        shift := ShiftFunctor( category );
        
        reverse_shift := ReverseShiftFunctor( category );
        
        reverse_shift_after_shift := PreCompose( shift, reverse_shift);
        
        name := "Autoequivalence from Σ^-1 o Σ to identity functor in ";
        
        name := Concatenation( name, Name( category ) );
        
        nat := NaturalTransformation( name, id, reverse_shift_after_shift );
        
        AddNaturalTransformationFunction( nat, 
         
           function( Id_of_object, object, reverse_shift_after_shift_of_object )
              
              return IsomorphismFromReverseShiftOfShift( object );
              
           end );
         
        return nat;
        
end );   
