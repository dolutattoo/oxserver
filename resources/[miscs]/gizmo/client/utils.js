
function applyAdditionMatrix(entity, mat, rot) {
  SetEntityCoords(
    entity,
    mat[WEEntityMatrixIndex.AX], mat[WEEntityMatrixIndex.AY], mat[WEEntityMatrixIndex.AZ],
    false, false, false, false,
  );

  SetEntityRotation(entity, rot[0], rot[1], rot[2], 2, false);

  SetEntityMatrix(
    entity,
    mat[4], mat[5], mat[6], // right
    mat[0], mat[1], mat[2], // forward
    mat[8], mat[9], mat[10], // up
    mat[12], mat[13], mat[14], // at
  );
}
