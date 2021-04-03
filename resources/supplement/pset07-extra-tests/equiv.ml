exception Not_equiv

let testEquivProgram (p1 : Ast.program) (p2 : Ast.program) =
  let testEquivId (m: Symbol.t Env.t) (id1 : Symbol.t) (id2 : Symbol.t) : bool =
    if Env.mem id1 m then
     Env.find id1 m = id2
    else
      id1 = id2

  in
  let rec testEquivStatement (m: Symbol.t Env.t) (s1 : Ast.statement) (s2: Ast.statement) : unit =
    match s1, s2 with
    | Block blk1, Block blk2 ->
      let dcls = List.combine blk1.decls blk2.decls in
      let m =
        List.fold_left
          (fun m (dcl1, dcl2) ->
             if dcl1.Ast.typ = dcl2.Ast.typ then
               Env.add dcl1.Ast.id dcl2.Ast.id m
             else
               raise Not_equiv
          ) m dcls
      in
      List.iter (fun (p1, p2) -> testEquivStatement m p1 p2) (List.combine blk1.statements blk2.statements)
    | Assign a1, Assign a2 ->
      if testEquivId m a1.id a2.id then
        testEquivTerm m a1.expr a2.expr
      else
        raise Not_equiv
    | IfS t1, IfS t2 ->
      testEquivTerm m t1.expr t2.expr;
      testEquivStatement m t1.thn t2.thn;
      testEquivStatement m t1.els t2.els
    | While w1, While w2 ->
      testEquivTerm m w1.expr w2.expr;
      testEquivStatement m w1.statement w2.statement
    | Call c1, Call c2 ->
      if testEquivId m c1.rator c2.rator then
        List.iter (fun (t1, t2) -> testEquivTerm m t1 t2) (List.combine c1.rands c2.rands)
      else
        raise Not_equiv
    | Print t1, Print t2 -> testEquivTerm m t1 t2
    | Return t1, Return t2 -> testEquivTerm m t1 t2
    | _, _ -> raise Not_equiv
  and
    testEquivTerm (m: Symbol.t Env.t) (t1: Ast.term) (t2: Ast.term) =
    match t1, t2 with
    | Id s1, Id s2 ->
      if testEquivId m s1 s2 then
        ()
      else
        raise Not_equiv
    | Literal l1, Literal l2 ->
      if l1.typ = l2.typ && l1.bits = l2.bits then
        ()
      else
        raise Not_equiv
    | App c1, App c2 ->
      if testEquivId m c1.rator c2.rator then
        List.iter (fun (t1, t2) -> testEquivTerm m t1 t2) (List.combine c1.rands c2.rands)
      else
        raise Not_equiv
    | If t1, If t2 ->
      testEquivTerm m t1.expr t2.expr;
      testEquivTerm m t1.thn t2.thn;
      testEquivTerm m t1.els t2.els
    | And t1, And t2 ->
      testEquivTerm m t1.left t2.left;
      testEquivTerm m t1.right t2.right
    | Or t1, Or t2 ->
      testEquivTerm m t1.left t2.left;
      testEquivTerm m t1.right t2.right
    | Let {decl = ValBind {bv = bv1; defn = defn1}; body = body1},
      Let {decl = ValBind {bv = bv2; defn = defn2}; body = body2} ->
      if bv1.typ = bv2.typ then
        (testEquivTerm m defn1 defn2;
        let m = Env.add bv1.id bv2.id m in
        testEquivTerm m body1 body2)
      else
        raise Not_equiv
    | _, _ -> raise Not_equiv
      
  in


  let testEquivProcedure (p1: Ast.procedure) (p2: Ast.procedure) =
    match p1, p2 with
    | Procedure {id=id1; formals=formals1; typ=typ1; body=body1},
      Procedure {id=id2; formals=formals2; typ=typ2; body=body2} ->
      if id1 = id2 && typ1 = typ2 then
        let m = List.fold_left
            (fun m (dcl1, dcl2) ->
               if dcl1.Ast.typ = dcl2.Ast.typ then
                 Env.add dcl1.Ast.id dcl2.Ast.id m
               else
                 raise Not_equiv
            ) Env.empty (List.combine formals1 formals2)
        in testEquivStatement m body1 body2
      else
        raise Not_equiv
  in

  match p1, p2 with
  | Program ps1, Program ps2 ->
    try List.iter (fun (p1, p2) -> testEquivProcedure p1 p2) (List.combine ps1 ps2); true with
    | _ -> false
