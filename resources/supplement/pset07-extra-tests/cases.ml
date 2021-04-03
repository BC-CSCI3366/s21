let tests1 = [("g.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "x"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.App
              {rator = Symbol.fromString "+";
               rands = [Ast.Id (Symbol.fromString "x"); Ast.Literal {typ = Typ.Int; bits = 1}]})]}};
    Ast.Procedure
     {id = Symbol.fromString "g";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.App
               {rator = Symbol.fromString "f";
                rands =
                 [Ast.App
                   {rator = Symbol.fromString "*";
                    rands =
                     [Ast.Id (Symbol.fromString "a"); Ast.Literal {typ = Typ.Int; bits = 2}]}]}};
           Ast.Return (Ast.Id (Symbol.fromString "b"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "g";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 5};
                 Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "g";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 7};
                 Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "g";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 100};
                 Ast.Literal {typ = Typ.Int; bits = 101}]});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "x"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x1"; typ = Typ.Int}; defn = Ast.Id (Symbol.fromString "x")};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x2"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 1}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x3"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "+"; rands = [Ast.Id (Symbol.fromString "x1"); Ast.Id (Symbol.fromString "x2")]}};
                     body = Ast.Id (Symbol.fromString "x3")}}})]}};
    Ast.Procedure
     {id = Symbol.fromString "g";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x4"; typ = Typ.Int};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x5"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "a")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x6"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x7"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "*";
                                  rands = [Ast.Id (Symbol.fromString "x5"); Ast.Id (Symbol.fromString "x6")]}};
                            body = Ast.Id (Symbol.fromString "x7")}}}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x8"; typ = Typ.Int};
                      defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x4")]}};
                   body = Ast.Id (Symbol.fromString "x8")}}};
           Ast.Return (Ast.Id (Symbol.fromString "b"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x9"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 5}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x10"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 6}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x11"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "g";
                           rands = [Ast.Id (Symbol.fromString "x9"); Ast.Id (Symbol.fromString "x10")]}};
                     body = Ast.Id (Symbol.fromString "x11")}}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x12"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x13"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x14"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "g";
                           rands = [Ast.Id (Symbol.fromString "x12"); Ast.Id (Symbol.fromString "x13")]}};
                     body = Ast.Id (Symbol.fromString "x14")}}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x15"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 100}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x16"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 101}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x17"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "g";
                           rands = [Ast.Id (Symbol.fromString "x15"); Ast.Id (Symbol.fromString "x16")]}};
                     body = Ast.Id (Symbol.fromString "x17")}}});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("d.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "x"; typ = Typ.Int}]; typ = Typ.Int;
      body = Ast.Block {decls = []; statements = [Ast.Return (Ast.Id (Symbol.fromString "x"))]}};
    Ast.Procedure
     {id = Symbol.fromString "g";
      formals = [{id = Symbol.fromString "x"; typ = Typ.Int}; {id = Symbol.fromString "y"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "==";
                rands = [Ast.Id (Symbol.fromString "y"); Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0});
             els =
              Ast.Block
               {decls =
                 [{id = Symbol.fromString "a"; typ = Typ.Int};
                  {id = Symbol.fromString "b"; typ = Typ.Bool}];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "a";
                    expr = Ast.Literal {typ = Typ.Int; bits = 0}};
                  Ast.Assign
                   {id = Symbol.fromString "b";
                    expr = Ast.Literal {typ = Typ.Bool; bits = 1}};
                  Ast.While
                   {expr =
                     Ast.And
                      {left = Ast.Id (Symbol.fromString "b");
                       right = Ast.Literal {typ = Typ.Bool; bits = 1}};
                    statement =
                     Ast.Block
                      {decls = [{id = Symbol.fromString "c"; typ = Typ.Int}];
                       statements =
                        [Ast.Assign
                          {id = Symbol.fromString "c";
                           expr =
                            Ast.App
                             {rator = Symbol.fromString "+";
                              rands =
                               [Ast.Id (Symbol.fromString "a");
                                Ast.Literal {typ = Typ.Int; bits = 1}]}};
                         Ast.Print (Ast.Id (Symbol.fromString "a"));
                         Ast.Assign
                          {id = Symbol.fromString "b";
                           expr = Ast.Literal {typ = Typ.Bool; bits = 0}}]}};
                  Ast.IfS
                   {expr = Ast.Literal {typ = Typ.Bool; bits = 1};
                    thn =
                     Ast.Return
                      (Ast.App
                        {rator = Symbol.fromString "*";
                         rands =
                          [Ast.Literal {typ = Typ.Int; bits = 3};
                           Ast.Literal {typ = Typ.Int; bits = 12}]});
                    els =
                     Ast.Return
                      (Ast.App
                        {rator = Symbol.fromString "+";
                         rands =
                          [Ast.App
                            {rator = Symbol.fromString "f";
                             rands =
                              [Ast.Literal {typ = Typ.Int; bits = 3}]};
                           Ast.App
                            {rator = Symbol.fromString "g";
                             rands =
                              [Ast.Literal {typ = Typ.Int; bits = 2};
                               Ast.Literal {typ = Typ.Int; bits = 3}]}]})}]}}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.App
              {rator = Symbol.fromString "+";
               rands =
                [Ast.App
                  {rator = Symbol.fromString "g";
                   rands =
                    [Ast.Literal {typ = Typ.Int; bits = 2};
                     Ast.Literal {typ = Typ.Int; bits = 2}]};
                 Ast.App
                  {rator = Symbol.fromString "g";
                   rands =
                    [Ast.Literal {typ = Typ.Int; bits = 2};
                     Ast.Literal {typ = Typ.Int; bits = 3}]}]})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "x"; typ = Typ.Int}]; typ = Typ.Int;
      body = Ast.Block {decls = []; statements = [Ast.Return (Ast.Id (Symbol.fromString "x"))]}};
    Ast.Procedure
     {id = Symbol.fromString "g";
      formals = [{id = Symbol.fromString "x"; typ = Typ.Int}; {id = Symbol.fromString "y"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x33"; typ = Typ.Int}; defn = Ast.Id (Symbol.fromString "y")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x34"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x35"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "==";
                            rands = [Ast.Id (Symbol.fromString "x33"); Ast.Id (Symbol.fromString "x34")]}};
                      body = Ast.Id (Symbol.fromString "x35")}}};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0});
             els =
              Ast.Block
               {decls =
                 [{id = Symbol.fromString "a"; typ = Typ.Int};
                  {id = Symbol.fromString "b"; typ = Typ.Bool}];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "a";
                    expr = Ast.Literal {typ = Typ.Int; bits = 0}};
                  Ast.Assign
                   {id = Symbol.fromString "b";
                    expr = Ast.Literal {typ = Typ.Bool; bits = 1}};
                  Ast.While
                   {expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x21"; typ = Typ.Bool};
                          defn = Ast.Id (Symbol.fromString "b")};
                       body =
                        Ast.If
                         {expr = Ast.Id (Symbol.fromString "x21");
                          thn = Ast.Literal {typ = Typ.Bool; bits = 1};
                          els = Ast.Id (Symbol.fromString "x21")}};
                    statement =
                     Ast.Block
                      {decls = [{id = Symbol.fromString "c"; typ = Typ.Int}];
                       statements =
                        [Ast.Assign
                          {id = Symbol.fromString "c";
                           expr =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x18"; typ = Typ.Int};
                                 defn = Ast.Id (Symbol.fromString "a")};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x19"; typ = Typ.Int};
                                    defn =
                                     Ast.Literal {typ = Typ.Int; bits = 1}};
                                 body =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv = {id = Symbol.fromString "x20"; typ = Typ.Int};
                                       defn =
                                        Ast.App
                                         {rator = Symbol.fromString "+";
                                          rands = [Ast.Id (Symbol.fromString "x18"); Ast.Id (Symbol.fromString "x19")]}};
                                    body = Ast.Id (Symbol.fromString "x20")}}}};
                         Ast.Print (Ast.Id (Symbol.fromString "a"));
                         Ast.Assign
                          {id = Symbol.fromString "b";
                           expr = Ast.Literal {typ = Typ.Bool; bits = 0}}]}};
                  Ast.IfS
                   {expr = Ast.Literal {typ = Typ.Bool; bits = 1};
                    thn =
                     Ast.Return
                      (Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x30"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x31"; typ = Typ.Int};
                               defn =
                                Ast.Literal {typ = Typ.Int; bits = 12}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = Symbol.fromString "x32"; typ = Typ.Int};
                                  defn =
                                   Ast.App
                                    {rator = Symbol.fromString "*";
                                     rands = [Ast.Id (Symbol.fromString "x30"); Ast.Id (Symbol.fromString "x31")]}};
                               body = Ast.Id (Symbol.fromString "x32")}}});
                    els =
                     Ast.Return
                      (Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x22"; typ = Typ.Int};
                            defn =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = Symbol.fromString "x24"; typ = Typ.Int};
                                  defn =
                                   Ast.Literal {typ = Typ.Int; bits = 3}};
                               body =
                                Ast.Let
                                 {decl =
                                   Ast.ValBind
                                    {bv = {id = Symbol.fromString "x25"; typ = Typ.Int};
                                     defn =
                                      Ast.App
                                       {rator = Symbol.fromString "f";
                                        rands = [Ast.Id (Symbol.fromString "x24")]}};
                                  body = Ast.Id (Symbol.fromString "x25")}}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x23"; typ = Typ.Int};
                               defn =
                                Ast.Let
                                 {decl =
                                   Ast.ValBind
                                    {bv = {id = Symbol.fromString "x26"; typ = Typ.Int};
                                     defn =
                                      Ast.Literal {typ = Typ.Int; bits = 2}};
                                  body =
                                   Ast.Let
                                    {decl =
                                      Ast.ValBind
                                       {bv =
                                         {id = Symbol.fromString "x27"; typ = Typ.Int};
                                        defn =
                                         Ast.Literal
                                          {typ = Typ.Int; bits = 3}};
                                     body =
                                      Ast.Let
                                       {decl =
                                         Ast.ValBind
                                          {bv =
                                            {id = Symbol.fromString "x28"; typ = Typ.Int};
                                           defn =
                                            Ast.App
                                             {rator = Symbol.fromString "g";
                                              rands =
                                               [Ast.Id (Symbol.fromString "x26"); Ast.Id (Symbol.fromString "x27")]}};
                                        body = Ast.Id (Symbol.fromString "x28")}}}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = Symbol.fromString "x29"; typ = Typ.Int};
                                  defn =
                                   Ast.App
                                    {rator = Symbol.fromString "+";
                                     rands = [Ast.Id (Symbol.fromString "x22"); Ast.Id (Symbol.fromString "x23")]}};
                               body = Ast.Id (Symbol.fromString "x29")}}})}]}}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x36"; typ = Typ.Int};
                  defn =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x38"; typ = Typ.Int};
                        defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x39"; typ = Typ.Int};
                           defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x40"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "g";
                                 rands = [Ast.Id (Symbol.fromString "x38"); Ast.Id (Symbol.fromString "x39")]}};
                           body = Ast.Id (Symbol.fromString "x40")}}}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x37"; typ = Typ.Int};
                     defn =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x41"; typ = Typ.Int};
                           defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x42"; typ = Typ.Int};
                              defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                           body =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x43"; typ = Typ.Int};
                                 defn =
                                  Ast.App
                                   {rator = Symbol.fromString "g";
                                    rands = [Ast.Id (Symbol.fromString "x41"); Ast.Id (Symbol.fromString "x42")]}};
                              body = Ast.Id (Symbol.fromString "x43")}}}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x44"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "+";
                           rands = [Ast.Id (Symbol.fromString "x36"); Ast.Id (Symbol.fromString "x37")]}};
                     body = Ast.Id (Symbol.fromString "x44")}}})]}}]);
 ("cond2.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString ">";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString ">";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 3};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString ">";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 4};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString ">=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString ">=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 3};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString ">=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 4};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 3};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 4};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 3};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 4};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]}};
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x45"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x46"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x47"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">";
                            rands = [Ast.Id (Symbol.fromString "x45"); Ast.Id (Symbol.fromString "x46")]}};
                      body = Ast.Id (Symbol.fromString "x47")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x48"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x49"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x50"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">";
                            rands = [Ast.Id (Symbol.fromString "x48"); Ast.Id (Symbol.fromString "x49")]}};
                      body = Ast.Id (Symbol.fromString "x50")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x51"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x52"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x53"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">";
                            rands = [Ast.Id (Symbol.fromString "x51"); Ast.Id (Symbol.fromString "x52")]}};
                      body = Ast.Id (Symbol.fromString "x53")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x54"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x55"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x56"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">=";
                            rands = [Ast.Id (Symbol.fromString "x54"); Ast.Id (Symbol.fromString "x55")]}};
                      body = Ast.Id (Symbol.fromString "x56")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x57"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x58"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x59"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">=";
                            rands = [Ast.Id (Symbol.fromString "x57"); Ast.Id (Symbol.fromString "x58")]}};
                      body = Ast.Id (Symbol.fromString "x59")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x60"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x61"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x62"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">=";
                            rands = [Ast.Id (Symbol.fromString "x60"); Ast.Id (Symbol.fromString "x61")]}};
                      body = Ast.Id (Symbol.fromString "x62")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x63"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x64"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x65"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x63"); Ast.Id (Symbol.fromString "x64")]}};
                      body = Ast.Id (Symbol.fromString "x65")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x66"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x67"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x68"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x66"); Ast.Id (Symbol.fromString "x67")]}};
                      body = Ast.Id (Symbol.fromString "x68")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x69"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x70"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x71"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x69"); Ast.Id (Symbol.fromString "x70")]}};
                      body = Ast.Id (Symbol.fromString "x71")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x72"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x73"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x74"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<=";
                            rands = [Ast.Id (Symbol.fromString "x72"); Ast.Id (Symbol.fromString "x73")]}};
                      body = Ast.Id (Symbol.fromString "x74")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x75"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x76"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x77"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<=";
                            rands = [Ast.Id (Symbol.fromString "x75"); Ast.Id (Symbol.fromString "x76")]}};
                      body = Ast.Id (Symbol.fromString "x77")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x78"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x79"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x80"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<=";
                            rands = [Ast.Id (Symbol.fromString "x78"); Ast.Id (Symbol.fromString "x79")]}};
                      body = Ast.Id (Symbol.fromString "x80")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]}};
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("cond1.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "gt";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Bool;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.App {rator = Symbol.fromString ">"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]})]}};
    Ast.Procedure
     {id = Symbol.fromString "geq";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Bool;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.App {rator = Symbol.fromString ">="; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]})]}};
    Ast.Procedure
     {id = Symbol.fromString "lt";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Bool;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.App {rator = Symbol.fromString "<"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]})]}};
    Ast.Procedure
     {id = Symbol.fromString "leq";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Bool;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.App {rator = Symbol.fromString "<="; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]})]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "gt";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 3};
                  Ast.Literal {typ = Typ.Int; bits = 2}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 1})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.IfS
                   {expr =
                     Ast.App
                      {rator = Symbol.fromString "geq";
                       rands =
                        [Ast.Literal {typ = Typ.Int; bits = 2};
                         Ast.Literal {typ = Typ.Int; bits = 3}]};
                    thn =
                     Ast.Block
                      {decls = [];
                       statements =
                        [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 2})]};
                    els =
                     Ast.Block
                      {decls = [];
                       statements =
                        [Ast.IfS
                          {expr =
                            Ast.App
                             {rator = Symbol.fromString "lt";
                              rands =
                               [Ast.Literal {typ = Typ.Int; bits = 2};
                                Ast.Literal {typ = Typ.Int; bits = 3}]};
                           thn =
                            Ast.Block
                             {decls = [];
                              statements =
                               [Ast.Print
                                 (Ast.Literal {typ = Typ.Int; bits = 3})]};
                           els =
                            Ast.Block
                             {decls = [];
                              statements =
                               [Ast.IfS
                                 {expr =
                                   Ast.App
                                    {rator = Symbol.fromString "leq";
                                     rands =
                                      [Ast.Literal
                                        {typ = Typ.Int; bits = 2};
                                       Ast.Literal
                                        {typ = Typ.Int; bits = 3}]};
                                  thn =
                                   Ast.Block
                                    {decls = [];
                                     statements =
                                      [Ast.Print
                                        (Ast.Literal
                                          {typ = Typ.Int; bits = 4})]};
                                  els =
                                   Ast.Block
                                    {decls = [];
                                     statements =
                                      [Ast.Print
                                        (Ast.Literal
                                          {typ = Typ.Int; bits = 5})]}}]}}]}}]}};
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "gt";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Bool;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x81"; typ = Typ.Int}; defn = Ast.Id (Symbol.fromString "a")};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x82"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "b")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x83"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString ">";
                           rands = [Ast.Id (Symbol.fromString "x81"); Ast.Id (Symbol.fromString "x82")]}};
                     body = Ast.Id (Symbol.fromString "x83")}}})]}};
    Ast.Procedure
     {id = Symbol.fromString "geq";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Bool;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x84"; typ = Typ.Int}; defn = Ast.Id (Symbol.fromString "a")};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x85"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "b")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x86"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString ">=";
                           rands = [Ast.Id (Symbol.fromString "x84"); Ast.Id (Symbol.fromString "x85")]}};
                     body = Ast.Id (Symbol.fromString "x86")}}})]}};
    Ast.Procedure
     {id = Symbol.fromString "lt";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Bool;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x87"; typ = Typ.Int}; defn = Ast.Id (Symbol.fromString "a")};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x88"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "b")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x89"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "<";
                           rands = [Ast.Id (Symbol.fromString "x87"); Ast.Id (Symbol.fromString "x88")]}};
                     body = Ast.Id (Symbol.fromString "x89")}}})]}};
    Ast.Procedure
     {id = Symbol.fromString "leq";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Bool;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x90"; typ = Typ.Int}; defn = Ast.Id (Symbol.fromString "a")};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x91"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "b")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x92"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "<=";
                           rands = [Ast.Id (Symbol.fromString "x90"); Ast.Id (Symbol.fromString "x91")]}};
                     body = Ast.Id (Symbol.fromString "x92")}}})]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x102"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x103"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x104"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "gt";
                            rands = [Ast.Id (Symbol.fromString "x102"); Ast.Id (Symbol.fromString "x103")]}};
                      body = Ast.Id (Symbol.fromString "x104")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 1})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.IfS
                   {expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x99"; typ = Typ.Int};
                          defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                       body =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x100"; typ = Typ.Int};
                             defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x101"; typ = Typ.Int};
                                defn =
                                 Ast.App
                                  {rator = Symbol.fromString "geq";
                                   rands = [Ast.Id (Symbol.fromString "x99"); Ast.Id (Symbol.fromString "x100")]}};
                             body = Ast.Id (Symbol.fromString "x101")}}};
                    thn =
                     Ast.Block
                      {decls = [];
                       statements =
                        [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 2})]};
                    els =
                     Ast.Block
                      {decls = [];
                       statements =
                        [Ast.IfS
                          {expr =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x96"; typ = Typ.Int};
                                 defn =
                                  Ast.Literal {typ = Typ.Int; bits = 2}};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x97"; typ = Typ.Int};
                                    defn =
                                     Ast.Literal {typ = Typ.Int; bits = 3}};
                                 body =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv = {id = Symbol.fromString "x98"; typ = Typ.Int};
                                       defn =
                                        Ast.App
                                         {rator = Symbol.fromString "lt";
                                          rands = [Ast.Id (Symbol.fromString "x96"); Ast.Id (Symbol.fromString "x97")]}};
                                    body = Ast.Id (Symbol.fromString "x98")}}};
                           thn =
                            Ast.Block
                             {decls = [];
                              statements =
                               [Ast.Print
                                 (Ast.Literal {typ = Typ.Int; bits = 3})]};
                           els =
                            Ast.Block
                             {decls = [];
                              statements =
                               [Ast.IfS
                                 {expr =
                                   Ast.Let
                                    {decl =
                                      Ast.ValBind
                                       {bv =
                                         {id = Symbol.fromString "x93"; typ = Typ.Int};
                                        defn =
                                         Ast.Literal
                                          {typ = Typ.Int; bits = 2}};
                                     body =
                                      Ast.Let
                                       {decl =
                                         Ast.ValBind
                                          {bv =
                                            {id = Symbol.fromString "x94"; typ = Typ.Int};
                                           defn =
                                            Ast.Literal
                                             {typ = Typ.Int; bits = 3}};
                                        body =
                                         Ast.Let
                                          {decl =
                                            Ast.ValBind
                                             {bv =
                                               {id = Symbol.fromString "x95"; typ = Typ.Int};
                                              defn =
                                               Ast.App
                                                {rator = Symbol.fromString "leq";
                                                 rands =
                                                  [Ast.Id (Symbol.fromString "x93"); Ast.Id (Symbol.fromString "x94")]}};
                                           body = Ast.Id (Symbol.fromString "x95")}}};
                                  thn =
                                   Ast.Block
                                    {decls = [];
                                     statements =
                                      [Ast.Print
                                        (Ast.Literal
                                          {typ = Typ.Int; bits = 4})]};
                                  els =
                                   Ast.Block
                                    {decls = [];
                                     statements =
                                      [Ast.Print
                                        (Ast.Literal
                                          {typ = Typ.Int; bits = 5})]}}]}}]}}]}};
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("b.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "b"; typ = Typ.Int}];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString ">";
                rands = [Ast.Id (Symbol.fromString "a"); Ast.Literal {typ = Typ.Int; bits = 4}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "b";
                    expr =
                     Ast.App
                      {rator = Symbol.fromString "+";
                       rands =
                        [Ast.Literal {typ = Typ.Int; bits = 2};
                         Ast.App
                          {rator = Symbol.fromString "*";
                           rands =
                            [Ast.Id (Symbol.fromString "a");
                             Ast.Literal {typ = Typ.Int; bits = 8}]}]}}]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "b";
                    expr = Ast.Literal {typ = Typ.Int; bits = 343}}]}};
           Ast.Return (Ast.Id (Symbol.fromString "b"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 5}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "b"; typ = Typ.Int}];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x111"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "a")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x112"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x113"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">";
                            rands = [Ast.Id (Symbol.fromString "x111"); Ast.Id (Symbol.fromString "x112")]}};
                      body = Ast.Id (Symbol.fromString "x113")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "b";
                    expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x105"; typ = Typ.Int};
                          defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                       body =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x106"; typ = Typ.Int};
                             defn =
                              Ast.Let
                               {decl =
                                 Ast.ValBind
                                  {bv = {id = Symbol.fromString "x107"; typ = Typ.Int};
                                   defn = Ast.Id (Symbol.fromString "a")};
                                body =
                                 Ast.Let
                                  {decl =
                                    Ast.ValBind
                                     {bv = {id = Symbol.fromString "x108"; typ = Typ.Int};
                                      defn =
                                       Ast.Literal
                                        {typ = Typ.Int; bits = 8}};
                                   body =
                                    Ast.Let
                                     {decl =
                                       Ast.ValBind
                                        {bv =
                                          {id = Symbol.fromString "x109"; typ = Typ.Int};
                                         defn =
                                          Ast.App
                                           {rator = Symbol.fromString "*";
                                            rands =
                                             [Ast.Id (Symbol.fromString "x107"); Ast.Id (Symbol.fromString "x108")]}};
                                      body = Ast.Id (Symbol.fromString "x109")}}}};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x110"; typ = Typ.Int};
                                defn =
                                 Ast.App
                                  {rator = Symbol.fromString "+";
                                   rands = [Ast.Id (Symbol.fromString "x105"); Ast.Id (Symbol.fromString "x106")]}};
                             body = Ast.Id (Symbol.fromString "x110")}}}}]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "b";
                    expr = Ast.Literal {typ = Typ.Int; bits = 343}}]}};
           Ast.Return (Ast.Id (Symbol.fromString "b"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x114"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 5}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x115"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x114")]}};
                  body = Ast.Id (Symbol.fromString "x115")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x116"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x117"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x116")]}};
                  body = Ast.Id (Symbol.fromString "x117")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x118"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x119"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x118")]}};
                  body = Ast.Id (Symbol.fromString "x119")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x120"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 8}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x121"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x120")]}};
                  body = Ast.Id (Symbol.fromString "x121")}});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("a3.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "c"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "d"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "c";
             expr =
              Ast.App
               {rator = Symbol.fromString "+";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.App
                   {rator = Symbol.fromString "*";
                    rands =
                     [Ast.Id (Symbol.fromString "c"); Ast.Literal {typ = Typ.Int; bits = 8}]}]}};
           Ast.Return (Ast.Id (Symbol.fromString "d"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 5}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "c"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "d"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "c";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x122"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x123"; typ = Typ.Int};
                      defn =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x124"; typ = Typ.Int};
                            defn = Ast.Id (Symbol.fromString "c")};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x125"; typ = Typ.Int};
                               defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = Symbol.fromString "x126"; typ = Typ.Int};
                                  defn =
                                   Ast.App
                                    {rator = Symbol.fromString "*";
                                     rands = [Ast.Id (Symbol.fromString "x124"); Ast.Id (Symbol.fromString "x125")]}};
                               body = Ast.Id (Symbol.fromString "x126")}}}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x127"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "+";
                            rands = [Ast.Id (Symbol.fromString "x122"); Ast.Id (Symbol.fromString "x123")]}};
                      body = Ast.Id (Symbol.fromString "x127")}}}};
           Ast.Return (Ast.Id (Symbol.fromString "d"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x128"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 5}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x129"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x128")]}};
                  body = Ast.Id (Symbol.fromString "x129")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x130"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x131"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x130")]}};
                  body = Ast.Id (Symbol.fromString "x131")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x132"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x133"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x132")]}};
                  body = Ast.Id (Symbol.fromString "x133")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x134"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 8}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x135"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x134")]}};
                  body = Ast.Id (Symbol.fromString "x135")}});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("c.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls =
          [{id = Symbol.fromString "b"; typ = Typ.Int}; {id = Symbol.fromString "c"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.App
               {rator = Symbol.fromString "+";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 1};
                  Ast.App
                   {rator = Symbol.fromString "*";
                    rands =
                     [Ast.Literal {typ = Typ.Int; bits = 2};
                      Ast.Literal {typ = Typ.Int; bits = 3}]}]}};
           Ast.Assign
            {id = Symbol.fromString "c";
             expr =
              Ast.App
               {rator = Symbol.fromString "*";
                rands = [Ast.Id (Symbol.fromString "b"); Ast.Literal {typ = Typ.Int; bits = 2}]}};
           Ast.While
            {expr =
              Ast.App
               {rator = Symbol.fromString ">";
                rands = [Ast.Id (Symbol.fromString "b"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             statement =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "b";
                    expr =
                     Ast.App
                      {rator = Symbol.fromString "-";
                       rands =
                        [Ast.Id (Symbol.fromString "b"); Ast.Literal {typ = Typ.Int; bits = 1}]}}]}};
           Ast.Return
            (Ast.App {rator = Symbol.fromString "+"; rands = [Ast.Id (Symbol.fromString "b"); Ast.Id (Symbol.fromString "c")]})]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 10}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 11}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 12}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 13}]});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls =
          [{id = Symbol.fromString "b"; typ = Typ.Int}; {id = Symbol.fromString "c"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x136"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 1}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x137"; typ = Typ.Int};
                      defn =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x138"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x139"; typ = Typ.Int};
                               defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = Symbol.fromString "x140"; typ = Typ.Int};
                                  defn =
                                   Ast.App
                                    {rator = Symbol.fromString "*";
                                     rands = [Ast.Id (Symbol.fromString "x138"); Ast.Id (Symbol.fromString "x139")]}};
                               body = Ast.Id (Symbol.fromString "x140")}}}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x141"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "+";
                            rands = [Ast.Id (Symbol.fromString "x136"); Ast.Id (Symbol.fromString "x137")]}};
                      body = Ast.Id (Symbol.fromString "x141")}}}};
           Ast.Assign
            {id = Symbol.fromString "c";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x142"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "b")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x143"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x144"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "*";
                            rands = [Ast.Id (Symbol.fromString "x142"); Ast.Id (Symbol.fromString "x143")]}};
                      body = Ast.Id (Symbol.fromString "x144")}}}};
           Ast.While
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x148"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "b")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x149"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x150"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">";
                            rands = [Ast.Id (Symbol.fromString "x148"); Ast.Id (Symbol.fromString "x149")]}};
                      body = Ast.Id (Symbol.fromString "x150")}}};
             statement =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "b";
                    expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x145"; typ = Typ.Int};
                          defn = Ast.Id (Symbol.fromString "b")};
                       body =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x146"; typ = Typ.Int};
                             defn = Ast.Literal {typ = Typ.Int; bits = 1}};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x147"; typ = Typ.Int};
                                defn =
                                 Ast.App
                                  {rator = Symbol.fromString "-";
                                   rands = [Ast.Id (Symbol.fromString "x145"); Ast.Id (Symbol.fromString "x146")]}};
                             body = Ast.Id (Symbol.fromString "x147")}}}}]}};
           Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x151"; typ = Typ.Int}; defn = Ast.Id (Symbol.fromString "b")};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x152"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "c")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x153"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "+";
                           rands = [Ast.Id (Symbol.fromString "x151"); Ast.Id (Symbol.fromString "x152")]}};
                     body = Ast.Id (Symbol.fromString "x153")}}})]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x154"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 10}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x155"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x154")]}};
                  body = Ast.Id (Symbol.fromString "x155")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x156"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 11}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x157"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x156")]}};
                  body = Ast.Id (Symbol.fromString "x157")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x158"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 12}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x159"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x158")]}};
                  body = Ast.Id (Symbol.fromString "x159")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x160"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 13}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x161"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x160")]}};
                  body = Ast.Id (Symbol.fromString "x161")}});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("fact2_bad.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "fact"; formals = [{id = Symbol.fromString "m"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "==";
                rands = [Ast.Id (Symbol.fromString "n"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.App
                 {rator = Symbol.fromString "*";
                  rands =
                   [Ast.App
                     {rator = Symbol.fromString "fact";
                      rands =
                       [Ast.App
                         {rator = Symbol.fromString "-";
                          rands =
                           [Ast.Id (Symbol.fromString "n");
                            Ast.Literal {typ = Typ.Int; bits = 1}]}]};
                    Ast.Id (Symbol.fromString "n")]})}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 9}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 10}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 11}]});
           Ast.Return
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "fact"; formals = [{id = Symbol.fromString "m"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x170"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "n")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x171"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x172"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "==";
                            rands = [Ast.Id (Symbol.fromString "x170"); Ast.Id (Symbol.fromString "x171")]}};
                      body = Ast.Id (Symbol.fromString "x172")}}};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x162"; typ = Typ.Int};
                     defn =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x164"; typ = Typ.Int};
                           defn =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x165"; typ = Typ.Int};
                                 defn = Ast.Id (Symbol.fromString "n")};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x166"; typ = Typ.Int};
                                    defn =
                                     Ast.Literal {typ = Typ.Int; bits = 1}};
                                 body =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv =
                                        {id = Symbol.fromString "x167"; typ = Typ.Int};
                                       defn =
                                        Ast.App
                                         {rator = Symbol.fromString "-";
                                          rands =
                                           [Ast.Id (Symbol.fromString "x165"); Ast.Id (Symbol.fromString "x166")]}};
                                    body = Ast.Id (Symbol.fromString "x167")}}}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x168"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x164")]}};
                           body = Ast.Id (Symbol.fromString "x168")}}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x163"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "n")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x169"; typ = Typ.Int};
                           defn =
                            Ast.App
                             {rator = Symbol.fromString "*";
                              rands = [Ast.Id (Symbol.fromString "x162"); Ast.Id (Symbol.fromString "x163")]}};
                        body = Ast.Id (Symbol.fromString "x169")}}})}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x173"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x174"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x173")]}};
                  body = Ast.Id (Symbol.fromString "x174")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x175"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 8}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x176"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x175")]}};
                  body = Ast.Id (Symbol.fromString "x176")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x177"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 9}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x178"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x177")]}};
                  body = Ast.Id (Symbol.fromString "x178")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x179"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 10}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x180"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x179")]}};
                  body = Ast.Id (Symbol.fromString "x180")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x181"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 11}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x182"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x181")]}};
                  body = Ast.Id (Symbol.fromString "x182")}});
           Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x183"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x184"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x183")]}};
                  body = Ast.Id (Symbol.fromString "x184")}})]}}]);
 ("f.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls =
          [{id = Symbol.fromString "b"; typ = Typ.Int}; {id = Symbol.fromString "a"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "a"; expr = Ast.Literal {typ = Typ.Int; bits = 4}};
           Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.App
               {rator = Symbol.fromString "+";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.App
                   {rator = Symbol.fromString "*";
                    rands =
                     [Ast.Id (Symbol.fromString "a"); Ast.Literal {typ = Typ.Int; bits = 8}]}]}};
           Ast.Return (Ast.Id (Symbol.fromString "b"))]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls =
          [{id = Symbol.fromString "b"; typ = Typ.Int}; {id = Symbol.fromString "a"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "a"; expr = Ast.Literal {typ = Typ.Int; bits = 4}};
           Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x185"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x186"; typ = Typ.Int};
                      defn =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x187"; typ = Typ.Int};
                            defn = Ast.Id (Symbol.fromString "a")};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x188"; typ = Typ.Int};
                               defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = Symbol.fromString "x189"; typ = Typ.Int};
                                  defn =
                                   Ast.App
                                    {rator = Symbol.fromString "*";
                                     rands = [Ast.Id (Symbol.fromString "x187"); Ast.Id (Symbol.fromString "x188")]}};
                               body = Ast.Id (Symbol.fromString "x189")}}}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x190"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "+";
                            rands = [Ast.Id (Symbol.fromString "x185"); Ast.Id (Symbol.fromString "x186")]}};
                      body = Ast.Id (Symbol.fromString "x190")}}}};
           Ast.Return (Ast.Id (Symbol.fromString "b"))]}}]);
 ("gcd.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "mod";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands = [Ast.Id (Symbol.fromString "b"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0});
             els =
              Ast.While
               {expr =
                 Ast.App {rator = Symbol.fromString ">="; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]};
                statement =
                 Ast.Assign
                  {id = Symbol.fromString "a";
                   expr =
                    Ast.App {rator = Symbol.fromString "-"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]}}}};
           Ast.Return (Ast.Id (Symbol.fromString "a"))]}};
    Ast.Procedure
     {id = Symbol.fromString "abs"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands = [Ast.Id (Symbol.fromString "a"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn =
              Ast.Return
               (Ast.App
                 {rator = Symbol.fromString "-";
                  rands =
                   [Ast.Literal {typ = Typ.Int; bits = 0}; Ast.Id (Symbol.fromString "a")]});
             els = Ast.Return (Ast.Id (Symbol.fromString "a"))}]}};
    Ast.Procedure
     {id = Symbol.fromString "gcd";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "a";
             expr = Ast.App {rator = Symbol.fromString "abs"; rands = [Ast.Id (Symbol.fromString "a")]}};
           Ast.Assign
            {id = Symbol.fromString "b";
             expr = Ast.App {rator = Symbol.fromString "abs"; rands = [Ast.Id (Symbol.fromString "b")]}};
           Ast.IfS
            {expr =
              Ast.Or
               {left =
                 Ast.App
                  {rator = Symbol.fromString "==";
                   rands =
                    [Ast.Id (Symbol.fromString "a"); Ast.Literal {typ = Typ.Int; bits = 0}]};
                right =
                 Ast.App
                  {rator = Symbol.fromString "==";
                   rands =
                    [Ast.Id (Symbol.fromString "b"); Ast.Literal {typ = Typ.Int; bits = 0}]}};
             thn =
              Ast.Return
               (Ast.App {rator = Symbol.fromString "+"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]});
             els =
              Ast.IfS
               {expr =
                 Ast.App {rator = Symbol.fromString ">"; rands = [Ast.Id (Symbol.fromString "b"); Ast.Id (Symbol.fromString "a")]};
                thn =
                 Ast.Return
                  (Ast.App
                    {rator = Symbol.fromString "gcd";
                     rands =
                      [Ast.Id (Symbol.fromString "a");
                       Ast.App
                        {rator = Symbol.fromString "mod"; rands = [Ast.Id (Symbol.fromString "b"); Ast.Id (Symbol.fromString "a")]}]});
                els =
                 Ast.Return
                  (Ast.App
                    {rator = Symbol.fromString "gcd";
                     rands =
                      [Ast.App
                        {rator = Symbol.fromString "mod"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]};
                       Ast.Id (Symbol.fromString "b")]})}}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Void;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "x"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "gcd";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 14039};
                  Ast.Literal {typ = Typ.Int; bits = 1529}]}};
           Ast.Print (Ast.Id (Symbol.fromString "x"))]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "mod";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x197"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "b")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x198"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x199"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x197"); Ast.Id (Symbol.fromString "x198")]}};
                      body = Ast.Id (Symbol.fromString "x199")}}};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0});
             els =
              Ast.While
               {expr =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x194"; typ = Typ.Int};
                      defn = Ast.Id (Symbol.fromString "a")};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x195"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "b")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x196"; typ = Typ.Int};
                            defn =
                             Ast.App
                              {rator = Symbol.fromString ">=";
                               rands = [Ast.Id (Symbol.fromString "x194"); Ast.Id (Symbol.fromString "x195")]}};
                         body = Ast.Id (Symbol.fromString "x196")}}};
                statement =
                 Ast.Assign
                  {id = Symbol.fromString "a";
                   expr =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x191"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "a")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x192"; typ = Typ.Int};
                            defn = Ast.Id (Symbol.fromString "b")};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x193"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "-";
                                  rands = [Ast.Id (Symbol.fromString "x191"); Ast.Id (Symbol.fromString "x192")]}};
                            body = Ast.Id (Symbol.fromString "x193")}}}}}};
           Ast.Return (Ast.Id (Symbol.fromString "a"))]}};
    Ast.Procedure
     {id = Symbol.fromString "abs"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x203"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "a")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x204"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x205"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x203"); Ast.Id (Symbol.fromString "x204")]}};
                      body = Ast.Id (Symbol.fromString "x205")}}};
             thn =
              Ast.Return
               (Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x200"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x201"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "a")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x202"; typ = Typ.Int};
                           defn =
                            Ast.App
                             {rator = Symbol.fromString "-";
                              rands = [Ast.Id (Symbol.fromString "x200"); Ast.Id (Symbol.fromString "x201")]}};
                        body = Ast.Id (Symbol.fromString "x202")}}});
             els = Ast.Return (Ast.Id (Symbol.fromString "a"))}]}};
    Ast.Procedure
     {id = Symbol.fromString "gcd";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "a";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x206"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "a")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x207"; typ = Typ.Int};
                      defn =
                       Ast.App {rator = Symbol.fromString "abs"; rands = [Ast.Id (Symbol.fromString "x206")]}};
                   body = Ast.Id (Symbol.fromString "x207")}}};
           Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x208"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "b")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x209"; typ = Typ.Int};
                      defn =
                       Ast.App {rator = Symbol.fromString "abs"; rands = [Ast.Id (Symbol.fromString "x208")]}};
                   body = Ast.Id (Symbol.fromString "x209")}}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x228"; typ = Typ.Bool};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x232"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "a")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x233"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x234"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "==";
                                  rands = [Ast.Id (Symbol.fromString "x232"); Ast.Id (Symbol.fromString "x233")]}};
                            body = Ast.Id (Symbol.fromString "x234")}}}};
                body =
                 Ast.If
                  {expr = Ast.Id (Symbol.fromString "x228"); thn = Ast.Id (Symbol.fromString "x228");
                   els =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x229"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "b")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x230"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x231"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "==";
                                  rands = [Ast.Id (Symbol.fromString "x229"); Ast.Id (Symbol.fromString "x230")]}};
                            body = Ast.Id (Symbol.fromString "x231")}}}}};
             thn =
              Ast.Return
               (Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x225"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "a")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x226"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "b")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x227"; typ = Typ.Int};
                           defn =
                            Ast.App
                             {rator = Symbol.fromString "+";
                              rands = [Ast.Id (Symbol.fromString "x225"); Ast.Id (Symbol.fromString "x226")]}};
                        body = Ast.Id (Symbol.fromString "x227")}}});
             els =
              Ast.IfS
               {expr =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x222"; typ = Typ.Int};
                      defn = Ast.Id (Symbol.fromString "b")};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x223"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "a")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x224"; typ = Typ.Int};
                            defn =
                             Ast.App
                              {rator = Symbol.fromString ">";
                               rands = [Ast.Id (Symbol.fromString "x222"); Ast.Id (Symbol.fromString "x223")]}};
                         body = Ast.Id (Symbol.fromString "x224")}}};
                thn =
                 Ast.Return
                  (Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x216"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "a")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x217"; typ = Typ.Int};
                           defn =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x218"; typ = Typ.Int};
                                 defn = Ast.Id (Symbol.fromString "b")};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x219"; typ = Typ.Int};
                                    defn = Ast.Id (Symbol.fromString "a")};
                                 body =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv =
                                        {id = Symbol.fromString "x220"; typ = Typ.Int};
                                       defn =
                                        Ast.App
                                         {rator = Symbol.fromString "mod";
                                          rands =
                                           [Ast.Id (Symbol.fromString "x218"); Ast.Id (Symbol.fromString "x219")]}};
                                    body = Ast.Id (Symbol.fromString "x220")}}}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x221"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "gcd";
                                 rands = [Ast.Id (Symbol.fromString "x216"); Ast.Id (Symbol.fromString "x217")]}};
                           body = Ast.Id (Symbol.fromString "x221")}}});
                els =
                 Ast.Return
                  (Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x210"; typ = Typ.Int};
                        defn =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x212"; typ = Typ.Int};
                              defn = Ast.Id (Symbol.fromString "a")};
                           body =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x213"; typ = Typ.Int};
                                 defn = Ast.Id (Symbol.fromString "b")};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x214"; typ = Typ.Int};
                                    defn =
                                     Ast.App
                                      {rator = Symbol.fromString "mod";
                                       rands = [Ast.Id (Symbol.fromString "x212"); Ast.Id (Symbol.fromString "x213")]}};
                                 body = Ast.Id (Symbol.fromString "x214")}}}};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x211"; typ = Typ.Int};
                           defn = Ast.Id (Symbol.fromString "b")};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x215"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "gcd";
                                 rands = [Ast.Id (Symbol.fromString "x210"); Ast.Id (Symbol.fromString "x211")]}};
                           body = Ast.Id (Symbol.fromString "x215")}}})}}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Void;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "x"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x235"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 14039}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x236"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 1529}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x237"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "gcd";
                            rands = [Ast.Id (Symbol.fromString "x235"); Ast.Id (Symbol.fromString "x236")]}};
                      body = Ast.Id (Symbol.fromString "x237")}}}};
           Ast.Print (Ast.Id (Symbol.fromString "x"))]}}]);
 ("threefacts_bad.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "ifact"; formals = [{id = Symbol.fromString "m"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "answer"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "answer";
             expr = Ast.Literal {typ = Typ.Int; bits = 1}};
           Ast.While
            {expr =
              Ast.App
               {rator = Symbol.fromString ">";
                rands = [Ast.Id (Symbol.fromString "m"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             statement =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "answer";
                    expr =
                     Ast.App
                      {rator = Symbol.fromString "*"; rands = [Ast.Id (Symbol.fromString "answer"); Ast.Id (Symbol.fromString "m")]}};
                  Ast.Assign
                   {id = Symbol.fromString "n";
                    expr =
                     Ast.App
                      {rator = Symbol.fromString "-";
                       rands =
                        [Ast.Id (Symbol.fromString "m"); Ast.Literal {typ = Typ.Int; bits = 1}]}}]}};
           Ast.Return (Ast.Id (Symbol.fromString "answer"))]}};
    Ast.Procedure
     {id = Symbol.fromString "rfact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "==";
                rands = [Ast.Id (Symbol.fromString "n"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.App
                 {rator = Symbol.fromString "*";
                  rands =
                   [Ast.Id (Symbol.fromString "n");
                    Ast.App
                     {rator = Symbol.fromString "rfact";
                      rands =
                       [Ast.App
                         {rator = Symbol.fromString "-";
                          rands =
                           [Ast.Id (Symbol.fromString "n");
                            Ast.Literal {typ = Typ.Int; bits = 1}]}]}]})}]}};
    Ast.Procedure
     {id = Symbol.fromString "condfact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.If
              {expr =
                Ast.App
                 {rator = Symbol.fromString "==";
                  rands =
                   [Ast.Id (Symbol.fromString "n"); Ast.Literal {typ = Typ.Int; bits = 0}]};
               thn = Ast.Literal {typ = Typ.Int; bits = 1};
               els =
                Ast.App
                 {rator = Symbol.fromString "*";
                  rands =
                   [Ast.Id (Symbol.fromString "n");
                    Ast.App
                     {rator = Symbol.fromString "condfact";
                      rands =
                       [Ast.App
                         {rator = Symbol.fromString "-";
                          rands =
                           [Ast.Id (Symbol.fromString "n");
                            Ast.Literal {typ = Typ.Int; bits = 1}]}]}]}})]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "ifact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "rfact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "condfact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "ifact"; formals = [{id = Symbol.fromString "m"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "answer"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "answer";
             expr = Ast.Literal {typ = Typ.Int; bits = 1}};
           Ast.While
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x244"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "m")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x245"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x246"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">";
                            rands = [Ast.Id (Symbol.fromString "x244"); Ast.Id (Symbol.fromString "x245")]}};
                      body = Ast.Id (Symbol.fromString "x246")}}};
             statement =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "answer";
                    expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x238"; typ = Typ.Int};
                          defn = Ast.Id (Symbol.fromString "answer")};
                       body =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x239"; typ = Typ.Int};
                             defn = Ast.Id (Symbol.fromString "m")};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x240"; typ = Typ.Int};
                                defn =
                                 Ast.App
                                  {rator = Symbol.fromString "*";
                                   rands = [Ast.Id (Symbol.fromString "x238"); Ast.Id (Symbol.fromString "x239")]}};
                             body = Ast.Id (Symbol.fromString "x240")}}}};
                  Ast.Assign
                   {id = Symbol.fromString "n";
                    expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x241"; typ = Typ.Int};
                          defn = Ast.Id (Symbol.fromString "m")};
                       body =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x242"; typ = Typ.Int};
                             defn = Ast.Literal {typ = Typ.Int; bits = 1}};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x243"; typ = Typ.Int};
                                defn =
                                 Ast.App
                                  {rator = Symbol.fromString "-";
                                   rands = [Ast.Id (Symbol.fromString "x241"); Ast.Id (Symbol.fromString "x242")]}};
                             body = Ast.Id (Symbol.fromString "x243")}}}}]}};
           Ast.Return (Ast.Id (Symbol.fromString "answer"))]}};
    Ast.Procedure
     {id = Symbol.fromString "rfact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x255"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "n")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x256"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x257"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "==";
                            rands = [Ast.Id (Symbol.fromString "x255"); Ast.Id (Symbol.fromString "x256")]}};
                      body = Ast.Id (Symbol.fromString "x257")}}};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x247"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "n")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x248"; typ = Typ.Int};
                        defn =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x249"; typ = Typ.Int};
                              defn =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x250"; typ = Typ.Int};
                                    defn = Ast.Id (Symbol.fromString "n")};
                                 body =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv =
                                        {id = Symbol.fromString "x251"; typ = Typ.Int};
                                       defn =
                                        Ast.Literal
                                         {typ = Typ.Int; bits = 1}};
                                    body =
                                     Ast.Let
                                      {decl =
                                        Ast.ValBind
                                         {bv =
                                           {id = Symbol.fromString "x252"; typ = Typ.Int};
                                          defn =
                                           Ast.App
                                            {rator = Symbol.fromString "-";
                                             rands =
                                              [Ast.Id (Symbol.fromString "x250"); Ast.Id (Symbol.fromString "x251")]}};
                                       body = Ast.Id (Symbol.fromString "x252")}}}};
                           body =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x253"; typ = Typ.Int};
                                 defn =
                                  Ast.App
                                   {rator = Symbol.fromString "rfact";
                                    rands = [Ast.Id (Symbol.fromString "x249")]}};
                              body = Ast.Id (Symbol.fromString "x253")}}};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x254"; typ = Typ.Int};
                           defn =
                            Ast.App
                             {rator = Symbol.fromString "*";
                              rands = [Ast.Id (Symbol.fromString "x247"); Ast.Id (Symbol.fromString "x248")]}};
                        body = Ast.Id (Symbol.fromString "x254")}}})}]}};
    Ast.Procedure
     {id = Symbol.fromString "condfact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x258"; typ = Typ.Bool};
                  defn =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x267"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "n")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x268"; typ = Typ.Int};
                           defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x269"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "==";
                                 rands = [Ast.Id (Symbol.fromString "x267"); Ast.Id (Symbol.fromString "x268")]}};
                           body = Ast.Id (Symbol.fromString "x269")}}}};
               body =
                Ast.If
                 {expr = Ast.Id (Symbol.fromString "x258");
                  thn = Ast.Literal {typ = Typ.Int; bits = 1};
                  els =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x259"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "n")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x260"; typ = Typ.Int};
                           defn =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x261"; typ = Typ.Int};
                                 defn =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv =
                                        {id = Symbol.fromString "x262"; typ = Typ.Int};
                                       defn = Ast.Id (Symbol.fromString "n")};
                                    body =
                                     Ast.Let
                                      {decl =
                                        Ast.ValBind
                                         {bv =
                                           {id = Symbol.fromString "x263"; typ = Typ.Int};
                                          defn =
                                           Ast.Literal
                                            {typ = Typ.Int; bits = 1}};
                                       body =
                                        Ast.Let
                                         {decl =
                                           Ast.ValBind
                                            {bv =
                                              {id = Symbol.fromString "x264"; typ = Typ.Int};
                                             defn =
                                              Ast.App
                                               {rator = Symbol.fromString "-";
                                                rands =
                                                 [Ast.Id (Symbol.fromString "x262"); Ast.Id (Symbol.fromString "x263")]}};
                                          body = Ast.Id (Symbol.fromString "x264")}}}};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x265"; typ = Typ.Int};
                                    defn =
                                     Ast.App
                                      {rator = Symbol.fromString "condfact";
                                       rands = [Ast.Id (Symbol.fromString "x261")]}};
                                 body = Ast.Id (Symbol.fromString "x265")}}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x266"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "*";
                                 rands = [Ast.Id (Symbol.fromString "x259"); Ast.Id (Symbol.fromString "x260")]}};
                           body = Ast.Id (Symbol.fromString "x266")}}}}})]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x270"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x271"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "ifact"; rands = [Ast.Id (Symbol.fromString "x270")]}};
                  body = Ast.Id (Symbol.fromString "x271")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x272"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x273"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "rfact"; rands = [Ast.Id (Symbol.fromString "x272")]}};
                  body = Ast.Id (Symbol.fromString "x273")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x274"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x275"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "condfact"; rands = [Ast.Id (Symbol.fromString "x274")]}};
                  body = Ast.Id (Symbol.fromString "x275")}});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("fact.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "fact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "==";
                rands = [Ast.Id (Symbol.fromString "n"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.App
                 {rator = Symbol.fromString "*";
                  rands =
                   [Ast.Id (Symbol.fromString "n");
                    Ast.App
                     {rator = Symbol.fromString "fact";
                      rands =
                       [Ast.App
                         {rator = Symbol.fromString "-";
                          rands =
                           [Ast.Id (Symbol.fromString "n");
                            Ast.Literal {typ = Typ.Int; bits = 1}]}]}]})}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 9}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 10}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 11}]});
           Ast.Return
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "fact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x284"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "n")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x285"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x286"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "==";
                            rands = [Ast.Id (Symbol.fromString "x284"); Ast.Id (Symbol.fromString "x285")]}};
                      body = Ast.Id (Symbol.fromString "x286")}}};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x276"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "n")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x277"; typ = Typ.Int};
                        defn =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x278"; typ = Typ.Int};
                              defn =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x279"; typ = Typ.Int};
                                    defn = Ast.Id (Symbol.fromString "n")};
                                 body =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv =
                                        {id = Symbol.fromString "x280"; typ = Typ.Int};
                                       defn =
                                        Ast.Literal
                                         {typ = Typ.Int; bits = 1}};
                                    body =
                                     Ast.Let
                                      {decl =
                                        Ast.ValBind
                                         {bv =
                                           {id = Symbol.fromString "x281"; typ = Typ.Int};
                                          defn =
                                           Ast.App
                                            {rator = Symbol.fromString "-";
                                             rands =
                                              [Ast.Id (Symbol.fromString "x279"); Ast.Id (Symbol.fromString "x280")]}};
                                       body = Ast.Id (Symbol.fromString "x281")}}}};
                           body =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x282"; typ = Typ.Int};
                                 defn =
                                  Ast.App
                                   {rator = Symbol.fromString "fact";
                                    rands = [Ast.Id (Symbol.fromString "x278")]}};
                              body = Ast.Id (Symbol.fromString "x282")}}};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x283"; typ = Typ.Int};
                           defn =
                            Ast.App
                             {rator = Symbol.fromString "*";
                              rands = [Ast.Id (Symbol.fromString "x276"); Ast.Id (Symbol.fromString "x277")]}};
                        body = Ast.Id (Symbol.fromString "x283")}}})}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x287"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x288"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x287")]}};
                  body = Ast.Id (Symbol.fromString "x288")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x289"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 8}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x290"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x289")]}};
                  body = Ast.Id (Symbol.fromString "x290")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x291"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 9}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x292"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x291")]}};
                  body = Ast.Id (Symbol.fromString "x292")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x293"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 10}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x294"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x293")]}};
                  body = Ast.Id (Symbol.fromString "x294")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x295"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 11}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x296"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x295")]}};
                  body = Ast.Id (Symbol.fromString "x296")}});
           Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x297"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x298"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x297")]}};
                  body = Ast.Id (Symbol.fromString "x298")}})]}}]);
 ("cond2_inv.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls =
          [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Bool}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "a";
             expr =
              Ast.App
               {rator = Symbol.fromString "-";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 0};
                  Ast.Literal {typ = Typ.Int; bits = 2}]}};
           Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.App
               {rator = Symbol.fromString ">";
                rands =
                 [Ast.App
                   {rator = Symbol.fromString "-";
                    rands =
                     [Ast.Literal {typ = Typ.Int; bits = 0}; Ast.Id (Symbol.fromString "a")]};
                  Ast.Literal {typ = Typ.Int; bits = 3}]}};
           Ast.IfS
            {expr = Ast.App {rator = Symbol.fromString "not"; rands = [Ast.Id (Symbol.fromString "b")]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "not";
                rands =
                 [Ast.App
                   {rator = Symbol.fromString ">";
                    rands =
                     [Ast.Literal {typ = Typ.Int; bits = 3};
                      Ast.Literal {typ = Typ.Int; bits = 3}]}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "not";
                rands =
                 [Ast.App
                   {rator = Symbol.fromString ">";
                    rands =
                     [Ast.Literal {typ = Typ.Int; bits = 4};
                      Ast.Literal {typ = Typ.Int; bits = 3}]}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "not";
                rands =
                 [Ast.App
                   {rator = Symbol.fromString ">=";
                    rands =
                     [Ast.Literal {typ = Typ.Int; bits = 2};
                      Ast.Literal {typ = Typ.Int; bits = 3}]}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString ">=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 3};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString ">=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 4};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 3};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 4};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 3};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<=";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 4};
                  Ast.Literal {typ = Typ.Int; bits = 3}]};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]}};
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls =
          [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Bool}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "a";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x299"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x300"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x301"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "-";
                            rands = [Ast.Id (Symbol.fromString "x299"); Ast.Id (Symbol.fromString "x300")]}};
                      body = Ast.Id (Symbol.fromString "x301")}}}};
           Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x302"; typ = Typ.Int};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x304"; typ = Typ.Int};
                         defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x305"; typ = Typ.Int};
                            defn = Ast.Id (Symbol.fromString "a")};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x306"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "-";
                                  rands = [Ast.Id (Symbol.fromString "x304"); Ast.Id (Symbol.fromString "x305")]}};
                            body = Ast.Id (Symbol.fromString "x306")}}}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x303"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x307"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">";
                            rands = [Ast.Id (Symbol.fromString "x302"); Ast.Id (Symbol.fromString "x303")]}};
                      body = Ast.Id (Symbol.fromString "x307")}}}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x308"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "b")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x309"; typ = Typ.Int};
                      defn =
                       Ast.App {rator = Symbol.fromString "not"; rands = [Ast.Id (Symbol.fromString "x308")]}};
                   body = Ast.Id (Symbol.fromString "x309")}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x310"; typ = Typ.Int};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x311"; typ = Typ.Int};
                         defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x312"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x313"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString ">";
                                  rands = [Ast.Id (Symbol.fromString "x311"); Ast.Id (Symbol.fromString "x312")]}};
                            body = Ast.Id (Symbol.fromString "x313")}}}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x314"; typ = Typ.Int};
                      defn =
                       Ast.App {rator = Symbol.fromString "not"; rands = [Ast.Id (Symbol.fromString "x310")]}};
                   body = Ast.Id (Symbol.fromString "x314")}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x315"; typ = Typ.Int};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x316"; typ = Typ.Int};
                         defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x317"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x318"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString ">";
                                  rands = [Ast.Id (Symbol.fromString "x316"); Ast.Id (Symbol.fromString "x317")]}};
                            body = Ast.Id (Symbol.fromString "x318")}}}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x319"; typ = Typ.Int};
                      defn =
                       Ast.App {rator = Symbol.fromString "not"; rands = [Ast.Id (Symbol.fromString "x315")]}};
                   body = Ast.Id (Symbol.fromString "x319")}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x320"; typ = Typ.Int};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x321"; typ = Typ.Int};
                         defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x322"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x323"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString ">=";
                                  rands = [Ast.Id (Symbol.fromString "x321"); Ast.Id (Symbol.fromString "x322")]}};
                            body = Ast.Id (Symbol.fromString "x323")}}}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x324"; typ = Typ.Int};
                      defn =
                       Ast.App {rator = Symbol.fromString "not"; rands = [Ast.Id (Symbol.fromString "x320")]}};
                   body = Ast.Id (Symbol.fromString "x324")}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x325"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x326"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x327"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">=";
                            rands = [Ast.Id (Symbol.fromString "x325"); Ast.Id (Symbol.fromString "x326")]}};
                      body = Ast.Id (Symbol.fromString "x327")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x328"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x329"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x330"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">=";
                            rands = [Ast.Id (Symbol.fromString "x328"); Ast.Id (Symbol.fromString "x329")]}};
                      body = Ast.Id (Symbol.fromString "x330")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x331"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x332"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x333"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x331"); Ast.Id (Symbol.fromString "x332")]}};
                      body = Ast.Id (Symbol.fromString "x333")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x334"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x335"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x336"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x334"); Ast.Id (Symbol.fromString "x335")]}};
                      body = Ast.Id (Symbol.fromString "x336")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x337"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x338"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x339"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x337"); Ast.Id (Symbol.fromString "x338")]}};
                      body = Ast.Id (Symbol.fromString "x339")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x340"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x341"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x342"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<=";
                            rands = [Ast.Id (Symbol.fromString "x340"); Ast.Id (Symbol.fromString "x341")]}};
                      body = Ast.Id (Symbol.fromString "x342")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 230})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x343"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x344"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x345"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<=";
                            rands = [Ast.Id (Symbol.fromString "x343"); Ast.Id (Symbol.fromString "x344")]}};
                      body = Ast.Id (Symbol.fromString "x345")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 330})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x346"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x347"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x348"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<=";
                            rands = [Ast.Id (Symbol.fromString "x346"); Ast.Id (Symbol.fromString "x347")]}};
                      body = Ast.Id (Symbol.fromString "x348")}}};
             thn =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 10})]};
             els =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Print (Ast.Literal {typ = Typ.Int; bits = 430})]}};
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("e.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "g";
      formals = [{id = Symbol.fromString "x"; typ = Typ.Int}; {id = Symbol.fromString "y"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "+";
                rands =
                 [Ast.App
                   {rator = Symbol.fromString "+";
                    rands =
                     [Ast.Literal {typ = Typ.Int; bits = 2};
                      Ast.Literal {typ = Typ.Int; bits = 4}]};
                  Ast.Literal {typ = Typ.Int; bits = 6}]}};
           Ast.Return
            (Ast.App {rator = Symbol.fromString "+"; rands = [Ast.Id (Symbol.fromString "x"); Ast.Id (Symbol.fromString "y")]})]}};
    Ast.Procedure
     {id = Symbol.fromString "f";
      formals = [{id = Symbol.fromString "x"; typ = Typ.Int}; {id = Symbol.fromString "y"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "+";
                rands =
                 [Ast.App
                   {rator = Symbol.fromString "+";
                    rands =
                     [Ast.Literal {typ = Typ.Int; bits = 2};
                      Ast.Literal {typ = Typ.Int; bits = 4}]};
                  Ast.Literal {typ = Typ.Int; bits = 6}]}};
           Ast.Assign
            {id = Symbol.fromString "y";
             expr =
              Ast.App
               {rator = Symbol.fromString "g";
                rands =
                 [Ast.App
                   {rator = Symbol.fromString "*";
                    rands =
                     [Ast.Literal {typ = Typ.Int; bits = 4};
                      Ast.Literal {typ = Typ.Int; bits = 8}]};
                  Ast.App
                   {rator = Symbol.fromString "*";
                    rands =
                     [Ast.Literal {typ = Typ.Int; bits = 6};
                      Ast.Literal {typ = Typ.Int; bits = 10}]}]}};
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "+";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.Literal {typ = Typ.Int; bits = 2}]}}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "g";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 1};
                 Ast.Literal {typ = Typ.Int; bits = 2}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "g";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 3};
                 Ast.Literal {typ = Typ.Int; bits = 4}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "g";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 5};
                 Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "g";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 7};
                 Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "g";
      formals = [{id = Symbol.fromString "x"; typ = Typ.Int}; {id = Symbol.fromString "y"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x349"; typ = Typ.Int};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x351"; typ = Typ.Int};
                         defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x352"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x353"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "+";
                                  rands = [Ast.Id (Symbol.fromString "x351"); Ast.Id (Symbol.fromString "x352")]}};
                            body = Ast.Id (Symbol.fromString "x353")}}}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x350"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 6}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x354"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "+";
                            rands = [Ast.Id (Symbol.fromString "x349"); Ast.Id (Symbol.fromString "x350")]}};
                      body = Ast.Id (Symbol.fromString "x354")}}}};
           Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x355"; typ = Typ.Int}; defn = Ast.Id (Symbol.fromString "x")};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x356"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "y")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x357"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "+";
                           rands = [Ast.Id (Symbol.fromString "x355"); Ast.Id (Symbol.fromString "x356")]}};
                     body = Ast.Id (Symbol.fromString "x357")}}})]}};
    Ast.Procedure
     {id = Symbol.fromString "f";
      formals = [{id = Symbol.fromString "x"; typ = Typ.Int}; {id = Symbol.fromString "y"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x358"; typ = Typ.Int};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x360"; typ = Typ.Int};
                         defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x361"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x362"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "+";
                                  rands = [Ast.Id (Symbol.fromString "x360"); Ast.Id (Symbol.fromString "x361")]}};
                            body = Ast.Id (Symbol.fromString "x362")}}}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x359"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 6}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x363"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "+";
                            rands = [Ast.Id (Symbol.fromString "x358"); Ast.Id (Symbol.fromString "x359")]}};
                      body = Ast.Id (Symbol.fromString "x363")}}}};
           Ast.Assign
            {id = Symbol.fromString "y";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x364"; typ = Typ.Int};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x366"; typ = Typ.Int};
                         defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x367"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x368"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "*";
                                  rands = [Ast.Id (Symbol.fromString "x366"); Ast.Id (Symbol.fromString "x367")]}};
                            body = Ast.Id (Symbol.fromString "x368")}}}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x365"; typ = Typ.Int};
                      defn =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x369"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 6}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x370"; typ = Typ.Int};
                               defn =
                                Ast.Literal {typ = Typ.Int; bits = 10}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = Symbol.fromString "x371"; typ = Typ.Int};
                                  defn =
                                   Ast.App
                                    {rator = Symbol.fromString "*";
                                     rands = [Ast.Id (Symbol.fromString "x369"); Ast.Id (Symbol.fromString "x370")]}};
                               body = Ast.Id (Symbol.fromString "x371")}}}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x372"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "g";
                            rands = [Ast.Id (Symbol.fromString "x364"); Ast.Id (Symbol.fromString "x365")]}};
                      body = Ast.Id (Symbol.fromString "x372")}}}};
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x373"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x374"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x375"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "+";
                            rands = [Ast.Id (Symbol.fromString "x373"); Ast.Id (Symbol.fromString "x374")]}};
                      body = Ast.Id (Symbol.fromString "x375")}}}}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x376"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 1}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x377"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x378"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "g";
                           rands = [Ast.Id (Symbol.fromString "x376"); Ast.Id (Symbol.fromString "x377")]}};
                     body = Ast.Id (Symbol.fromString "x378")}}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x379"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 3}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x380"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x381"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "g";
                           rands = [Ast.Id (Symbol.fromString "x379"); Ast.Id (Symbol.fromString "x380")]}};
                     body = Ast.Id (Symbol.fromString "x381")}}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x382"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 5}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x383"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 6}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x384"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "g";
                           rands = [Ast.Id (Symbol.fromString "x382"); Ast.Id (Symbol.fromString "x383")]}};
                     body = Ast.Id (Symbol.fromString "x384")}}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x385"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x386"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x387"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "g";
                           rands = [Ast.Id (Symbol.fromString "x385"); Ast.Id (Symbol.fromString "x386")]}};
                     body = Ast.Id (Symbol.fromString "x387")}}});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("totient.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "mod";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands = [Ast.Id (Symbol.fromString "b"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0});
             els =
              Ast.While
               {expr =
                 Ast.App {rator = Symbol.fromString ">="; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]};
                statement =
                 Ast.Assign
                  {id = Symbol.fromString "a";
                   expr =
                    Ast.App {rator = Symbol.fromString "-"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]}}}};
           Ast.Return (Ast.Id (Symbol.fromString "a"))]}};
    Ast.Procedure
     {id = Symbol.fromString "abs"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands = [Ast.Id (Symbol.fromString "a"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn =
              Ast.Return
               (Ast.App
                 {rator = Symbol.fromString "-";
                  rands =
                   [Ast.Literal {typ = Typ.Int; bits = 0}; Ast.Id (Symbol.fromString "a")]});
             els = Ast.Return (Ast.Id (Symbol.fromString "a"))}]}};
    Ast.Procedure
     {id = Symbol.fromString "gcd";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "a";
             expr = Ast.App {rator = Symbol.fromString "abs"; rands = [Ast.Id (Symbol.fromString "a")]}};
           Ast.Assign
            {id = Symbol.fromString "b";
             expr = Ast.App {rator = Symbol.fromString "abs"; rands = [Ast.Id (Symbol.fromString "b")]}};
           Ast.IfS
            {expr =
              Ast.Or
               {left =
                 Ast.App
                  {rator = Symbol.fromString "==";
                   rands =
                    [Ast.Id (Symbol.fromString "a"); Ast.Literal {typ = Typ.Int; bits = 0}]};
                right =
                 Ast.App
                  {rator = Symbol.fromString "==";
                   rands =
                    [Ast.Id (Symbol.fromString "b"); Ast.Literal {typ = Typ.Int; bits = 0}]}};
             thn =
              Ast.Return
               (Ast.App {rator = Symbol.fromString "+"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]});
             els =
              Ast.IfS
               {expr =
                 Ast.App {rator = Symbol.fromString ">"; rands = [Ast.Id (Symbol.fromString "b"); Ast.Id (Symbol.fromString "a")]};
                thn =
                 Ast.Return
                  (Ast.App
                    {rator = Symbol.fromString "gcd";
                     rands =
                      [Ast.Id (Symbol.fromString "a");
                       Ast.App
                        {rator = Symbol.fromString "mod"; rands = [Ast.Id (Symbol.fromString "b"); Ast.Id (Symbol.fromString "a")]}]});
                els =
                 Ast.Return
                  (Ast.App
                    {rator = Symbol.fromString "gcd";
                     rands =
                      [Ast.App
                        {rator = Symbol.fromString "mod"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]};
                       Ast.Id (Symbol.fromString "b")]})}}]}};
    Ast.Procedure
     {id = Symbol.fromString "totient"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls =
          [{id = Symbol.fromString "count"; typ = Typ.Int};
           {id = Symbol.fromString "iteration"; typ = Typ.Int}];
         statements =
          [Ast.While
            {expr =
              Ast.App
               {rator = Symbol.fromString "<"; rands = [Ast.Id (Symbol.fromString "iteration"); Ast.Id (Symbol.fromString "a")]};
             statement =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "iteration";
                    expr =
                     Ast.App
                      {rator = Symbol.fromString "+";
                       rands =
                        [Ast.Id (Symbol.fromString "iteration");
                         Ast.Literal {typ = Typ.Int; bits = 1}]}};
                  Ast.IfS
                   {expr =
                     Ast.App
                      {rator = Symbol.fromString "==";
                       rands =
                        [Ast.App
                          {rator = Symbol.fromString "gcd";
                           rands = [Ast.Id (Symbol.fromString "iteration"); Ast.Id (Symbol.fromString "a")]};
                         Ast.Literal {typ = Typ.Int; bits = 1}]};
                    thn =
                     Ast.Assign
                      {id = Symbol.fromString "count";
                       expr =
                        Ast.App
                         {rator = Symbol.fromString "+";
                          rands =
                           [Ast.Id (Symbol.fromString "count");
                            Ast.Literal {typ = Typ.Int; bits = 1}]}};
                    els = Ast.Assign {id = Symbol.fromString "count"; expr = Ast.Id (Symbol.fromString "count")}}]}};
           Ast.Return (Ast.Id (Symbol.fromString "count"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Void;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "x"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "totient";
                rands = [Ast.Literal {typ = Typ.Int; bits = 1638}]}};
           Ast.Print (Ast.Id (Symbol.fromString "x"))]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "mod";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x394"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "b")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x395"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x396"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x394"); Ast.Id (Symbol.fromString "x395")]}};
                      body = Ast.Id (Symbol.fromString "x396")}}};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0});
             els =
              Ast.While
               {expr =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x391"; typ = Typ.Int};
                      defn = Ast.Id (Symbol.fromString "a")};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x392"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "b")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x393"; typ = Typ.Int};
                            defn =
                             Ast.App
                              {rator = Symbol.fromString ">=";
                               rands = [Ast.Id (Symbol.fromString "x391"); Ast.Id (Symbol.fromString "x392")]}};
                         body = Ast.Id (Symbol.fromString "x393")}}};
                statement =
                 Ast.Assign
                  {id = Symbol.fromString "a";
                   expr =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x388"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "a")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x389"; typ = Typ.Int};
                            defn = Ast.Id (Symbol.fromString "b")};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x390"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "-";
                                  rands = [Ast.Id (Symbol.fromString "x388"); Ast.Id (Symbol.fromString "x389")]}};
                            body = Ast.Id (Symbol.fromString "x390")}}}}}};
           Ast.Return (Ast.Id (Symbol.fromString "a"))]}};
    Ast.Procedure
     {id = Symbol.fromString "abs"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x400"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "a")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x401"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x402"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x400"); Ast.Id (Symbol.fromString "x401")]}};
                      body = Ast.Id (Symbol.fromString "x402")}}};
             thn =
              Ast.Return
               (Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x397"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x398"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "a")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x399"; typ = Typ.Int};
                           defn =
                            Ast.App
                             {rator = Symbol.fromString "-";
                              rands = [Ast.Id (Symbol.fromString "x397"); Ast.Id (Symbol.fromString "x398")]}};
                        body = Ast.Id (Symbol.fromString "x399")}}});
             els = Ast.Return (Ast.Id (Symbol.fromString "a"))}]}};
    Ast.Procedure
     {id = Symbol.fromString "gcd";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "a";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x403"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "a")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x404"; typ = Typ.Int};
                      defn =
                       Ast.App {rator = Symbol.fromString "abs"; rands = [Ast.Id (Symbol.fromString "x403")]}};
                   body = Ast.Id (Symbol.fromString "x404")}}};
           Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x405"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "b")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x406"; typ = Typ.Int};
                      defn =
                       Ast.App {rator = Symbol.fromString "abs"; rands = [Ast.Id (Symbol.fromString "x405")]}};
                   body = Ast.Id (Symbol.fromString "x406")}}};
           Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x425"; typ = Typ.Bool};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x429"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "a")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x430"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x431"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "==";
                                  rands = [Ast.Id (Symbol.fromString "x429"); Ast.Id (Symbol.fromString "x430")]}};
                            body = Ast.Id (Symbol.fromString "x431")}}}};
                body =
                 Ast.If
                  {expr = Ast.Id (Symbol.fromString "x425"); thn = Ast.Id (Symbol.fromString "x425");
                   els =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x426"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "b")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x427"; typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x428"; typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "==";
                                  rands = [Ast.Id (Symbol.fromString "x426"); Ast.Id (Symbol.fromString "x427")]}};
                            body = Ast.Id (Symbol.fromString "x428")}}}}};
             thn =
              Ast.Return
               (Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x422"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "a")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x423"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "b")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x424"; typ = Typ.Int};
                           defn =
                            Ast.App
                             {rator = Symbol.fromString "+";
                              rands = [Ast.Id (Symbol.fromString "x422"); Ast.Id (Symbol.fromString "x423")]}};
                        body = Ast.Id (Symbol.fromString "x424")}}});
             els =
              Ast.IfS
               {expr =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x419"; typ = Typ.Int};
                      defn = Ast.Id (Symbol.fromString "b")};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x420"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "a")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x421"; typ = Typ.Int};
                            defn =
                             Ast.App
                              {rator = Symbol.fromString ">";
                               rands = [Ast.Id (Symbol.fromString "x419"); Ast.Id (Symbol.fromString "x420")]}};
                         body = Ast.Id (Symbol.fromString "x421")}}};
                thn =
                 Ast.Return
                  (Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x413"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "a")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x414"; typ = Typ.Int};
                           defn =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x415"; typ = Typ.Int};
                                 defn = Ast.Id (Symbol.fromString "b")};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x416"; typ = Typ.Int};
                                    defn = Ast.Id (Symbol.fromString "a")};
                                 body =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv =
                                        {id = Symbol.fromString "x417"; typ = Typ.Int};
                                       defn =
                                        Ast.App
                                         {rator = Symbol.fromString "mod";
                                          rands =
                                           [Ast.Id (Symbol.fromString "x415"); Ast.Id (Symbol.fromString "x416")]}};
                                    body = Ast.Id (Symbol.fromString "x417")}}}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x418"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "gcd";
                                 rands = [Ast.Id (Symbol.fromString "x413"); Ast.Id (Symbol.fromString "x414")]}};
                           body = Ast.Id (Symbol.fromString "x418")}}});
                els =
                 Ast.Return
                  (Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x407"; typ = Typ.Int};
                        defn =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x409"; typ = Typ.Int};
                              defn = Ast.Id (Symbol.fromString "a")};
                           body =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x410"; typ = Typ.Int};
                                 defn = Ast.Id (Symbol.fromString "b")};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x411"; typ = Typ.Int};
                                    defn =
                                     Ast.App
                                      {rator = Symbol.fromString "mod";
                                       rands = [Ast.Id (Symbol.fromString "x409"); Ast.Id (Symbol.fromString "x410")]}};
                                 body = Ast.Id (Symbol.fromString "x411")}}}};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x408"; typ = Typ.Int};
                           defn = Ast.Id (Symbol.fromString "b")};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x412"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "gcd";
                                 rands = [Ast.Id (Symbol.fromString "x407"); Ast.Id (Symbol.fromString "x408")]}};
                           body = Ast.Id (Symbol.fromString "x412")}}})}}]}};
    Ast.Procedure
     {id = Symbol.fromString "totient"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls =
          [{id = Symbol.fromString "count"; typ = Typ.Int};
           {id = Symbol.fromString "iteration"; typ = Typ.Int}];
         statements =
          [Ast.While
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x444"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "iteration")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x445"; typ = Typ.Int};
                      defn = Ast.Id (Symbol.fromString "a")};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x446"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x444"); Ast.Id (Symbol.fromString "x445")]}};
                      body = Ast.Id (Symbol.fromString "x446")}}};
             statement =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "iteration";
                    expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x432"; typ = Typ.Int};
                          defn = Ast.Id (Symbol.fromString "iteration")};
                       body =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x433"; typ = Typ.Int};
                             defn = Ast.Literal {typ = Typ.Int; bits = 1}};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x434"; typ = Typ.Int};
                                defn =
                                 Ast.App
                                  {rator = Symbol.fromString "+";
                                   rands = [Ast.Id (Symbol.fromString "x432"); Ast.Id (Symbol.fromString "x433")]}};
                             body = Ast.Id (Symbol.fromString "x434")}}}};
                  Ast.IfS
                   {expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x438"; typ = Typ.Int};
                          defn =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x440"; typ = Typ.Int};
                                defn = Ast.Id (Symbol.fromString "iteration")};
                             body =
                              Ast.Let
                               {decl =
                                 Ast.ValBind
                                  {bv = {id = Symbol.fromString "x441"; typ = Typ.Int};
                                   defn = Ast.Id (Symbol.fromString "a")};
                                body =
                                 Ast.Let
                                  {decl =
                                    Ast.ValBind
                                     {bv = {id = Symbol.fromString "x442"; typ = Typ.Int};
                                      defn =
                                       Ast.App
                                        {rator = Symbol.fromString "gcd";
                                         rands = [Ast.Id (Symbol.fromString "x440"); Ast.Id (Symbol.fromString "x441")]}};
                                   body = Ast.Id (Symbol.fromString "x442")}}}};
                       body =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x439"; typ = Typ.Int};
                             defn = Ast.Literal {typ = Typ.Int; bits = 1}};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x443"; typ = Typ.Int};
                                defn =
                                 Ast.App
                                  {rator = Symbol.fromString "==";
                                   rands = [Ast.Id (Symbol.fromString "x438"); Ast.Id (Symbol.fromString "x439")]}};
                             body = Ast.Id (Symbol.fromString "x443")}}};
                    thn =
                     Ast.Assign
                      {id = Symbol.fromString "count";
                       expr =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x435"; typ = Typ.Int};
                             defn = Ast.Id (Symbol.fromString "count")};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x436"; typ = Typ.Int};
                                defn =
                                 Ast.Literal {typ = Typ.Int; bits = 1}};
                             body =
                              Ast.Let
                               {decl =
                                 Ast.ValBind
                                  {bv = {id = Symbol.fromString "x437"; typ = Typ.Int};
                                   defn =
                                    Ast.App
                                     {rator = Symbol.fromString "+";
                                      rands = [Ast.Id (Symbol.fromString "x435"); Ast.Id (Symbol.fromString "x436")]}};
                                body = Ast.Id (Symbol.fromString "x437")}}}};
                    els = Ast.Assign {id = Symbol.fromString "count"; expr = Ast.Id (Symbol.fromString "count")}}]}};
           Ast.Return (Ast.Id (Symbol.fromString "count"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Void;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "x"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x447"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 1638}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x448"; typ = Typ.Int};
                      defn =
                       Ast.App {rator = Symbol.fromString "totient"; rands = [Ast.Id (Symbol.fromString "x447")]}};
                   body = Ast.Id (Symbol.fromString "x448")}}};
           Ast.Print (Ast.Id (Symbol.fromString "x"))]}}]);
 ("a2.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "c"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "d"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "d";
             expr =
              Ast.App
               {rator = Symbol.fromString "+";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.App
                   {rator = Symbol.fromString "*";
                    rands =
                     [Ast.Id (Symbol.fromString "c"); Ast.Literal {typ = Typ.Int; bits = 8}]}]}};
           Ast.Return (Ast.Id (Symbol.fromString "d"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 5}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "c"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "d"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "d";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x449"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x450"; typ = Typ.Int};
                      defn =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x451"; typ = Typ.Int};
                            defn = Ast.Id (Symbol.fromString "c")};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x452"; typ = Typ.Int};
                               defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = Symbol.fromString "x453"; typ = Typ.Int};
                                  defn =
                                   Ast.App
                                    {rator = Symbol.fromString "*";
                                     rands = [Ast.Id (Symbol.fromString "x451"); Ast.Id (Symbol.fromString "x452")]}};
                               body = Ast.Id (Symbol.fromString "x453")}}}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x454"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "+";
                            rands = [Ast.Id (Symbol.fromString "x449"); Ast.Id (Symbol.fromString "x450")]}};
                      body = Ast.Id (Symbol.fromString "x454")}}}};
           Ast.Return (Ast.Id (Symbol.fromString "d"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x455"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 5}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x456"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x455")]}};
                  body = Ast.Id (Symbol.fromString "x456")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x457"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x458"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x457")]}};
                  body = Ast.Id (Symbol.fromString "x458")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x459"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x460"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x459")]}};
                  body = Ast.Id (Symbol.fromString "x460")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x461"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 8}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x462"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x461")]}};
                  body = Ast.Id (Symbol.fromString "x462")}});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("t1.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "mod";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "<";
                rands = [Ast.Id (Symbol.fromString "b"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0});
             els = Ast.Print (Ast.Id (Symbol.fromString "a"))};
           Ast.While
            {expr =
              Ast.App {rator = Symbol.fromString ">="; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]};
             statement =
              Ast.Assign
               {id = Symbol.fromString "a";
                expr =
                 Ast.App {rator = Symbol.fromString "-"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]}}};
           Ast.Print (Ast.Id (Symbol.fromString "a")); Ast.Return (Ast.Id (Symbol.fromString "a"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Call
            {rator = Symbol.fromString "mod";
             rands =
              [Ast.Literal {typ = Typ.Int; bits = 13};
               Ast.Literal {typ = Typ.Int; bits = 7}]};
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "mod";
      formals = [{id = Symbol.fromString "a"; typ = Typ.Int}; {id = Symbol.fromString "b"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x463"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "b")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x464"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x465"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "<";
                            rands = [Ast.Id (Symbol.fromString "x463"); Ast.Id (Symbol.fromString "x464")]}};
                      body = Ast.Id (Symbol.fromString "x465")}}};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0});
             els = Ast.Print (Ast.Id (Symbol.fromString "a"))};
           Ast.While
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x469"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "a")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x470"; typ = Typ.Int};
                      defn = Ast.Id (Symbol.fromString "b")};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x471"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">=";
                            rands = [Ast.Id (Symbol.fromString "x469"); Ast.Id (Symbol.fromString "x470")]}};
                      body = Ast.Id (Symbol.fromString "x471")}}};
             statement =
              Ast.Assign
               {id = Symbol.fromString "a";
                expr =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x466"; typ = Typ.Int};
                      defn = Ast.Id (Symbol.fromString "a")};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x467"; typ = Typ.Int};
                         defn = Ast.Id (Symbol.fromString "b")};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x468"; typ = Typ.Int};
                            defn =
                             Ast.App
                              {rator = Symbol.fromString "-";
                               rands = [Ast.Id (Symbol.fromString "x466"); Ast.Id (Symbol.fromString "x467")]}};
                         body = Ast.Id (Symbol.fromString "x468")}}}}};
           Ast.Print (Ast.Id (Symbol.fromString "a")); Ast.Return (Ast.Id (Symbol.fromString "a"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Call
            {rator = Symbol.fromString "mod";
             rands =
              [Ast.Literal {typ = Typ.Int; bits = 13};
               Ast.Literal {typ = Typ.Int; bits = 7}]};
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1})]}}]);
 ("fact2.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "fact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "==";
                rands = [Ast.Id (Symbol.fromString "n"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.App
                 {rator = Symbol.fromString "*";
                  rands =
                   [Ast.App
                     {rator = Symbol.fromString "fact";
                      rands =
                       [Ast.App
                         {rator = Symbol.fromString "-";
                          rands =
                           [Ast.Id (Symbol.fromString "n");
                            Ast.Literal {typ = Typ.Int; bits = 1}]}]};
                    Ast.Id (Symbol.fromString "n")]})}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 9}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 10}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 11}]});
           Ast.Return
            (Ast.App
              {rator = Symbol.fromString "fact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "fact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x480"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "n")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x481"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x482"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "==";
                            rands = [Ast.Id (Symbol.fromString "x480"); Ast.Id (Symbol.fromString "x481")]}};
                      body = Ast.Id (Symbol.fromString "x482")}}};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x472"; typ = Typ.Int};
                     defn =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x474"; typ = Typ.Int};
                           defn =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x475"; typ = Typ.Int};
                                 defn = Ast.Id (Symbol.fromString "n")};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x476"; typ = Typ.Int};
                                    defn =
                                     Ast.Literal {typ = Typ.Int; bits = 1}};
                                 body =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv =
                                        {id = Symbol.fromString "x477"; typ = Typ.Int};
                                       defn =
                                        Ast.App
                                         {rator = Symbol.fromString "-";
                                          rands =
                                           [Ast.Id (Symbol.fromString "x475"); Ast.Id (Symbol.fromString "x476")]}};
                                    body = Ast.Id (Symbol.fromString "x477")}}}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x478"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x474")]}};
                           body = Ast.Id (Symbol.fromString "x478")}}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x473"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "n")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x479"; typ = Typ.Int};
                           defn =
                            Ast.App
                             {rator = Symbol.fromString "*";
                              rands = [Ast.Id (Symbol.fromString "x472"); Ast.Id (Symbol.fromString "x473")]}};
                        body = Ast.Id (Symbol.fromString "x479")}}})}]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x483"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x484"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x483")]}};
                  body = Ast.Id (Symbol.fromString "x484")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x485"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 8}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x486"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x485")]}};
                  body = Ast.Id (Symbol.fromString "x486")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x487"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 9}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x488"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x487")]}};
                  body = Ast.Id (Symbol.fromString "x488")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x489"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 10}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x490"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x489")]}};
                  body = Ast.Id (Symbol.fromString "x490")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x491"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 11}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x492"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x491")]}};
                  body = Ast.Id (Symbol.fromString "x492")}});
           Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x493"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x494"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "fact"; rands = [Ast.Id (Symbol.fromString "x493")]}};
                  body = Ast.Id (Symbol.fromString "x494")}})]}}]);
 ("a.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "b"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.App
               {rator = Symbol.fromString "+";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 2};
                  Ast.App
                   {rator = Symbol.fromString "*";
                    rands =
                     [Ast.Id (Symbol.fromString "a"); Ast.Literal {typ = Typ.Int; bits = 8}]}]}};
           Ast.Return (Ast.Id (Symbol.fromString "b"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 5}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 7}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "f";
               rands = [Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "f"; formals = [{id = Symbol.fromString "a"; typ = Typ.Int}]; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "b"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "b";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x495"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x496"; typ = Typ.Int};
                      defn =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = Symbol.fromString "x497"; typ = Typ.Int};
                            defn = Ast.Id (Symbol.fromString "a")};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = Symbol.fromString "x498"; typ = Typ.Int};
                               defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = Symbol.fromString "x499"; typ = Typ.Int};
                                  defn =
                                   Ast.App
                                    {rator = Symbol.fromString "*";
                                     rands = [Ast.Id (Symbol.fromString "x497"); Ast.Id (Symbol.fromString "x498")]}};
                               body = Ast.Id (Symbol.fromString "x499")}}}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x500"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "+";
                            rands = [Ast.Id (Symbol.fromString "x495"); Ast.Id (Symbol.fromString "x496")]}};
                      body = Ast.Id (Symbol.fromString "x500")}}}};
           Ast.Return (Ast.Id (Symbol.fromString "b"))]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x501"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 5}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x502"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x501")]}};
                  body = Ast.Id (Symbol.fromString "x502")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x503"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x504"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x503")]}};
                  body = Ast.Id (Symbol.fromString "x504")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x505"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 7}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x506"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x505")]}};
                  body = Ast.Id (Symbol.fromString "x506")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x507"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 8}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x508"; typ = Typ.Int};
                     defn = Ast.App {rator = Symbol.fromString "f"; rands = [Ast.Id (Symbol.fromString "x507")]}};
                  body = Ast.Id (Symbol.fromString "x508")}});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("threefacts.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "ifact"; formals = [{id = Symbol.fromString "m"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "answer"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "answer";
             expr = Ast.Literal {typ = Typ.Int; bits = 1}};
           Ast.While
            {expr =
              Ast.App
               {rator = Symbol.fromString ">";
                rands = [Ast.Id (Symbol.fromString "m"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             statement =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "answer";
                    expr =
                     Ast.App
                      {rator = Symbol.fromString "*"; rands = [Ast.Id (Symbol.fromString "answer"); Ast.Id (Symbol.fromString "m")]}};
                  Ast.Assign
                   {id = Symbol.fromString "m";
                    expr =
                     Ast.App
                      {rator = Symbol.fromString "-";
                       rands =
                        [Ast.Id (Symbol.fromString "m"); Ast.Literal {typ = Typ.Int; bits = 1}]}}]}};
           Ast.Return (Ast.Id (Symbol.fromString "answer"))]}};
    Ast.Procedure
     {id = Symbol.fromString "rfact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.App
               {rator = Symbol.fromString "==";
                rands = [Ast.Id (Symbol.fromString "n"); Ast.Literal {typ = Typ.Int; bits = 0}]};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.App
                 {rator = Symbol.fromString "*";
                  rands =
                   [Ast.Id (Symbol.fromString "n");
                    Ast.App
                     {rator = Symbol.fromString "rfact";
                      rands =
                       [Ast.App
                         {rator = Symbol.fromString "-";
                          rands =
                           [Ast.Id (Symbol.fromString "n");
                            Ast.Literal {typ = Typ.Int; bits = 1}]}]}]})}]}};
    Ast.Procedure
     {id = Symbol.fromString "condfact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.If
              {expr =
                Ast.App
                 {rator = Symbol.fromString "==";
                  rands =
                   [Ast.Id (Symbol.fromString "n"); Ast.Literal {typ = Typ.Int; bits = 0}]};
               thn = Ast.Literal {typ = Typ.Int; bits = 1};
               els =
                Ast.App
                 {rator = Symbol.fromString "*";
                  rands =
                   [Ast.Id (Symbol.fromString "n");
                    Ast.App
                     {rator = Symbol.fromString "condfact";
                      rands =
                       [Ast.App
                         {rator = Symbol.fromString "-";
                          rands =
                           [Ast.Id (Symbol.fromString "n");
                            Ast.Literal {typ = Typ.Int; bits = 1}]}]}]}})]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.App
              {rator = Symbol.fromString "ifact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "rfact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "condfact";
               rands = [Ast.Literal {typ = Typ.Int; bits = 6}]});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "ifact"; formals = [{id = Symbol.fromString "m"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "answer"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "answer";
             expr = Ast.Literal {typ = Typ.Int; bits = 1}};
           Ast.While
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x515"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "m")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x516"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x517"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString ">";
                            rands = [Ast.Id (Symbol.fromString "x515"); Ast.Id (Symbol.fromString "x516")]}};
                      body = Ast.Id (Symbol.fromString "x517")}}};
             statement =
              Ast.Block
               {decls = [];
                statements =
                 [Ast.Assign
                   {id = Symbol.fromString "answer";
                    expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x509"; typ = Typ.Int};
                          defn = Ast.Id (Symbol.fromString "answer")};
                       body =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x510"; typ = Typ.Int};
                             defn = Ast.Id (Symbol.fromString "m")};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x511"; typ = Typ.Int};
                                defn =
                                 Ast.App
                                  {rator = Symbol.fromString "*";
                                   rands = [Ast.Id (Symbol.fromString "x509"); Ast.Id (Symbol.fromString "x510")]}};
                             body = Ast.Id (Symbol.fromString "x511")}}}};
                  Ast.Assign
                   {id = Symbol.fromString "m";
                    expr =
                     Ast.Let
                      {decl =
                        Ast.ValBind
                         {bv = {id = Symbol.fromString "x512"; typ = Typ.Int};
                          defn = Ast.Id (Symbol.fromString "m")};
                       body =
                        Ast.Let
                         {decl =
                           Ast.ValBind
                            {bv = {id = Symbol.fromString "x513"; typ = Typ.Int};
                             defn = Ast.Literal {typ = Typ.Int; bits = 1}};
                          body =
                           Ast.Let
                            {decl =
                              Ast.ValBind
                               {bv = {id = Symbol.fromString "x514"; typ = Typ.Int};
                                defn =
                                 Ast.App
                                  {rator = Symbol.fromString "-";
                                   rands = [Ast.Id (Symbol.fromString "x512"); Ast.Id (Symbol.fromString "x513")]}};
                             body = Ast.Id (Symbol.fromString "x514")}}}}]}};
           Ast.Return (Ast.Id (Symbol.fromString "answer"))]}};
    Ast.Procedure
     {id = Symbol.fromString "rfact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.IfS
            {expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x526"; typ = Typ.Int};
                   defn = Ast.Id (Symbol.fromString "n")};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x527"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x528"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "==";
                            rands = [Ast.Id (Symbol.fromString "x526"); Ast.Id (Symbol.fromString "x527")]}};
                      body = Ast.Id (Symbol.fromString "x528")}}};
             thn = Ast.Return (Ast.Literal {typ = Typ.Int; bits = 1});
             els =
              Ast.Return
               (Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x518"; typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "n")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x519"; typ = Typ.Int};
                        defn =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x520"; typ = Typ.Int};
                              defn =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x521"; typ = Typ.Int};
                                    defn = Ast.Id (Symbol.fromString "n")};
                                 body =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv =
                                        {id = Symbol.fromString "x522"; typ = Typ.Int};
                                       defn =
                                        Ast.Literal
                                         {typ = Typ.Int; bits = 1}};
                                    body =
                                     Ast.Let
                                      {decl =
                                        Ast.ValBind
                                         {bv =
                                           {id = Symbol.fromString "x523"; typ = Typ.Int};
                                          defn =
                                           Ast.App
                                            {rator = Symbol.fromString "-";
                                             rands =
                                              [Ast.Id (Symbol.fromString "x521"); Ast.Id (Symbol.fromString "x522")]}};
                                       body = Ast.Id (Symbol.fromString "x523")}}}};
                           body =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x524"; typ = Typ.Int};
                                 defn =
                                  Ast.App
                                   {rator = Symbol.fromString "rfact";
                                    rands = [Ast.Id (Symbol.fromString "x520")]}};
                              body = Ast.Id (Symbol.fromString "x524")}}};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x525"; typ = Typ.Int};
                           defn =
                            Ast.App
                             {rator = Symbol.fromString "*";
                              rands = [Ast.Id (Symbol.fromString "x518"); Ast.Id (Symbol.fromString "x519")]}};
                        body = Ast.Id (Symbol.fromString "x525")}}})}]}};
    Ast.Procedure
     {id = Symbol.fromString "condfact"; formals = [{id = Symbol.fromString "n"; typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x529"; typ = Typ.Bool};
                  defn =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x538"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "n")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x539"; typ = Typ.Int};
                           defn = Ast.Literal {typ = Typ.Int; bits = 0}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x540"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "==";
                                 rands = [Ast.Id (Symbol.fromString "x538"); Ast.Id (Symbol.fromString "x539")]}};
                           body = Ast.Id (Symbol.fromString "x540")}}}};
               body =
                Ast.If
                 {expr = Ast.Id (Symbol.fromString "x529");
                  thn = Ast.Literal {typ = Typ.Int; bits = 1};
                  els =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x530"; typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "n")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = Symbol.fromString "x531"; typ = Typ.Int};
                           defn =
                            Ast.Let
                             {decl =
                               Ast.ValBind
                                {bv = {id = Symbol.fromString "x532"; typ = Typ.Int};
                                 defn =
                                  Ast.Let
                                   {decl =
                                     Ast.ValBind
                                      {bv =
                                        {id = Symbol.fromString "x533"; typ = Typ.Int};
                                       defn = Ast.Id (Symbol.fromString "n")};
                                    body =
                                     Ast.Let
                                      {decl =
                                        Ast.ValBind
                                         {bv =
                                           {id = Symbol.fromString "x534"; typ = Typ.Int};
                                          defn =
                                           Ast.Literal
                                            {typ = Typ.Int; bits = 1}};
                                       body =
                                        Ast.Let
                                         {decl =
                                           Ast.ValBind
                                            {bv =
                                              {id = Symbol.fromString "x535"; typ = Typ.Int};
                                             defn =
                                              Ast.App
                                               {rator = Symbol.fromString "-";
                                                rands =
                                                 [Ast.Id (Symbol.fromString "x533"); Ast.Id (Symbol.fromString "x534")]}};
                                          body = Ast.Id (Symbol.fromString "x535")}}}};
                              body =
                               Ast.Let
                                {decl =
                                  Ast.ValBind
                                   {bv = {id = Symbol.fromString "x536"; typ = Typ.Int};
                                    defn =
                                     Ast.App
                                      {rator = Symbol.fromString "condfact";
                                       rands = [Ast.Id (Symbol.fromString "x532")]}};
                                 body = Ast.Id (Symbol.fromString "x536")}}};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = Symbol.fromString "x537"; typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "*";
                                 rands = [Ast.Id (Symbol.fromString "x530"); Ast.Id (Symbol.fromString "x531")]}};
                           body = Ast.Id (Symbol.fromString "x537")}}}}})]}};
    Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x541"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x542"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "ifact"; rands = [Ast.Id (Symbol.fromString "x541")]}};
                  body = Ast.Id (Symbol.fromString "x542")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x543"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x544"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "rfact"; rands = [Ast.Id (Symbol.fromString "x543")]}};
                  body = Ast.Id (Symbol.fromString "x544")}});
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x545"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 6}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x546"; typ = Typ.Int};
                     defn =
                      Ast.App {rator = Symbol.fromString "condfact"; rands = [Ast.Id (Symbol.fromString "x545")]}};
                  body = Ast.Id (Symbol.fromString "x546")}});
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}]);
 ("basic_ops.mc",
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "x"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "+";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 1};
                  Ast.Literal {typ = Typ.Int; bits = 2}]}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "+";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 1};
                 Ast.Literal {typ = Typ.Int; bits = 2}]});
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "-";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 3};
                  Ast.Literal {typ = Typ.Int; bits = 4}]}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "-";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 3};
                 Ast.Literal {typ = Typ.Int; bits = 4}]});
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "*";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 5};
                  Ast.Literal {typ = Typ.Int; bits = 6}]}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "/";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 37};
                  Ast.Literal {typ = Typ.Int; bits = 8}]}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Print
            (Ast.App
              {rator = Symbol.fromString "/";
               rands =
                [Ast.Literal {typ = Typ.Int; bits = 37};
                 Ast.Literal {typ = Typ.Int; bits = 8}]});
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.App
               {rator = Symbol.fromString "%";
                rands =
                 [Ast.Literal {typ = Typ.Int; bits = 37};
                  Ast.Literal {typ = Typ.Int; bits = 8}]}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}],
  Ast.Program
   [Ast.Procedure
     {id = Symbol.fromString "main"; formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = Symbol.fromString "x"; typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x547"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 1}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x548"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x549"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "+";
                            rands = [Ast.Id (Symbol.fromString "x547"); Ast.Id (Symbol.fromString "x548")]}};
                      body = Ast.Id (Symbol.fromString "x549")}}}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x550"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 1}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x551"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 2}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x552"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "+";
                           rands = [Ast.Id (Symbol.fromString "x550"); Ast.Id (Symbol.fromString "x551")]}};
                     body = Ast.Id (Symbol.fromString "x552")}}});
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x553"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x554"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x555"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "-";
                            rands = [Ast.Id (Symbol.fromString "x553"); Ast.Id (Symbol.fromString "x554")]}};
                      body = Ast.Id (Symbol.fromString "x555")}}}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x556"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 3}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x557"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 4}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x558"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "-";
                           rands = [Ast.Id (Symbol.fromString "x556"); Ast.Id (Symbol.fromString "x557")]}};
                     body = Ast.Id (Symbol.fromString "x558")}}});
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x559"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 5}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x560"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 6}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x561"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "*";
                            rands = [Ast.Id (Symbol.fromString "x559"); Ast.Id (Symbol.fromString "x560")]}};
                      body = Ast.Id (Symbol.fromString "x561")}}}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x562"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 37}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x563"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x564"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "/";
                            rands = [Ast.Id (Symbol.fromString "x562"); Ast.Id (Symbol.fromString "x563")]}};
                      body = Ast.Id (Symbol.fromString "x564")}}}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Print
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = Symbol.fromString "x565"; typ = Typ.Int};
                  defn = Ast.Literal {typ = Typ.Int; bits = 37}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = Symbol.fromString "x566"; typ = Typ.Int};
                     defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = Symbol.fromString "x567"; typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "/";
                           rands = [Ast.Id (Symbol.fromString "x565"); Ast.Id (Symbol.fromString "x566")]}};
                     body = Ast.Id (Symbol.fromString "x567")}}});
           Ast.Assign
            {id = Symbol.fromString "x";
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = Symbol.fromString "x568"; typ = Typ.Int};
                   defn = Ast.Literal {typ = Typ.Int; bits = 37}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = Symbol.fromString "x569"; typ = Typ.Int};
                      defn = Ast.Literal {typ = Typ.Int; bits = 8}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = Symbol.fromString "x570"; typ = Typ.Int};
                         defn =
                          Ast.App
                           {rator = Symbol.fromString "%";
                            rands = [Ast.Id (Symbol.fromString "x568"); Ast.Id (Symbol.fromString "x569")]}};
                      body = Ast.Id (Symbol.fromString "x570")}}}};
           Ast.Print (Ast.Id (Symbol.fromString "x"));
           Ast.Return (Ast.Literal {typ = Typ.Int; bits = 0})]}}])]


