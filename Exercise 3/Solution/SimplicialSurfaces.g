# Exercise 1

# a)
oct1:=SimplicialSurfaceByVerticesInFaces([ [ 1, 2, 3 ], [ 2, 5, 6 ], [ 1, 2, 5 ], [ 2, 3, 6 ], [ 1, 4, 5 ], [ 3, 4, 6 ], [ 1, 3, 4 ], [ 4, 5, 6 ] ]);
oct2:=SimplicialSurfaceByUmbrellaDescriptor([ (1,7,5,3), (1,4,2,3), (1,4,6,7), (5,8,6,7), (2,8,5,3), (2,8,6,4) ]);

IsIsomorphic(oct1,Octahedron());
IsIsomorphic(oct2,Octahedron());


# b)
stellated:=Octahedron();
for f in Faces(Octahedron()) do
    stellated:=TetrahedralExtension(stellated,f);
od;

EulerCharacteristic(stellated);

# c)

CrossProduct:=function(v1,v2)
    return [v1[2]*v2[3]-v1[3]*v2[2],v1[3]*v2[1]-v1[1]*v2[3],v1[1]*v2[2]-v1[2]*v2[1]];
end;

MyNorm:=function(p)
	return Sqrt(p[1]^2+p[2]^2+p[3]^2);
end;;

NormalVector:=function(c1,c2,c3,p)
    local normal;
   normal:=CrossProduct(c1-c2,c1-c3);
   normal:=normal/MyNorm(normal);
   if normal*(p-c1)>0. then
        normal:=-normal;
    fi;
    return normal;
end;

StellatedEmbedding:=function()
    local coord, f, vof, center, p, normal;
    coord := [[ 0, 0, Sqrt(2.) ], [ 1, 1, 0 ], [ 1, -1, 0 ],[ -1, -1, 0 ],[ -1, 1, 0 ],[ 0, 0, -Sqrt(2.) ] ];;
    for f in Faces(Octahedron()) do
        vof:=VerticesOfFace(Octahedron(),f);
        center:=(coord[vof[1]]+coord[vof[2]]+coord[vof[3]])/3;
        p:=coord[Difference(Vertices(Octahedron()),vof)[1]];
        normal:=NormalVector(coord[vof[1]],coord[vof[2]],coord[vof[3]],p);

        Add(coord,center+normal);
    od;
    return coord;
end;


LoadPackage("GAPic");
pr:=SetVertexCoordinates3D(stellated,StellatedEmbedding(),rec());
DrawComplexToJavaScript(stellated,"stellated",pr);


# Exercise 2
nGon:=function(n)
    local verticesOfEdges, edgesOfFaces, i;
    verticesOfEdges := [];
    edgesOfFaces := [];
    for i in [1..n-1] do
        verticesOfEdges[i] := [i, n+1];
        verticesOfEdges[n+i] := [i,i+1];

        edgesOfFaces[i] := [i,i+1,n+i];
    od;
    verticesOfEdges[n] := [n, n+1];
    verticesOfEdges[2*n] := [1, n];

    edgesOfFaces[n] := [1,n, 2*n];

    return SimplicialSurfaceByDownwardIncidenceNC([1..n+1], 
        [1..2*n], [1..n], verticesOfEdges, edgesOfFaces);
end;

doubleNGon:=function(n)
    local s,e,v;
    s:=nGon(n);
    e:=BoundaryEdges(s)[1];
    v:=VerticesOfEdge(s,e)[1];
    return JoinBoundaries(s,[v,e],s,[v,e])[1];
end;