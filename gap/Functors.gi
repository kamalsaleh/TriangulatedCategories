

##
InstallMethod( ShiftFunctorAttr,
          [ IsCapCategory and IsTriangulatedCategory ],
  function( category )
    local name, Sigma, G, eta;
    
    name := "Shift endofunctor on a triangulated category";
    
    Sigma := CapFunctor( name, category, category );
    
    if not ( CanCompute( category, "ShiftOnObject" )
              and CanCompute( category, "ShiftOnMorphismWithGivenObjects" ) ) then
              
        Error( "ShiftOnObject and ShiftOnMorphism should be added to the category" );
        
    fi;
    
    AddObjectFunction( Sigma, ShiftOnObject );
    
    AddMorphismFunction( Sigma, ShiftOnMorphismWithGivenObjects );
    
    G := PreCompose( Sigma, Sigma );
    
    eta := NaturalTransformation( "Σ o Σ ==> Σ o Σ", G, G );
    
    AddNaturalTransformationFunction( eta, { s, a, r } -> IdentityMorphism( s ) );
    
    SetCommutativityNaturalIsomorphismForExactFunctor( Sigma, eta );
    
    return Sigma;
    
end );

##
InstallOtherMethod( ShiftFunctor,
          [ IsCapCategory and IsTriangulatedCategory ],
  ShiftFunctorAttr
);

InstallMethod( ReverseShiftFunctor,
          [ IsCapCategory and IsTriangulatedCategory ],  
  function( category )
    local name, rev_Sigma, Sigma, G_1, G_2, eta;
    
    name := "Reverse Shift endofunctor on a triangulated category";
    
    rev_Sigma := CapFunctor( name, category, category );
    
    if not ( CanCompute( category, "ReverseShiftOnObject" )
              and CanCompute( category, "ReverseShiftOnMorphismWithGivenObjects" ) ) then
              
      Error( "ReverseShiftOnObject and ReverseShiftOnMorphism should be added to the category" );
      
    fi;
    
    AddObjectFunction( rev_Sigma, ReverseShiftOnObject );
    
    AddMorphismFunction( rev_Sigma, ReverseShiftOnMorphismWithGivenObjects );
    
    Sigma := ShiftFunctor( category );
    
    G_1 := PreCompose( Sigma, rev_Sigma );
    
    G_2 := PreCompose( rev_Sigma, Sigma );
    
    eta := NaturalTransformation( "Σ^-1 o Σ ==> Σ o Σ^-1", G_1, G_2 );
    
    AddNaturalTransformationFunction( eta,
      { G_1_a, a, G_2_a } ->
          PreCompose(
            IsomorphismFromReverseShiftOfShift( a ),
            IsomorphismIntoShiftOfReverseShift( a )
          )
    );
    
    SetCommutativityNaturalIsomorphismForExactFunctor( rev_Sigma, eta );
    
    return rev_Sigma;
    
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
    
    AddNaturalTransformationFunction( nat, IsomorphismIntoShiftOfReverseShiftWithGivenObject );
    
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
    
    AddNaturalTransformationFunction( nat, IsomorphismIntoReverseShiftOfShiftWithGivenObject );
    
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
    
    AddNaturalTransformationFunction( nat, IsomorphismFromShiftOfReverseShiftWithGivenObject );
    
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
    
    AddNaturalTransformationFunction( nat, IsomorphismFromReverseShiftOfShiftWithGivenObject );
    
    return nat;
    
end );

##
InstallMethod( ExtendFunctorToCategoryOfTriangles,
          [ IsCapFunctor and HasCommutativityNaturalIsomorphismForExactFunctor ],
  function( F )
    local eta, S, R, name, TF;
    
    eta := CommutativityNaturalIsomorphismForExactFunctor( F );
    
    S := AsCapCategory( Source( F ) );
    
    R := AsCapCategory( Range( F ) );
    
    S := CategoryOfExactTriangles( S );
    
    R := CategoryOfExactTriangles( R );
    
    name := "Extension of a functor to categories of exact triangles";
    
    TF := CapFunctor( name, S, R );
    
    AddObjectFunction( TF,
      function( triangle )
        
        return ExactTriangle(
                  ApplyFunctor( F, triangle ^ 0 ),
                  ApplyFunctor( F, triangle ^ 1),
                  PreCompose( ApplyFunctor( F, triangle ^ 2 ), eta( triangle[ 0 ] ) )
                );
                
      end );
      
    AddMorphismFunction( TF,
      function( s, phi, r )
        
        return MorphismOfExactTriangles( 
                  s,
                  ApplyFunctor( F, phi[ 0 ] ),
                  ApplyFunctor( F, phi[ 1 ] ),
                  ApplyFunctor( F, phi[ 2 ] ),
                  r
                );
                
        end );
        
    return TF;
    
end );