let tests2 =
  [("multiarg.mc",
  Ast.Program
   [Ast.Procedure
     {id = (Symbol.fromString "add3");
      formals =
       [{id = (Symbol.fromString "a"); typ = Typ.Int}; {id = (Symbol.fromString "b"); typ = Typ.Int};
        {id = (Symbol.fromString "c"); typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.App
              {rator = Symbol.fromString "+";
               rands =
                [Ast.App {rator = Symbol.fromString "+"; rands = [Ast.Id (Symbol.fromString "a"); Ast.Id (Symbol.fromString "b")]};
                 Ast.Id (Symbol.fromString "c")]})]}};
    Ast.Procedure
     {id = (Symbol.fromString "main"); formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = (Symbol.fromString "x"); typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = (Symbol.fromString "x");
             expr =
              Ast.App
               {rator = Symbol.fromString "add3";
                rands =
                 [Ast.App
                   {rator = Symbol.fromString "+";
                    rands =
                     [Ast.App
                       {rator = Symbol.fromString "+";
                        rands =
                         [Ast.Literal {typ = Typ.Int; bits = 1};
                          Ast.Literal {typ = Typ.Int; bits = 2}]};
                      Ast.Literal {typ = Typ.Int; bits = 3}]};
                  Ast.App
                   {rator = Symbol.fromString "+";
                    rands =
                     [Ast.App
                       {rator = Symbol.fromString "+";
                        rands =
                         [Ast.Literal {typ = Typ.Int; bits = 4};
                          Ast.Literal {typ = Typ.Int; bits = 5}]};
                      Ast.Literal {typ = Typ.Int; bits = 6}]};
                  Ast.App
                   {rator = Symbol.fromString "+";
                    rands =
                     [Ast.App
                       {rator = Symbol.fromString "+";
                        rands =
                         [Ast.Literal {typ = Typ.Int; bits = 7};
                          Ast.Literal {typ = Typ.Int; bits = 8}]};
                      Ast.Literal {typ = Typ.Int; bits = 9}]}]}};
           Ast.Return (Ast.Id (Symbol.fromString "x"))]}}],
  Ast.Program
   [Ast.Procedure
     {id = (Symbol.fromString "add3");
      formals =
       [{id = (Symbol.fromString "a"); typ = Typ.Int}; {id = (Symbol.fromString "b"); typ = Typ.Int};
        {id = (Symbol.fromString "c"); typ = Typ.Int}];
      typ = Typ.Int;
      body =
       Ast.Block
        {decls = [];
         statements =
          [Ast.Return
            (Ast.Let
              {decl =
                Ast.ValBind
                 {bv = {id = (Symbol.fromString "x1"); typ = Typ.Int};
                  defn =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = (Symbol.fromString "x3"); typ = Typ.Int};
                        defn = Ast.Id (Symbol.fromString "a")};
                     body =
                      Ast.Let
                       {decl =
                         Ast.ValBind
                          {bv = {id = (Symbol.fromString "x4"); typ = Typ.Int};
                           defn = Ast.Id (Symbol.fromString "b")};
                        body =
                         Ast.Let
                          {decl =
                            Ast.ValBind
                             {bv = {id = (Symbol.fromString "x5"); typ = Typ.Int};
                              defn =
                               Ast.App
                                {rator = Symbol.fromString "+";
                                 rands = [Ast.Id (Symbol.fromString "x3"); Ast.Id (Symbol.fromString "x4")]}};
                           body = Ast.Id (Symbol.fromString "x5")}}}};
               body =
                Ast.Let
                 {decl =
                   Ast.ValBind
                    {bv = {id = (Symbol.fromString "x2"); typ = Typ.Int};
                     defn = Ast.Id (Symbol.fromString "c")};
                  body =
                   Ast.Let
                    {decl =
                      Ast.ValBind
                       {bv = {id = (Symbol.fromString "x6"); typ = Typ.Int};
                        defn =
                         Ast.App
                          {rator = Symbol.fromString "+"; rands = [Ast.Id (Symbol.fromString "x1"); Ast.Id (Symbol.fromString "x2")]}};
                     body = Ast.Id (Symbol.fromString "x6")}}})]}};
    Ast.Procedure
     {id = (Symbol.fromString "main"); formals = []; typ = Typ.Int;
      body =
       Ast.Block
        {decls = [{id = (Symbol.fromString "x"); typ = Typ.Int}];
         statements =
          [Ast.Assign
            {id = (Symbol.fromString "x");
             expr =
              Ast.Let
               {decl =
                 Ast.ValBind
                  {bv = {id = (Symbol.fromString "x7"); typ = Typ.Int};
                   defn =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = (Symbol.fromString "x10"); typ = Typ.Int};
                         defn =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = (Symbol.fromString "x12"); typ = Typ.Int};
                               defn = Ast.Literal {typ = Typ.Int; bits = 1}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = (Symbol.fromString "x13"); typ = Typ.Int};
                                  defn =
                                   Ast.Literal {typ = Typ.Int; bits = 2}};
                               body =
                                Ast.Let
                                 {decl =
                                   Ast.ValBind
                                    {bv = {id = (Symbol.fromString "x14"); typ = Typ.Int};
                                     defn =
                                      Ast.App
                                       {rator = Symbol.fromString "+";
                                        rands = [Ast.Id (Symbol.fromString "x12"); Ast.Id (Symbol.fromString "x13")]}};
                                  body = Ast.Id (Symbol.fromString "x14")}}}};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = (Symbol.fromString "x11"); typ = Typ.Int};
                            defn = Ast.Literal {typ = Typ.Int; bits = 3}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = (Symbol.fromString "x15"); typ = Typ.Int};
                               defn =
                                Ast.App
                                 {rator = Symbol.fromString "+";
                                  rands = [Ast.Id (Symbol.fromString "x10"); Ast.Id (Symbol.fromString "x11")]}};
                            body = Ast.Id (Symbol.fromString "x15")}}}};
                body =
                 Ast.Let
                  {decl =
                    Ast.ValBind
                     {bv = {id = (Symbol.fromString "x8"); typ = Typ.Int};
                      defn =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = (Symbol.fromString "x16"); typ = Typ.Int};
                            defn =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = (Symbol.fromString "x18"); typ = Typ.Int};
                                  defn =
                                   Ast.Literal {typ = Typ.Int; bits = 4}};
                               body =
                                Ast.Let
                                 {decl =
                                   Ast.ValBind
                                    {bv = {id = (Symbol.fromString "x19"); typ = Typ.Int};
                                     defn =
                                      Ast.Literal {typ = Typ.Int; bits = 5}};
                                  body =
                                   Ast.Let
                                    {decl =
                                      Ast.ValBind
                                       {bv =
                                         {id = (Symbol.fromString "x20"); typ = Typ.Int};
                                        defn =
                                         Ast.App
                                          {rator = Symbol.fromString "+";
                                           rands = [Ast.Id (Symbol.fromString "x18"); Ast.Id (Symbol.fromString "x19")]}};
                                     body = Ast.Id (Symbol.fromString "x20")}}}};
                         body =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = (Symbol.fromString "x17"); typ = Typ.Int};
                               defn = Ast.Literal {typ = Typ.Int; bits = 6}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = (Symbol.fromString "x21"); typ = Typ.Int};
                                  defn =
                                   Ast.App
                                    {rator = Symbol.fromString "+";
                                     rands = [Ast.Id (Symbol.fromString "x16"); Ast.Id (Symbol.fromString "x17")]}};
                               body = Ast.Id (Symbol.fromString "x21")}}}};
                   body =
                    Ast.Let
                     {decl =
                       Ast.ValBind
                        {bv = {id = (Symbol.fromString "x9"); typ = Typ.Int};
                         defn =
                          Ast.Let
                           {decl =
                             Ast.ValBind
                              {bv = {id = (Symbol.fromString "x22"); typ = Typ.Int};
                               defn =
                                Ast.Let
                                 {decl =
                                   Ast.ValBind
                                    {bv = {id = (Symbol.fromString "x24"); typ = Typ.Int};
                                     defn =
                                      Ast.Literal {typ = Typ.Int; bits = 7}};
                                  body =
                                   Ast.Let
                                    {decl =
                                      Ast.ValBind
                                       {bv =
                                         {id = (Symbol.fromString "x25"); typ = Typ.Int};
                                        defn =
                                         Ast.Literal
                                          {typ = Typ.Int; bits = 8}};
                                     body =
                                      Ast.Let
                                       {decl =
                                         Ast.ValBind
                                          {bv =
                                            {id = (Symbol.fromString "x26"); typ = Typ.Int};
                                           defn =
                                            Ast.App
                                             {rator = Symbol.fromString "+";
                                              rands =
                                               [Ast.Id (Symbol.fromString "x24"); Ast.Id (Symbol.fromString "x25")]}};
                                        body = Ast.Id (Symbol.fromString "x26")}}}};
                            body =
                             Ast.Let
                              {decl =
                                Ast.ValBind
                                 {bv = {id = (Symbol.fromString "x23"); typ = Typ.Int};
                                  defn =
                                   Ast.Literal {typ = Typ.Int; bits = 9}};
                               body =
                                Ast.Let
                                 {decl =
                                   Ast.ValBind
                                    {bv = {id = (Symbol.fromString "x27"); typ = Typ.Int};
                                     defn =
                                      Ast.App
                                       {rator = Symbol.fromString "+";
                                        rands = [Ast.Id (Symbol.fromString "x22"); Ast.Id (Symbol.fromString "x23")]}};
                                  body = Ast.Id (Symbol.fromString "x27")}}}};
                      body =
                       Ast.Let
                        {decl =
                          Ast.ValBind
                           {bv = {id = (Symbol.fromString "x28"); typ = Typ.Int};
                            defn =
                             Ast.App
                              {rator = Symbol.fromString "add3";
                               rands = [Ast.Id (Symbol.fromString "x7"); Ast.Id (Symbol.fromString "x8"); Ast.Id (Symbol.fromString "x9")]}};
                         body = Ast.Id (Symbol.fromString "x28")}}}}};
           Ast.Return (Ast.Id (Symbol.fromString "x"))]}}])]


let tests = List.append tests1 tests2
