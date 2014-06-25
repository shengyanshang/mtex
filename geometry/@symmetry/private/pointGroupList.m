function l = pointGroupList

l = struct('Schoen',{},'Inter',{},'lattice',{},'properId',{},'LaueId',{},'Inversion',{},'altNames',{});

% Schoen, Inter, latticeType, properId, LaueId, inversion, alternative names
l = addSym(l,'C1' ,'1'    ,1, 1, 2,  1);
l = addSym(l,'Ci' ,'-1'   ,1, 1, 2, [1;-1],'S2');
%------------------------------------------------------------------------
l = addSym(l,'C2' ,'2'    ,2, 3, 5,  1);
l = addSym(l,'Cs' ,'m'    ,2, 3, 5, -1,'C1h');
l = addSym(l,'C2h','2/m'  ,2, 3, 5, [1;-1]);
%------------------------------------------------------------------------
l = addSym(l,'D2' ,'222'  ,3, 6, 8, [ 1 1], '22','V');
l = addSym(l,'C2v','mm2'  ,3, 6, 8, [-1 1], '2mm');
l = addSym(l,'D2h','mmm'  ,3, 6, 8, [[1 1]; [-1 -1]], '2/m2/m2/m','Vh');
%------------------------------------------------------------------------
l = addSym(l,'C3' ,'3'    ,4, 9,10, 1);
l = addSym(l,'C3i','-3'   ,4, 9,10, [1;-1],'S6');

l = addSym(l,'D3' ,'32'   ,4,11,13, [ 1 1]);
l = addSym(l,'C3v','3m'   ,4,11,13, [-1 1]);
l = addSym(l,'D3d','-3m'  ,4,11,13, [[1 1];[-1 -1]],'-32/m');
%-------------------------------------------------------------------------
l = addSym(l,'C4' ,'4'    ,5,14,16, 1);
l = addSym(l,'S4' ,'-4'   ,5,14,16,-1);
l = addSym(l,'C4h','4/m'  ,5,14,16, [1;-1]);

l = addSym(l,'D4' ,'422'  ,5,17,20, [1 1],'42');
l = addSym(l,'C4v','4mm'  ,5,17,20, [-1 1]);
l = addSym(l,'D2d','-42m' ,5,17,20, [1 -1],'Vd');
l = addSym(l,'D4h','4/mmm',5,17,20, [[1 1];[-1 -1]],'4/m2/m2/m');
%---------------------------------------------------------------------------
l = addSym(l,'C6' ,'6'    ,6,21,23, 1);
l = addSym(l,'C3h','-6'   ,6,21,23, -1);
l = addSym(l,'C6h','6/m'  ,6,21,23, [1;-1]);

l = addSym(l,'D6' ,'622'  ,6,24,27, [1 1],'62');
l = addSym(l,'C6v','6mm'  ,6,24,27, [-1 1]);
l = addSym(l,'D3h','-62m' ,6,24,27, [1 -1], '-6m2');
l = addSym(l,'D6h','6/mmm',6,24,27,[[1 1];[-1 -1]],'6/m2/m2/m');
%---------------------------------------------------------------------------
l = addSym(l,'T'  ,'23'   ,7,28,29,[1 1 1]);
l = addSym(l,'Th' ,'m-3'  ,7,28,29,[[1 1 1];[-1 -1 -1]],'m3','2/m-3');

l = addSym(l,'O'  ,'432'  ,7,30,32,[1 1 1],'43');
l = addSym(l,'Td' ,'-43m' ,7,30,32,[1 -1 -1]);
l = addSym(l,'Oh' ,'m-3m' ,7,30,32,[[1 1 1];[-1 -1 -1]],'m3m','4/m-32/m');



function nl = addSym(l,Schoen,Inter,latticeId,properId,LaueId,inv,varargin)

latticeList = {'triclinic','monoclinic','orthorhombic','trigonal','tetragonal','hexagonal','cubic'};

s = struct('Schoen',Schoen,'Inter',Inter,'lattice',latticeList{latticeId},...
  'properId',properId,'LaueId',LaueId,'Inversion',inv,'altNames',{varargin});

nl = [l,s];