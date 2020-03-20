


DeclareAttribute( "CommutativityNaturalIsomorphismForExactFunctor", IsCapFunctor );

DeclareAttribute( "ShiftFunctorAttr", IsTriangulatedCategory );

if not IsBound( ShiftFunctor ) then
  
  DeclareOperation( "ShiftFunctor", [ IsTriangulatedCategory ] );
  
fi;

DeclareAttribute( "ReverseShiftFunctor", IsTriangulatedCategory );

DeclareAttribute( "ExtendFunctorToCategoryOfTriangles", IsCapFunctor );

DeclareAttribute( "NaturalIsomorphismFromIdentityIntoReverseShiftOfShift", IsTriangulatedCategory );

DeclareAttribute( "NaturalIsomorphismFromIdentityIntoShiftOfReverseShift", IsTriangulatedCategory );

DeclareAttribute( "NaturalIsomorphismFromReverseShiftOfShiftIntoIdentity", IsTriangulatedCategory );

DeclareAttribute( "NaturalIsomorphismFromShiftOfReverseShiftIntoIdentity", IsTriangulatedCategory );

